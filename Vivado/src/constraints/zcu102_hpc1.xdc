# MIPI interface 0
set_property PACKAGE_PIN AJ6 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN AJ5 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN AF2 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN AF1 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN AD4 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA07_P
set_property PACKAGE_PIN AE4 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA07_N
set_property PACKAGE_PIN AD7 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA12_P
set_property PACKAGE_PIN AD6 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA12_N
set_property PACKAGE_PIN AG8 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA13_P
set_property PACKAGE_PIN AH8 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA13_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

