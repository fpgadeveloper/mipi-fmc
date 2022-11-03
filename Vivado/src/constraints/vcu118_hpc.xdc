# MIPI interface 0
set_property PACKAGE_PIN BF10 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN BF9 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN BF12 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN BF11 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN BE14 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN BF14 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN BC15 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN BD15 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN BE15 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN BF15 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

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
set_property PACKAGE_PIN AW13 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA22_P
set_property PACKAGE_PIN AY13 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA22_N
set_property PACKAGE_PIN AN16 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA23_P
set_property PACKAGE_PIN AP16 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA23_N
set_property PACKAGE_PIN AP13 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA24_P
set_property PACKAGE_PIN AR13 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA24_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

