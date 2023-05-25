/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xuartns550.h"
#include "xparameters.h"
#include <math.h>
#include "stdlib.h"

#define ST_IDLE			0
#define ST_COEFF_RECV	1
#define ST_HYST			2
#define ST_INVALID		255

#define FIXED_POINT_FRACTIONAL_BITS 8
#define UART_DEVICE_ID		XPAR_AXI_UART16550_0_DEVICE_ID
#define UART_BUFFER_SIZE	2000
#define COEFF_BUFFER_SIZE	25

static XUartNs550 UartInst;
u8 RecvBuffer[UART_BUFFER_SIZE];

short float2fixed_point(float number)
{
	return (short)(round(number * (1 << FIXED_POINT_FRACTIONAL_BITS)));
}


int main()
{
    init_platform();

    int Status = ST_COEFF_RECV;
    int ReceivedCount = 0;
    uint8_t dataValid = 1;

    int array_indexer = 0;
    float coeff_array[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    int8_t signBit = 1;
    uint8_t decimalCount = 0;


	Status = XUartNs550_Initialize(&UartInst, UART_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XUartNs550_SelfTest(&UartInst);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = ST_COEFF_RECV;

	while(1)
	{
		ReceivedCount += XUartNs550_Recv(
							&UartInst,
							RecvBuffer + ReceivedCount,
							1);

		if (RecvBuffer[ReceivedCount-1] == '\n' && RecvBuffer[ReceivedCount-2] == '\r')
		{

			for(int i = 0; i < ReceivedCount; i++)
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
			ReceivedCount = 0;
			array_indexer = 0;

			for(int i = 0; i < 25; i++)
			{
				if(dataValid == 1)
				{
					u16 data;
					short orig_data = float2fixed_point(coeff_array[i]);
					data = orig_data;
					//memcpy(data, orig_data, 2);
					Xil_Out32(XPAR_M03_AXI_0_BASEADDR + i*4, data);
				}
				coeff_array[i] = 0;
			}

		}
	}
    cleanup_platform();
    return 0;
}
