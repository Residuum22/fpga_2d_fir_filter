import serial
import numpy

my_serial = serial.Serial(port='COM9', baudrate=19200)

laplace_matrix = [
    [0, 0, -1, 0, 0],
    [0, -1, -2, -1, 0],
    [-1, -2, 16, -2, -1],
    [0, -1, -2, -1, 0],
    [0, 0, -1, 0, 0]
]

gauss_matrix_kernel = [
    [1, 4, 7, 4, 1],
    [4, 16, 26, 16, 4],
    [7, 26, 41, 26, 7],
    [4, 16, 26, 16, 4],
    [1, 4, 7, 4, 1]
]

gaussian_filter = numpy.multiply(gauss_matrix_kernel, 1/273)

def main():
    print('The following matrixes are avaliable:')
    print('0: Laplace filter')
    print('1: Gauss filter')
    ans = input('> ')
    
    out_string = str()
    if ans == '0':
        matrix2send = laplace_matrix
    elif ans == '1':
        matrix2send = gaussian_filter
    
    for i, matrix_rows in enumerate(matrix2send):
        for j, matrix_cols in enumerate(matrix_rows):
            if i == 4 and j == 4:
                out_string += f'{round(matrix_cols, 4)}\r\n'
            else:
                out_string += f'{round(matrix_cols, 4)} '
    
    print(out_string)
    my_serial.write(out_string.encode())

if __name__ == "__main__":
    main()

