# 2D FIR filter on Kintex-7 FPGA

## Getting started

To develop the project first you need Xilinx Vivado 2022.2. Only the most important files are version controlled for example: source files, constraits and ips. To make a Vivado project from the sources make sure to use the following steps:

Open `Vivado tcl Shell` and `cd` into your cloned repository:
*Comment: Use normal slashes on all supported operating system*
For example in my case:
```
$ cd C:/Users/mihal/development/fpga_2d_fir_filter
```
Check your workdir with `pwd`
```
$ pwd
> C:/Users/mihal/development/fpga_2d_fir_filter
```
Run vivado like below:
```
$ vivado -source rebuild.tcl
```
The command above will generate a directory with the name `fir_filter_prj` where the vivado project file can be accessed. If new source, new constrait is added into the project make sure to create it outside of the project into the `src` and `cons` directories. If new file is added then you need to create a new tcl script with the following (write it into the tcl console):
```
write_project_tcl <path_to_repository>/rebuild.tcl
```