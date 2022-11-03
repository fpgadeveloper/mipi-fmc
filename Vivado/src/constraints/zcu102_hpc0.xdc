# MIPI interface 0
set_property PACKAGE_PIN AB4 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN AC4 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN AA2 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN AA1 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN AB3 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN AC3 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN U5 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN U4 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN V4 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN V3 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN N9 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN N8 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN P11 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN N11 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN M15 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA22_P
set_property PACKAGE_PIN M14 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA22_N
set_property PACKAGE_PIN L16 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA23_P
set_property PACKAGE_PIN K16 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA23_N
set_property PACKAGE_PIN L12 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA24_P
set_property PACKAGE_PIN K12 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA24_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

