# I2C signals for MIPI 0
set_property PACKAGE_PIN G25 [get_ports iic_0_scl_io]; # LA05_P
set_property PACKAGE_PIN G26 [get_ports iic_0_sda_io]; # LA05_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

# PIN_SWAP signal
set_property PACKAGE_PIN K22 [get_ports {pin_swap[0]}]; # LA02_P
set_property IOSTANDARD LVCMOS12 [get_ports {pin_swap[0]}]

# GPIOs for MIPI camera 0
set_property PACKAGE_PIN J25 [get_ports {gpio_0_tri_o[0]}]; # LA08_P
set_property PACKAGE_PIN H26 [get_ports {gpio_0_tri_o[1]}]; # LA08_N
set_property PACKAGE_PIN D22 [get_ports {gpio_0_tri_o[2]}]; # LA07_P
set_property PACKAGE_PIN C23 [get_ports {gpio_0_tri_o[3]}]; # LA07_N
set_property PACKAGE_PIN J24 [get_ports {gpio_0_tri_o[4]}]; # LA04_P
set_property PACKAGE_PIN H24 [get_ports {gpio_0_tri_o[5]}]; # LA04_N
set_property PACKAGE_PIN F22 [get_ports {gpio_0_tri_o[6]}]; # LA10_P
set_property PACKAGE_PIN E22 [get_ports {gpio_0_tri_o[7]}]; # LA10_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_0_tri_o[*]}]

# Reserved GPIOs
set_property PACKAGE_PIN K23 [get_ports {rsvd_gpio_tri_o[0]}]; # LA02_N
set_property PACKAGE_PIN J21 [get_ports {rsvd_gpio_tri_o[1]}]; # LA03_P
set_property PACKAGE_PIN J22 [get_ports {rsvd_gpio_tri_o[2]}]; # LA03_N
set_property IOSTANDARD LVCMOS12 [get_ports {rsvd_gpio_tri_o[*]}]

# MIPI interface 0
set_property PACKAGE_PIN E24 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN D24 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN E19 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA12_P
set_property PACKAGE_PIN D19 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA12_N
set_property PACKAGE_PIN C21 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA13_P
set_property PACKAGE_PIN C22 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA13_N
set_property PACKAGE_PIN D20 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA14_P
set_property PACKAGE_PIN D21 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA14_N
set_property PACKAGE_PIN A18 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA15_P
set_property PACKAGE_PIN A19 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA15_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

