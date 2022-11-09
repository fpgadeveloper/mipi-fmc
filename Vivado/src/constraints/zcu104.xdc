# I2C signals for MIPI 0
set_property PACKAGE_PIN K17 [get_ports iic_0_scl_io]; # LA05_P
set_property PACKAGE_PIN J17 [get_ports iic_0_sda_io]; # LA05_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

# I2C signals for MIPI 1
set_property PACKAGE_PIN D12 [get_ports iic_1_scl_io]; # LA19_P
set_property PACKAGE_PIN C11 [get_ports iic_1_sda_io]; # LA19_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_1_*]
set_property SLEW SLOW [get_ports iic_1_*]
set_property DRIVE 4 [get_ports iic_1_*]

# PIN_SWAP signal
set_property PACKAGE_PIN L20 [get_ports {pin_swap[0]}]; # LA02_P
set_property IOSTANDARD LVCMOS12 [get_ports {pin_swap[0]}]

# GPIOs for MIPI camera 0
set_property PACKAGE_PIN E18 [get_ports {gpio_0_tri_o[0]}]; # LA08_P
set_property PACKAGE_PIN E17 [get_ports {gpio_0_tri_o[1]}]; # LA08_N
set_property PACKAGE_PIN J16 [get_ports {gpio_0_tri_o[2]}]; # LA07_P
set_property PACKAGE_PIN J15 [get_ports {gpio_0_tri_o[3]}]; # LA07_N
set_property PACKAGE_PIN L17 [get_ports {gpio_0_tri_o[4]}]; # LA04_P
set_property PACKAGE_PIN L16 [get_ports {gpio_0_tri_o[5]}]; # LA04_N
set_property PACKAGE_PIN L15 [get_ports {gpio_0_tri_o[6]}]; # LA10_P
set_property PACKAGE_PIN K15 [get_ports {gpio_0_tri_o[7]}]; # LA10_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_0_tri_o[*]}]

# GPIOs for MIPI camera 1
set_property PACKAGE_PIN F8 [get_ports {gpio_1_tri_o[0]}]; # LA32_P
set_property PACKAGE_PIN E8 [get_ports {gpio_1_tri_o[1]}]; # LA32_N
set_property PACKAGE_PIN E9 [get_ports {gpio_1_tri_o[2]}]; # LA30_P
set_property PACKAGE_PIN D9 [get_ports {gpio_1_tri_o[3]}]; # LA30_N
set_property PACKAGE_PIN H13 [get_ports {gpio_1_tri_o[4]}]; # LA22_P
set_property PACKAGE_PIN H12 [get_ports {gpio_1_tri_o[5]}]; # LA22_N
set_property PACKAGE_PIN B9 [get_ports {gpio_1_tri_o[6]}]; # LA26_P
set_property PACKAGE_PIN B8 [get_ports {gpio_1_tri_o[7]}]; # LA26_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_1_tri_o[*]}]

# Reserved GPIOs
set_property PACKAGE_PIN K20 [get_ports {rsvd_gpio_tri_o[0]}]; # LA02_N
set_property PACKAGE_PIN K19 [get_ports {rsvd_gpio_tri_o[1]}]; # LA03_P
set_property PACKAGE_PIN K18 [get_ports {rsvd_gpio_tri_o[2]}]; # LA03_N
set_property IOSTANDARD LVCMOS12 [get_ports {rsvd_gpio_tri_o[*]}]

# MIPI interface 0
set_property PACKAGE_PIN H18 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN H17 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN G18 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA12_P
set_property PACKAGE_PIN F18 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA12_N
set_property PACKAGE_PIN G15 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA13_P
set_property PACKAGE_PIN F15 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA13_N
set_property PACKAGE_PIN C13 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA14_P
set_property PACKAGE_PIN C12 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA14_N
set_property PACKAGE_PIN D16 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA15_P
set_property PACKAGE_PIN C16 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA15_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN D11 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN D10 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN F11 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN E10 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN B11 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA23_P
set_property PACKAGE_PIN A11 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA23_N
set_property PACKAGE_PIN B6 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA24_P
set_property PACKAGE_PIN A6 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA24_N
set_property PACKAGE_PIN C7 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA25_P
set_property PACKAGE_PIN C6 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA25_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

