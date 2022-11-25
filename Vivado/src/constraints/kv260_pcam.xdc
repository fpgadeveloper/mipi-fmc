# PCam Enable signal
set_property PACKAGE_PIN F11 [get_ports {cam_enable[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cam_enable[0]}]

# I2C signals for MIPI 0
set_property PACKAGE_PIN G11 [get_ports iic_0_scl_io];
set_property PACKAGE_PIN F10 [get_ports iic_0_sda_io];
set_property IOSTANDARD LVCMOS33 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

