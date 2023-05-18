# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\mihal\development\fpga_2d_fir_filter\Firmware\fir_project_top\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\mihal\development\fpga_2d_fir_filter\Firmware\fir_project_top\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {fir_project_top}\
-hw {C:\Users\mihal\development\fpga_2d_fir_filter\Firmware\fir_project_top.xsa}\
-out {C:/Users/mihal/development/fpga_2d_fir_filter/Firmware}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {fir_project_top}
platform generate -quick
platform generate
