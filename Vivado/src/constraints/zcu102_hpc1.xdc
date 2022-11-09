# I2C signals for MIPI 0
set_property PACKAGE_PIN AG3 [get_ports iic_0_scl_io]; # LA05_P
set_property PACKAGE_PIN AH3 [get_ports iic_0_sda_io]; # LA05_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

# PIN_SWAP signal
set_property PACKAGE_PIN AD2 [get_ports {pin_swap[0]}]; # LA02_P
set_property IOSTANDARD LVCMOS12 [get_ports {pin_swap[0]}]

# GPIOs for MIPI camera 0
set_property PACKAGE_PIN AE3 [get_ports {gpio_0_tri_o[0]}]; # LA08_P
set_property PACKAGE_PIN AF3 [get_ports {gpio_0_tri_o[1]}]; # LA08_N
set_property PACKAGE_PIN AD4 [get_ports {gpio_0_tri_o[2]}]; # LA07_P
set_property PACKAGE_PIN AE4 [get_ports {gpio_0_tri_o[3]}]; # LA07_N
set_property PACKAGE_PIN AF2 [get_ports {gpio_0_tri_o[4]}]; # LA04_P
set_property PACKAGE_PIN AF1 [get_ports {gpio_0_tri_o[5]}]; # LA04_N
set_property PACKAGE_PIN AH4 [get_ports {gpio_0_tri_o[6]}]; # LA10_P
set_property PACKAGE_PIN AJ4 [get_ports {gpio_0_tri_o[7]}]; # LA10_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_0_tri_o[*]}]

# Reserved GPIOs
set_property PACKAGE_PIN AD1 [get_ports {rsvd_gpio_tri_o[0]}]; # LA02_N
set_property PACKAGE_PIN AH1 [get_ports {rsvd_gpio_tri_o[1]}]; # LA03_P
set_property PACKAGE_PIN AJ1 [get_ports {rsvd_gpio_tri_o[2]}]; # LA03_N
set_property IOSTANDARD LVCMOS12 [get_ports {rsvd_gpio_tri_o[*]}]

# MIPI interface 0
set_property PACKAGE_PIN AJ6 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN AJ5 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN AD7 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA12_P
set_property PACKAGE_PIN AD6 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA12_N
set_property PACKAGE_PIN AG8 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA13_P
set_property PACKAGE_PIN AH8 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA13_N
set_property PACKAGE_PIN AH7 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA14_P
set_property PACKAGE_PIN AH6 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA14_N
set_property PACKAGE_PIN AD10 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA15_P
set_property PACKAGE_PIN AE9 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA15_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

