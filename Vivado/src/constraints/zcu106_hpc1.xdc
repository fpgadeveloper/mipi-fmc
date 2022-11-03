# MIPI interface 0
set_property PACKAGE_PIN E24 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN D24 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN J24 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN H24 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN G25 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN G26 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN D22 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN C23 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN J25 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN H26 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

