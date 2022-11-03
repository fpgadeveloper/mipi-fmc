# Opsero Electronic Design Inc. Copyright 2022
#
# Project build script
#
# This script requires the target name to be specified upon launch. This can be done
# in two ways:
#
#   1. Using a single argument passed to the script via tclargs.
#      eg. vivado -mode batch -source build.tcl -notrace -tclargs <target-name>
#
#   2. By setting the target variable before sourcing the script.
#      eg. set target <target-name>
#          source build.tcl -notrace
#
# The valid target names are:
#   * zcu104       * zcu102_hpc0  * zcu102_hpc1  * zcu106_hpc0   * zcu106_hpc1 
#   * pynqzu       * genesyszu    * uzev         * vcu118_hpc    * vcu118_fmcp
#
#*****************************************************************************************

# Check the version of Vivado used
set version_required "2020.2"
set ver [lindex [split $::env(XILINX_VIVADO) /] end]
if {![string equal $ver $version_required]} {
  puts "###############################"
  puts "### Failed to build project ###"
  puts "###############################"
  puts "This project was designed for use with Vivado $version_required."
  puts "You are using Vivado $ver. Please install Vivado $version_required,"
  puts "or download the project sources from a commit of the Git repository"
  puts "that was intended for your version of Vivado ($ver)."
  return
}

# Possible targets
dict set target_dict zcu104 { xczu7ev-ffvc1156-2-e xilinx.com:zcu104:part0:1.1 2 zynqmp }
dict set target_dict zcu102_hpc0 { xczu9eg-ffvb1156-2-e xilinx.com:zcu102:part0:3.4 2 zynqmp }
dict set target_dict zcu102_hpc1 { xczu9eg-ffvb1156-2-e xilinx.com:zcu102:part0:3.4 1 zynqmp }
dict set target_dict zcu106_hpc0 { xc7z045ffg900-2 xilinx.com:zcu106:part0:2.6 2 zynqmp }
dict set target_dict zcu106_hpc1 { xc7z045ffg900-2 xilinx.com:zcu106:part0:2.6 1 zynqmp }
dict set target_dict pynqzu { xczu5eg-sfvc784-1-e tul.com.tw:pynqzu:part0:1.1 2 zynqmp }
dict set target_dict genesyszu { xczu5ev-sfvc784-1-e digilentinc.com:gzu_5ev:part0:1.1 2 zynqmp }
dict set target_dict uzev { xczu7ev-fbvb900-1-i avnet.com:ultrazed_7ev_cc:part0:1.4 2 zynqmp }
dict set target_dict vcu118_hpc { xcvu9p-flga2104-2L-e xilinx.com:vcu118:part0:2.4 2 mb }
dict set target_dict vcu118_fmcp { xcvu9p-flga2104-2L-e xilinx.com:vcu118:part0:2.4 2 mb }

if { $argc == 1 } {
  set target [lindex $argv 0]
  puts "Target for the build: $target"
} elseif { [info exists target] && [dict exists $target_dict $target] } {
  puts "Target for the build: $target"
} else {
  puts ""
  if { [info exists target] } {
    puts "ERROR: Invalid target $target"
    puts ""
  }
  puts "The build script requires one argument to specify the design to build."
  puts "Possible values are:"
  puts "   * zcu104       * zcu102_hpc0  * zcu102_hpc1  * zcu106_hpc0   * zcu106_hpc1"
  puts "   * pynqzu       * genesyszu    * uzev         * vcu118_hpc    * vcu118_fmcp"
  puts ""
  puts "Example 1 (from the Windows command line):"
  puts "   vivado -mode batch -source build.tcl -notrace -tclargs zcu106-hpc0"
  puts ""
  puts "Example 2 (from Vivado Tcl console):"
  puts "   set target zcu106-hpc0"
  puts "   source build.tcl -notrace"
  return
}

set design_name ${target}_mipi
set block_name mipi
set fpga_part [lindex [dict get $target_dict $target] 0]
set board_part [lindex [dict get $target_dict $target] 1]
set num_cams [lindex [dict get $target_dict $target] 2]
set bd_script [lindex [dict get $target_dict $target] 3]

# MIPI pin LOC constraints are specified in the configuration of the MIPI subsystem IPs.
# We store this information for each target in a dictionary for use by the script that builds the block diagram.
dict set mipi_loc_dict zcu104 0 bank 67
dict set mipi_loc_dict zcu104 0 clk_p { pin H18 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu104 0 data0_p { pin L17 pin_name IO_L24P_T3U_N10_67 }
dict set mipi_loc_dict zcu104 0 data1_p { pin K17 pin_name IO_L21P_T3L_N4_AD8P_67 }
dict set mipi_loc_dict zcu104 0 data2_p { pin J16 pin_name IO_L20P_T3L_N2_AD1P_67 }
dict set mipi_loc_dict zcu104 0 data3_p { pin E18 pin_name IO_L9P_T1L_N4_AD12P_67 }
dict set mipi_loc_dict zcu104 1 bank 68
dict set mipi_loc_dict zcu104 1 clk_p { pin D11 pin_name IO_L16P_T2U_N6_QBC_AD3P_68 }
dict set mipi_loc_dict zcu104 1 data0_p { pin F11 pin_name IO_L14P_T2L_N2_GC_68 }
dict set mipi_loc_dict zcu104 1 data1_p { pin H13 pin_name IO_L15P_T2L_N4_AD11P_68 }
dict set mipi_loc_dict zcu104 1 data2_p { pin B11 pin_name IO_L24P_T3U_N10_68 }
dict set mipi_loc_dict zcu104 1 data3_p { pin B6 pin_name IO_L21P_T3L_N4_AD8P_68 }
dict set mipi_loc_dict zcu102_hpc0 0 bank 66
dict set mipi_loc_dict zcu102_hpc0 0 clk_p { pin AB4 pin_name IO_L16P_T2U_N6_QBC_AD3P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data0_p { pin AA2 pin_name IO_L21P_T3L_N4_AD8P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data1_p { pin AB3 pin_name IO_L20P_T3L_N2_AD1P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data2_p { pin U5 pin_name IO_L18P_T2U_N10_AD2P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data3_p { pin V4 pin_name IO_L17P_T2U_N8_AD10P_66 }
dict set mipi_loc_dict zcu102_hpc0 1 bank 67
dict set mipi_loc_dict zcu102_hpc0 1 clk_p { pin N9 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data0_p { pin P11 pin_name IO_L13P_T2L_N0_GC_QBC_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data1_p { pin M15 pin_name IO_L20P_T3L_N2_AD1P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data2_p { pin L16 pin_name IO_L19P_T3L_N0_DBC_AD9P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data3_p { pin L12 pin_name IO_L18P_T2U_N10_AD2P_67 }
dict set mipi_loc_dict zcu102_hpc1 0 bank 65
dict set mipi_loc_dict zcu102_hpc1 0 clk_p { pin AJ6 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data0_p { pin AF2 pin_name IO_L21P_T3L_N4_AD8P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data1_p { pin AG3 pin_name IO_L20P_T3L_N2_AD1P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data2_p { pin AD4 pin_name IO_L18P_T2U_N10_AD2P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data3_p { pin AE3 pin_name IO_L17P_T2U_N8_AD10P_65 }
dict set mipi_loc_dict zcu106_hpc0 0 bank 67
dict set mipi_loc_dict zcu106_hpc0 0 clk_p { pin H18 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data0_p { pin L17 pin_name IO_L24P_T3U_N10_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data1_p { pin K17 pin_name IO_L21P_T3L_N4_AD8P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data2_p { pin J16 pin_name IO_L20P_T3L_N2_AD1P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data3_p { pin E18 pin_name IO_L9P_T1L_N4_AD12P_67 }
dict set mipi_loc_dict zcu106_hpc0 1 bank 68
dict set mipi_loc_dict zcu106_hpc0 1 clk_p { pin D11 pin_name IO_L16P_T2U_N6_QBC_AD3P_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data0_p { pin F11 pin_name IO_L14P_T2L_N2_GC_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data1_p { pin H13 pin_name IO_L15P_T2L_N4_AD11P_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data2_p { pin B11 pin_name IO_L24P_T3U_N10_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data3_p { pin B6 pin_name IO_L21P_T3L_N4_AD8P_68 }
dict set mipi_loc_dict zcu106_hpc1 0 bank 28
dict set mipi_loc_dict zcu106_hpc1 0 clk_p { pin E24 pin_name IO_L16P_T2U_N6_QBC_AD3P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data0_p { pin J24 pin_name IO_L6P_T0U_N10_AD6P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data1_p { pin G25 pin_name IO_L18P_T2U_N10_AD2P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data2_p { pin D22 pin_name IO_L17P_T2U_N8_AD10P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data3_p { pin J25 pin_name IO_L5P_T0U_N8_AD14P_28 }
dict set mipi_loc_dict uzev 0 bank 64
dict set mipi_loc_dict uzev 0 clk_p { pin AG13 pin_name IO_L7P_T1L_N0_QBC_AD13P_64 }
dict set mipi_loc_dict uzev 0 data0_p { pin AH17 pin_name IO_L21P_T3L_N4_AD8P_64 }
dict set mipi_loc_dict uzev 0 data1_p { pin AD19 pin_name IO_L18P_T2U_N10_AD2P_64 }
dict set mipi_loc_dict uzev 0 data2_p { pin AA16 pin_name IO_L16P_T2U_N6_QBC_AD3P_64 }
dict set mipi_loc_dict uzev 0 data3_p { pin AJ16 pin_name IO_L20P_T3L_N2_AD1P_64 }
dict set mipi_loc_dict uzev 1 bank 65
dict set mipi_loc_dict uzev 1 clk_p { pin AH6 pin_name IO_L13P_T2L_N0_GC_QBC_65 }
dict set mipi_loc_dict uzev 1 data0_p { pin AG6 pin_name IO_L14P_T2L_N2_GC_65 }
dict set mipi_loc_dict uzev 1 data1_p { pin AF12 pin_name IO_L2P_T0L_N2_65 }
dict set mipi_loc_dict uzev 1 data2_p { pin AJ5 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict uzev 1 data3_p { pin AK7 pin_name IO_L15P_T2L_N4_AD11P_65 }
dict set mipi_loc_dict pynqzu 0 bank 65
dict set mipi_loc_dict pynqzu 0 clk_p { pin P7 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict pynqzu 0 data0_p { pin H9 pin_name IO_L24P_T3U_N10_PERSTN1_I2C_SDA_65 }
dict set mipi_loc_dict pynqzu 0 data1_p { pin J1 pin_name IO_L8P_T1L_N2_AD5P_65 }
dict set mipi_loc_dict pynqzu 0 data2_p { pin J6 pin_name IO_L20P_T3L_N2_AD1P_65 }
dict set mipi_loc_dict pynqzu 0 data3_p { pin J5 pin_name IO_L19P_T3L_N0_DBC_AD9P_65 }
dict set mipi_loc_dict pynqzu 1 bank 64
dict set mipi_loc_dict pynqzu 1 clk_p { pin AD2 pin_name IO_L16P_T2U_N6_QBC_AD3P_64 }
dict set mipi_loc_dict pynqzu 1 data0_p { pin AC4 pin_name IO_L14P_T2L_N2_GC_64 }
dict set mipi_loc_dict pynqzu 1 data1_p { pin AB1 pin_name IO_L18P_T2U_N10_AD2P_64 }
dict set mipi_loc_dict pynqzu 1 data2_p { pin AC9 pin_name IO_L1P_T0L_N0_DBC_64 }
dict set mipi_loc_dict pynqzu 1 data3_p { pin AG3 pin_name IO_L20P_T3L_N2_AD1P_64 }
dict set mipi_loc_dict genesyszu 0 bank 65
dict set mipi_loc_dict genesyszu 0 clk_p { pin H4 pin_name IO_L10P_T1U_N6_QBC_AD4P_65 }
dict set mipi_loc_dict genesyszu 0 data0_p { pin K2 pin_name IO_L9P_T1L_N4_AD12P_65 }
dict set mipi_loc_dict genesyszu 0 data1_p { pin R6 pin_name IO_L6P_T0U_N10_AD6P_65 }
dict set mipi_loc_dict genesyszu 0 data2_p { pin K9 pin_name IO_L23P_T3U_N8_I2C_SCLK_65 }
dict set mipi_loc_dict genesyszu 0 data3_p { pin R7 pin_name IO_L5P_T0U_N8_AD14P_65 }
dict set mipi_loc_dict genesyszu 1 bank 64
dict set mipi_loc_dict genesyszu 1 clk_p { pin AG9 pin_name IO_L7P_T1L_N0_QBC_AD13P_64 }
dict set mipi_loc_dict genesyszu 1 data0_p { pin AD2 pin_name IO_L16P_T2U_N6_QBC_AD3P_64 }
dict set mipi_loc_dict genesyszu 1 data1_p { pin AB8 pin_name IO_L3P_T0L_N4_AD15P_64 }
dict set mipi_loc_dict genesyszu 1 data2_p { pin AH2 pin_name IO_L23P_T3U_N8_64 }
dict set mipi_loc_dict genesyszu 1 data3_p { pin AF7 pin_name IO_L11P_T1U_N8_GC_64 }
dict set mipi_loc_dict vcu118_hpc 0 bank 66
dict set mipi_loc_dict vcu118_hpc 0 clk_p { pin BF10 pin_name IO_L10P_T1U_N6_QBC_AD4P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data0_p { pin BF12 pin_name IO_L2P_T0L_N2_66 }
dict set mipi_loc_dict vcu118_hpc 0 data1_p { pin BE14 pin_name IO_L5P_T0U_N8_AD14P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data2_p { pin BC15 pin_name IO_L21P_T3L_N4_AD8P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data3_p { pin BE15 pin_name IO_L6P_T0U_N10_AD6P_66 }
dict set mipi_loc_dict vcu118_hpc 1 bank 67
dict set mipi_loc_dict vcu118_hpc 1 clk_p { pin AP12 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict vcu118_hpc 1 data0_p { pin AR14 pin_name IO_L13P_T2L_N0_GC_QBC_67 }
dict set mipi_loc_dict vcu118_hpc 1 data1_p { pin AW13 pin_name IO_L5P_T0U_N8_AD14P_67 }
dict set mipi_loc_dict vcu118_hpc 1 data2_p { pin AN16 pin_name IO_L17P_T2U_N8_AD10P_67 }
dict set mipi_loc_dict vcu118_hpc 1 data3_p { pin AP13 pin_name IO_L14P_T2L_N2_GC_67 }
dict set mipi_loc_dict vcu118_fmcp 0 bank 43
dict set mipi_loc_dict vcu118_fmcp 0 clk_p { pin AL30 pin_name IO_L16P_T2U_N6_QBC_AD3P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data0_p { pin AR37 pin_name IO_L6P_T0U_N10_AD6P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data1_p { pin AP38 pin_name IO_L1P_T0L_N0_DBC_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data2_p { pin AP36 pin_name IO_L5P_T0U_N8_AD14P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data3_p { pin AK29 pin_name IO_L18P_T2U_N10_AD2P_43 }
dict set mipi_loc_dict vcu118_fmcp 1 bank 45
dict set mipi_loc_dict vcu118_fmcp 1 clk_p { pin R31 pin_name IO_L10P_T1U_N6_QBC_AD4P_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data0_p { pin R34 pin_name IO_L13P_T2L_N0_GC_QBC_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data1_p { pin N34 pin_name IO_L20P_T3L_N2_AD1P_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data2_p { pin Y32 pin_name IO_L1P_T0L_N0_DBC_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data3_p { pin T34 pin_name IO_L6P_T0U_N10_AD6P_45 }

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/$design_name"]"

# Create project
create_project $design_name $origin_dir/$design_name -part ${fpga_part}

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "$board_part" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/$design_name.cache/ip" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "[file normalize "$origin_dir/../HLS"]" $obj

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "${block_name}_wrapper" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/src/constraints/${target}.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/src/constraints/${target}.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property "target_constrs_file" "[file normalize "$origin_dir/src/constraints/${target}.xdc"]" $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "${block_name}_wrapper" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part ${fpga_part} -flow {Vivado Synthesis 2020} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2020" [get_runs synth_1]
}
set obj [get_runs synth_1]

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part ${fpga_part} -flow {Vivado Implementation 2020} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2020" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:${design_name}"

# Create block design
source $origin_dir/src/bd/design_1-${bd_script}.tcl

# Generate the wrapper
make_wrapper -files [get_files *${block_name}.bd] -top
add_files -norecurse ${design_name}/${design_name}.gen/sources_1/bd/${block_name}/hdl/${block_name}_wrapper.v

# Update the compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Ensure parameter propagation has been performed
close_bd_design [current_bd_design]
open_bd_design [get_files ${block_name}.bd]
validate_bd_design -force
save_bd_design

