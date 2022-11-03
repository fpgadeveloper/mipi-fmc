# MIPI interface 0
set_property PACKAGE_PIN AL30 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN AL31 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN AR37 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN AT37 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN AP38 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN AR38 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN AP36 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN AP37 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN AK29 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN AK30 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN R31 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN P31 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN R34 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN P34 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN N34 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA22_P
set_property PACKAGE_PIN N35 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA22_N
set_property PACKAGE_PIN Y32 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA23_P
set_property PACKAGE_PIN W32 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA23_N
set_property PACKAGE_PIN T34 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA24_P
set_property PACKAGE_PIN T35 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA24_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

