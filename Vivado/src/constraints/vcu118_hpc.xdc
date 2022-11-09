# I2C signals for MIPI 0
set_property PACKAGE_PIN BE14 [get_ports iic_0_scl_io]; # LA05_P
set_property PACKAGE_PIN BF14 [get_ports iic_0_sda_io]; # LA05_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

# I2C signals for MIPI 1
set_property PACKAGE_PIN AW12 [get_ports iic_1_scl_io]; # LA19_P
set_property PACKAGE_PIN AY12 [get_ports iic_1_sda_io]; # LA19_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_1_*]
set_property SLEW SLOW [get_ports iic_1_*]
set_property DRIVE 4 [get_ports iic_1_*]

# PIN_SWAP signal
set_property PACKAGE_PIN BC11 [get_ports {pin_swap[0]}]; # LA02_P
set_property IOSTANDARD LVCMOS12 [get_ports {pin_swap[0]}]

# GPIOs for MIPI camera 0
set_property PACKAGE_PIN BE15 [get_ports {gpio_0_tri_o[0]}]; # LA08_P
set_property PACKAGE_PIN BF15 [get_ports {gpio_0_tri_o[1]}]; # LA08_N
set_property PACKAGE_PIN BC15 [get_ports {gpio_0_tri_o[2]}]; # LA07_P
set_property PACKAGE_PIN BD15 [get_ports {gpio_0_tri_o[3]}]; # LA07_N
set_property PACKAGE_PIN BF12 [get_ports {gpio_0_tri_o[4]}]; # LA04_P
set_property PACKAGE_PIN BF11 [get_ports {gpio_0_tri_o[5]}]; # LA04_N
set_property PACKAGE_PIN BB13 [get_ports {gpio_0_tri_o[6]}]; # LA10_P
set_property PACKAGE_PIN BB12 [get_ports {gpio_0_tri_o[7]}]; # LA10_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_0_tri_o[*]}]

# GPIOs for MIPI camera 1
set_property PACKAGE_PIN AJ13 [get_ports {gpio_1_tri_o[0]}]; # LA32_P
set_property PACKAGE_PIN AJ12 [get_ports {gpio_1_tri_o[1]}]; # LA32_N
set_property PACKAGE_PIN AK12 [get_ports {gpio_1_tri_o[2]}]; # LA30_P
set_property PACKAGE_PIN AL12 [get_ports {gpio_1_tri_o[3]}]; # LA30_N
set_property PACKAGE_PIN AW13 [get_ports {gpio_1_tri_o[4]}]; # LA22_P
set_property PACKAGE_PIN AY13 [get_ports {gpio_1_tri_o[5]}]; # LA22_N
set_property PACKAGE_PIN AK15 [get_ports {gpio_1_tri_o[6]}]; # LA26_P
set_property PACKAGE_PIN AL15 [get_ports {gpio_1_tri_o[7]}]; # LA26_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_1_tri_o[*]}]

# Reserved GPIOs
set_property PACKAGE_PIN BD11 [get_ports {rsvd_gpio_tri_o[0]}]; # LA02_N
set_property PACKAGE_PIN BD12 [get_ports {rsvd_gpio_tri_o[1]}]; # LA03_P
set_property PACKAGE_PIN BE12 [get_ports {rsvd_gpio_tri_o[2]}]; # LA03_N
set_property IOSTANDARD LVCMOS12 [get_ports {rsvd_gpio_tri_o[*]}]

# MIPI interface 0
set_property PACKAGE_PIN BF10 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN BF9 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN BC14 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA12_P
set_property PACKAGE_PIN BC13 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA12_N
set_property PACKAGE_PIN AY8 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA13_P
set_property PACKAGE_PIN AY7 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA13_N
set_property PACKAGE_PIN AW8 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA14_P
set_property PACKAGE_PIN AW7 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA14_N
set_property PACKAGE_PIN BB16 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA15_P
set_property PACKAGE_PIN BC16 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA15_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN AP12 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN AR12 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN AR14 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN AT14 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN AN16 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA23_P
set_property PACKAGE_PIN AP16 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA23_N
set_property PACKAGE_PIN AP13 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA24_P
set_property PACKAGE_PIN AR13 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA24_N
set_property PACKAGE_PIN AT12 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA25_P
set_property PACKAGE_PIN AU12 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA25_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

