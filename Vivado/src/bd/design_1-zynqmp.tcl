################################################################
# Block diagram build script for Zynq MP designs
################################################################

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

create_bd_design $block_name

current_bd_design $block_name

set parentCell [get_bd_cells /]

# Get object for parentCell
set parentObj [get_bd_cells $parentCell]
if { $parentObj == "" } {
   puts "ERROR: Unable to find parent cell <$parentCell>!"
   return
}

# Make sure parentObj is hier blk
set parentType [get_property TYPE $parentObj]
if { $parentType ne "hier" } {
   puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
   return
}

# Save current instance; Restore later
set oldCurInst [current_bd_instance .]

# Set parent object as current
current_bd_instance $parentObj

# Procedure for creating a MIPI pipe for one camera
proc create_mipi_pipe { index loc_dict } {
  set hier_obj [create_bd_cell -type hier mipi_$index]
  current_bd_instance $hier_obj
  
  # Create pins of the block
  create_bd_pin -dir I dphy_clk_200M
  create_bd_pin -dir I s_axi_lite_aclk
  create_bd_pin -dir I aresetn
  create_bd_pin -dir O mipi_sub_irq
  create_bd_pin -dir O demosaic_irq
  create_bd_pin -dir O vdma_irq
  create_bd_pin -dir O iic2intc_irpt
  
  # Create the interfaces of the block
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:mipi_phy_rtl:1.0 mipi_phy_if
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 GPIO
  
  # Add and configure the MIPI Subsystem IP
  set clk_pin [dict get $loc_dict clk pin]
  set clk_pin_name [dict get $loc_dict clk pin_name]
  set data0_pin [dict get $loc_dict data0 pin]
  set data0_pin_name [dict get $loc_dict data0 pin_name]
  set data1_pin [dict get $loc_dict data1 pin]
  set data1_pin_name [dict get $loc_dict data1 pin_name]
  set data2_pin [dict get $loc_dict data2 pin]
  set data2_pin_name [dict get $loc_dict data2 pin_name]
  set data3_pin [dict get $loc_dict data3 pin]
  set data3_pin_name [dict get $loc_dict data3 pin_name]
  set bank [dict get $loc_dict bank]
  set mipi_csi2_rx_subsyst [ create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem:5.1 mipi_csi2_rx_subsyst_0 ]
  set_property -dict [ list \
   CONFIG.CLK_LANE_IO_LOC $clk_pin \
   CONFIG.CLK_LANE_IO_LOC_NAME $clk_pin_name \
   CONFIG.CMN_NUM_LANES {4} \
   CONFIG.CMN_PXL_FORMAT {YUV422_8bit} \
   CONFIG.CMN_VC {0} \
   CONFIG.CSI_BUF_DEPTH {4096} \
   CONFIG.C_CSI_FILTER_USERDATATYPE {true} \
   CONFIG.C_DPHY_LANES {4} \
   CONFIG.C_HS_LINE_RATE {896} \
   CONFIG.C_HS_SETTLE_NS {146} \
   CONFIG.DATA_LANE0_IO_LOC $data0_pin \
   CONFIG.DATA_LANE0_IO_LOC_NAME $data0_pin_name \
   CONFIG.DATA_LANE1_IO_LOC $data1_pin \
   CONFIG.DATA_LANE1_IO_LOC_NAME $data1_pin_name \
   CONFIG.DATA_LANE2_IO_LOC $data2_pin \
   CONFIG.DATA_LANE2_IO_LOC_NAME $data2_pin_name \
   CONFIG.DATA_LANE3_IO_LOC $data3_pin \
   CONFIG.DATA_LANE3_IO_LOC_NAME $data3_pin_name \
   CONFIG.DPY_LINE_RATE {896} \
   CONFIG.HP_IO_BANK_SELECTION $bank \
   CONFIG.SupportLevel {1} \
  ] $mipi_csi2_rx_subsyst
 
 # THE BELOW SETTINGS ARE FOR VERIFICATION WITH DIGILENT PCAM ON THE PYNQ-ZU
 #
 # set mipi_csi2_rx_subsyst [create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem:5.1 mipi_csi2_rx_subsyst_0]
 # set_property -dict [ list \
 #  CONFIG.SupportLevel {1} \
 #  CONFIG.CMN_NUM_LANES {2} \
 #  CONFIG.CMN_PXL_FORMAT {RAW10} \
 #  CONFIG.C_DPHY_LANES {2} \
 #  CONFIG.C_EN_CSI_V2_0 {true} \
 #  CONFIG.C_HS_LINE_RATE {280} \
 #  CONFIG.C_HS_SETTLE_NS {170} \
 #  CONFIG.DPY_LINE_RATE {280} \
 # ] $mipi_csi2_rx_subsyst
 # 
 # THE ABOVE SETTINGS ARE FOR VERIFICATION WITH DIGILENT PCAM ON THE PYNQ-ZU
  
  # Add and configure the AXI Interconnect
  set axi_int_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect axi_int_0 ]
  set_property -dict [list \
  CONFIG.NUM_MI {6} \
  ] $axi_int_0
  
  # Add and configure the AXIS Subset Converter
  set subset_conv_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter subset_conv_0 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {1} \
   CONFIG.S_TDATA_NUM_BYTES {2} \
   CONFIG.TDATA_REMAP {tdata[9:2]} \
  ] $subset_conv_0
  
  # Add and configure the ILA
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila ila_0 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {true} \
   CONFIG.C_MONITOR_TYPE {AXI} \
   CONFIG.C_NUM_OF_PROBES {9} \
   CONFIG.C_SLOT_0_AXI_PROTOCOL {AXI4S} \
  ] $ila_0
  
  # Add and configure demosaic
  set v_demosaic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_demosaic demosaic_0 ]
  set_property -dict [ list \
   CONFIG.MAX_COLS {2048} \
   CONFIG.MAX_DATA_WIDTH {8} \
   CONFIG.MAX_ROWS {1024} \
  ] $v_demosaic_0
  
  # Add and configure the AXIS Subset Converter
  set subset_conv_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter subset_conv_1 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC PROPAGATED \
   CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC PROPAGATED \
  ] $subset_conv_1
  
  # Add and configure the Pixel packer
  set pixel_pack_0 [create_bd_cell -type ip -vlnv xilinx.com:hls:pixel_pack:1.0 pixel_pack_0]
 
  # Add and configure the VDMA for writing only
  set vdma_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 axi_vdma_0]
  set_property -dict [list \
  CONFIG.c_mm2s_genlock_mode {0} \
  CONFIG.c_include_mm2s {0} \
  ] $vdma_0
  
  # Add and configure AXI IIC
  set axi_iic [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0]
  
  # Add and configure AXI GPIO
  set axi_gpio [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0]
  set_property -dict [list CONFIG.C_GPIO_WIDTH {8} CONFIG.C_ALL_OUTPUTS {1}] $axi_gpio
  
  # Connect the 200M D-PHY clock
  connect_bd_net [get_bd_pins dphy_clk_200M] [get_bd_pins mipi_csi2_rx_subsyst_0/dphy_clk_200M]
  # Connect the 100M video clock
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins subset_conv_0/aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_0/s_axis_s2mm_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins ila_0/clk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins demosaic_0/ap_clk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins pixel_pack_0/ap_clk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins subset_conv_1/aclk]
  # Connect the 100M AXI-Lite clock
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/S00_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M00_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M01_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M02_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M03_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M04_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_int_0/M05_ACLK]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_0/s_axi_lite_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_vdma_0/m_axi_s2mm_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_iic_0/s_axi_aclk]
  connect_bd_net [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk]
  # Connect the AXI-Lite resets
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/S00_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M00_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M01_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M02_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M03_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M04_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_int_0/M05_ARESETN] -boundary_type upper
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins subset_conv_0/aresetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins subset_conv_1/aresetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/lite_aresetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins mipi_csi2_rx_subsyst_0/video_aresetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins demosaic_0/ap_rst_n]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins pixel_pack_0/ap_rst_n]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_vdma_0/axi_resetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn]
  connect_bd_net [get_bd_pins aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
  # Connect AXI Lite interfaces
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_int_0/S00_AXI]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M00_AXI] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/csirxss_s_axi]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M01_AXI] [get_bd_intf_pins demosaic_0/s_axi_CTRL]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M02_AXI] [get_bd_intf_pins pixel_pack_0/s_axi_control]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M03_AXI] [get_bd_intf_pins axi_vdma_0/S_AXI_LITE]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M04_AXI] [get_bd_intf_pins axi_iic_0/S_AXI]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_int_0/M05_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
  # Connect the AXI Streaming interfaces
  connect_bd_intf_net [get_bd_intf_pins mipi_csi2_rx_subsyst_0/video_out] [get_bd_intf_pins subset_conv_0/S_AXIS]
  connect_bd_intf_net [get_bd_intf_pins ila_0/SLOT_0_AXIS] [get_bd_intf_pins subset_conv_0/S_AXIS]
  connect_bd_intf_net [get_bd_intf_pins subset_conv_0/M_AXIS] [get_bd_intf_pins demosaic_0/s_axis_video]
  connect_bd_intf_net [get_bd_intf_pins demosaic_0/m_axis_video] [get_bd_intf_pins subset_conv_1/S_AXIS]
  connect_bd_intf_net [get_bd_intf_pins subset_conv_1/M_AXIS] [get_bd_intf_pins pixel_pack_0/stream_in_24]
  connect_bd_intf_net [get_bd_intf_pins pixel_pack_0/stream_out_32] [get_bd_intf_pins axi_vdma_0/S_AXIS_S2MM]
  # Connect the MIPI D-PHY interface
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins mipi_phy_if] [get_bd_intf_pins mipi_csi2_rx_subsyst_0/mipi_phy_if]
  # Connect the VDMA AXI MM interface
  connect_bd_intf_net [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins axi_vdma_0/M_AXI_S2MM]
  # Connect the I2C interface
  connect_bd_intf_net [get_bd_intf_pins IIC] [get_bd_intf_pins axi_iic_0/IIC]
  # Connect the GPIO interface
  connect_bd_intf_net [get_bd_intf_pins GPIO] [get_bd_intf_pins axi_gpio_0/GPIO]
  # Connect interrupts
  connect_bd_net [get_bd_pins mipi_sub_irq] [get_bd_pins mipi_csi2_rx_subsyst_0/csirxss_csi_irq]
  connect_bd_net [get_bd_pins demosaic_irq] [get_bd_pins demosaic_0/interrupt]
  connect_bd_net [get_bd_pins vdma_irq] [get_bd_pins axi_vdma_0/s2mm_introut]
  connect_bd_net [get_bd_pins iic2intc_irpt] [get_bd_pins axi_iic_0/iic2intc_irpt]
  
  current_bd_instance \
}

# AXI Lite ports
set axi_lite_ports {}

# List of interrupt pins
set intr_list {}

# Add the Processor System and apply board preset
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]

# Disable all of the GP ports
set_property -dict [list CONFIG.PSU__USE__S_AXI_GP0 {1} \
CONFIG.PSU__USE__M_AXI_GP0 {1} \
CONFIG.PSU__USE__M_AXI_GP1 {0} \
CONFIG.PSU__USE__M_AXI_GP2 {0} \
CONFIG.PSU__USE__IRQ0 {1} \
] [get_bd_cells zynq_ultra_ps_e_0]

# Add a processor system reset
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset rst_ps_100M
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins rst_ps_100M/slowest_sync_clk]
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0] [get_bd_pins rst_ps_100M/ext_reset_in]

# Add and configure the clock wizard
set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0 ]
set_property -dict [ list \
 CONFIG.CLKOUT1_JITTER {137.772} \
 CONFIG.CLKOUT1_PHASE_ERROR {164.344} \
 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
 CONFIG.CLKOUT2_JITTER {144.436} \
 CONFIG.CLKOUT2_PHASE_ERROR {164.344} \
 CONFIG.CLKOUT2_USED {true} \
 CONFIG.MMCM_CLKFBOUT_MULT_F {21.000} \
 CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.250} \
 CONFIG.MMCM_CLKOUT1_DIVIDE {7} \
 CONFIG.NUM_OUT_CLKS {2} \
 CONFIG.RESET_PORT {resetn} \
 CONFIG.RESET_TYPE {ACTIVE_LOW} \
] $clk_wiz_0
connect_bd_net [get_bd_pins zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins clk_wiz_0/clk_in1]
connect_bd_net [get_bd_pins rst_ps_100M/peripheral_aresetn] [get_bd_pins clk_wiz_0/resetn]

# Connect PS interface clocks
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins zynq_ultra_ps_e_0/saxihpc0_fpd_aclk]

# Add and configure reset processor system for the video and AXI clock
set rst_ps_axi_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset rst_ps_axi_100M ]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins rst_ps_axi_100M/slowest_sync_clk]
connect_bd_net [get_bd_pins rst_ps_100M/peripheral_aresetn] [get_bd_pins rst_ps_axi_100M/ext_reset_in]
connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins rst_ps_axi_100M/dcm_locked]

# Add and configure AXI interrupt controller with concat
set axi_interrupt [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 axi_intc_0]
set concat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins axi_intc_0/s_axi_aclk]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins axi_intc_0/intr]
connect_bd_net [get_bd_pins axi_intc_0/irq] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins axi_intc_0/s_axi_aresetn]
lappend axi_lite_ports [list "axi_intc_0/s_axi" "clk_wiz_0/clk_out2" "rst_ps_axi_100M/peripheral_aresetn"]

# Add constant for the PIN_SWAP pin (1 for UltraZed-EV Carrier and Genesys ZU, 0 for all other boards)
set pin_swap [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 pin_swap]
if { ($target == "uzev") || ($target == "genesyszu") } {
  set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] $pin_swap
} else {
  set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] $pin_swap
}
create_bd_port -dir O pin_swap
connect_bd_net [get_bd_ports pin_swap] [get_bd_pins pin_swap/dout]

# Add and configure AXI GPIO
set rsvd_gpio [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 rsvd_gpio]
set_property -dict [list CONFIG.C_GPIO_WIDTH {3} CONFIG.C_ALL_OUTPUTS {1}] $rsvd_gpio
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins rsvd_gpio/s_axi_aclk]
connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins rsvd_gpio/s_axi_aresetn]
lappend axi_lite_ports [list "rsvd_gpio/S_AXI" "clk_wiz_0/clk_out2" "rst_ps_axi_100M/peripheral_aresetn"]
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 rsvd_gpio
connect_bd_intf_net [get_bd_intf_pins rsvd_gpio/GPIO] [get_bd_intf_ports rsvd_gpio]

# THE BELOW CONSTANT IS FOR VERIFICATION WITH DIGILENT PCAM ON THE PYNQ-ZU
#
# # Add constant to enable the camera
# create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 cam_enable_0
# create_bd_port -dir O cam_enable
# connect_bd_net [get_bd_ports cam_enable] [get_bd_pins cam_enable_0/dout]
#
# THE ABOVE CONSTANT IS FOR VERIFICATION WITH DIGILENT PCAM ON THE PYNQ-ZU

# Add the AXI SmartConnect for the VDMAs
create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins smartconnect_0/aclk]
connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins smartconnect_0/aresetn]
connect_bd_intf_net [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HPC0_FPD]
set_property -dict [list CONFIG.NUM_SI $num_cams] [get_bd_cells smartconnect_0]

# Add the MIPI pipes
for {set i 0} {$i < $num_cams} {incr i} {
  # Create the MIPI pipe block
  create_mipi_pipe $i [dict get $mipi_loc_dict $target $i]
  # Externalize all of the strobe propagation pins
  set strobe_pins [get_bd_pins mipi_$i/mipi_csi2_rx_subsyst_0/bg*_nc]
  foreach strobe $strobe_pins {
    set strobe_pin_name [file tail $strobe]
    create_bd_port -dir I mipi_${i}_$strobe_pin_name
    connect_bd_net [get_bd_ports mipi_${i}_$strobe_pin_name] [get_bd_pins $strobe]
  }
  # Connect clocks
  connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins mipi_$i/dphy_clk_200M]
  connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins mipi_$i/s_axi_lite_aclk]
  # Connect reset
  connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins mipi_$i/aresetn]
  # Add interrupts to the interrupt list to be connected later
  lappend intr_list "mipi_$i/mipi_sub_irq"
  lappend intr_list "mipi_$i/demosaic_irq"
  lappend intr_list "mipi_$i/vdma_irq"
  lappend intr_list "mipi_$i/iic2intc_irpt"
  
  # AXI Lite interfaces to be connected later
  lappend axi_lite_ports [list "mipi_$i/S_AXI_LITE" "clk_wiz_0/clk_out2" "rst_ps_axi_100M/peripheral_aresetn"]
  # Connect the MIPI D-Phy interface
  create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:mipi_phy_rtl:1.0 mipi_phy_if_$i
  connect_bd_intf_net [get_bd_intf_ports mipi_phy_if_$i] -boundary_type upper [get_bd_intf_pins mipi_$i/mipi_phy_if]
  # Connect the I2C interface
  create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_$i
  connect_bd_intf_net [get_bd_intf_ports iic_$i] [get_bd_intf_pins mipi_$i/IIC]
  # Connect the GPIO interface
  create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_$i
  connect_bd_intf_net [get_bd_intf_ports gpio_$i] [get_bd_intf_pins mipi_$i/GPIO]
  # Connect the AXI MM interface of the VDMA
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins mipi_$i/M_AXI_S2MM] [get_bd_intf_pins smartconnect_0/S0${i}_AXI]
}

# Add AXI Interconnect for the AXI Lite interfaces

set n_periph_ports [llength $axi_lite_ports]
set axi_periph_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_periph_0]
set_property -dict [list CONFIG.NUM_MI $n_periph_ports] $axi_periph_0
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins axi_periph_0/ACLK]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins axi_periph_0/S00_ACLK]
connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins axi_periph_0/ARESETN]
connect_bd_net [get_bd_pins rst_ps_axi_100M/peripheral_aresetn] [get_bd_pins axi_periph_0/S00_ARESETN]
connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD] -boundary_type upper [get_bd_intf_pins axi_periph_0/S00_AXI]
# Attach all of the ports, their clocks and resets
set port_num 0
foreach port $axi_lite_ports {
  puts $port
  set port_label [lindex $port 0]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_periph_0/M0${port_num}_AXI] [get_bd_intf_pins $port_label]
  set port_clk [lindex $port 1]
  connect_bd_net [get_bd_pins $port_clk] [get_bd_pins axi_periph_0/M0${port_num}_ACLK]
  set port_rst [lindex $port 2]
  connect_bd_net [get_bd_pins $port_rst] [get_bd_pins axi_periph_0/M0${port_num}_ARESETN]
  set port_num [expr {$port_num+1}]
}

# Connect the interrupts
set n_interrupts [llength $intr_list]
set_property -dict [list CONFIG.NUM_PORTS $n_interrupts] $concat
set intr_index 0
foreach intr $intr_list {
  connect_bd_net [get_bd_pins $intr] [get_bd_pins xlconcat_0/In$intr_index]
  set intr_index [expr {$intr_index+1}]
}

# Assign addresses
assign_bd_address

# Restore current instance
current_bd_instance $oldCurInst

save_bd_design
