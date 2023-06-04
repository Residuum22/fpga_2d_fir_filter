#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xuartns550.h"
#include "xparameters.h"
#include <math.h>
#include "stdlib.h"
#include "xgpio.h"
#include "xintc.h"
#include "stdbool.h"

#define ST_IDLE			0
#define ST_COEFF_RECV	1
#define ST_HYST			2
#define ST_INVALID		255

#define FIXED_POINT_FRACTIONAL_BITS 8
#define COEFF_BUFFER_SIZE	25

// Define UART DEVICE ID, buffer size and create buffer for received data
#define UART_DEVICE_ID		XPAR_AXI_UART16550_0_DEVICE_ID
#define UART_BUFFER_SIZE	2000
// Uart high level driver instance declaration
static XUartNs550 UartInst;
u8 RecvBuffer[UART_BUFFER_SIZE];

#define GPIO_DEVICE_ID	XPAR_AXI_GPIO_0_DEVICE_ID
// GPIO high level driver instance
static XGpio GPIOInst;

#define INT_DEVICE_ID 	XPAR_INTC_0_DEVICE_ID
// High level driver for external interrupt.
// This interrupt will be used for histogram valid data output port.
static XIntc IntcInst;

// This function convert float into a fixed point value with the given
// fractional bits.
short float2fixed_point(float number)
{
	return (short)(round(number * (1 << FIXED_POINT_FRACTIONAL_BITS)));
}

// Default initialization of the GPIO pheripheral. This will start the histogram calculator.
void GPIO_Init()
{
	XGpio_Initialize(&GPIOInst, GPIO_DEVICE_ID);
}

// Default initialization of the UART16650 pheripheral. 
// Self test is important to make sure the pheriheral syntetized correctly.
int UART_Init()
{
	int Status = ST_COEFF_RECV;
	Status = XUartNs550_Initialize(&UartInst, UART_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XUartNs550_SelfTest(&UartInst);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

// This functuon convert the float coefficients into 16bit fix point values
// and send all the 25 coeff to the coeff2axi module over axi lite.
void send_coeff_axi(float* coeff_array)
{
	for(int i = 0; i < 25; i++)
	{
		u16 data;
		short orig_data = float2fixed_point(coeff_array[i]);
		data = orig_data;
		Xil_Out32(XPAR_M03_AXI_0_BASEADDR + i*4, data);
	}
}

// This function convert string data to float coefficients.
int process_coeff(u8* RecvBuffer, int* ReceivedCount, float* coeff_array)
{
    int array_indexer = 0;
    uint8_t dataValid = 1;
    int8_t signBit = 1;
    uint8_t decimalCount = 0;

    int Status = ST_COEFF_RECV;

	for(int i = 0; i < *ReceivedCount; i++)
	{
		char c = RecvBuffer[i];

		if(Status == ST_COEFF_RECV)
		{

			if(c != 'H' && c != '\n' && c != '\r')
			{
				// get signbit
				if(c == '+')
					signBit = 1;
				else if(c == '-')
					signBit = -1;
				// if digit, calculate number
				else if(isdigit(c) && signBit != 0)
					if(decimalCount == 0)
						coeff_array[array_indexer] = coeff_array[array_indexer] * 10 + (int)(c - '0');
					else
						coeff_array[array_indexer] = coeff_array[array_indexer] + (int)(c - '0') * pow(0.1, decimalCount++);
				// decimal point
				else if(c == '.' && decimalCount == 0)
					decimalCount = 1;
				// going to next coeff
				else if(c == ' ' && array_indexer != 24)
				{
					coeff_array[array_indexer] *= signBit;
					array_indexer++;
					decimalCount = 0;
					signBit = 1;
				}
				// everything else makes the data invalid
				else
				{
					Status = ST_INVALID;
					break;
				}
			}
		}
	}

	if(array_indexer != 24 || Status == ST_INVALID)
		dataValid = 0;
	else
		dataValid = 1;

	Status = ST_COEFF_RECV;
	*ReceivedCount = 0;
	array_indexer = 0;

	return dataValid;
}

// This function generate an impulse on the gpio pheripheral
void get_histogram()
{
	XGpio_DiscreteSet(&GPIOInst, 1, 1 << 0);
	XGpio_DiscreteClear(&GPIOInst, 1, 1 << 0);
}

static bool histogram_flag = false;

// Histogram handler function is just set a flag
// to get the fastest execution time. 
void interrupt_handler()
{
	histogram_flag = true;
}

// Initialize interrupt, do a self test, connect and start. 
// Initialize exception also. 
int interrupt_init()
{
	int Status;

	Status = XIntc_Initialize(&IntcInst, INT_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIntc_SelfTest(&IntcInst);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIntc_Connect(&IntcInst, INT_DEVICE_ID,
				   (XInterruptHandler)interrupt_handler,
				   (void *)0);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XIntc_Start(&IntcInst, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XIntc_Enable(&IntcInst, INT_DEVICE_ID);

	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler)XIntc_InterruptHandler,
				&IntcInst);

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

int main()
{
    init_platform();

    int Status = ST_COEFF_RECV;
    int ReceivedCount = 0;
    float coeff_array[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    // Init uart and self test.
	Status = UART_Init();
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// Init GPIO
	GPIO_Init();

	interrupt_init();

	Status = ST_COEFF_RECV;

	while(1)
	{
		ReceivedCount += XUartNs550_Recv(&UartInst, RecvBuffer + ReceivedCount, 1);

		if (histogram_flag)
		{
			char sendBuffer[255];
			u32 data;
			u32 buffer[256];
			for (int i = 0; i < 256; i++)
			{
				data = Xil_In32(XPAR_M04_AXI_0_BASEADDR + i*4);
				buffer[i] = data;
			}

			for (int i = 0; i < 256; i++)
			{
				sprintf(sendBuffer, "%ld,", (u32)buffer[i]);
				while (XUartNs550_Send(&UartInst, (u8*)sendBuffer, strlen(sendBuffer)) == 0);
			}
			histogram_flag = false;
		}

		if (RecvBuffer[ReceivedCount-1] == '\n' && RecvBuffer[ReceivedCount-2] == '\r')
		{
			char first_element = *RecvBuffer;
			if (first_element == 'H')
			{
				get_histogram();
				ReceivedCount = 0;
			}
			else if (process_coeff(RecvBuffer, &ReceivedCount, coeff_array) == 1)
			{
				send_coeff_axi(coeff_array);
			}
		}
	}
    cleanup_platform();
    return 0;
}
