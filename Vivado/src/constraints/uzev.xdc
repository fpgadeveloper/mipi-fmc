# MIPI interface 0
set_property PACKAGE_PIN AG13 [get_ports {mipi_phy_if_0_clk_p}]; # LA16_P
set_property PACKAGE_PIN AH13 [get_ports {mipi_phy_if_0_clk_n}]; # LA16_N
set_property PACKAGE_PIN AH17 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN AJ17 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN AD19 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN AE19 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN AA16 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN AB16 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN AJ16 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN AK16 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN AH6 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN AJ6 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN AG6 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN AG5 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN AF12 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA22_P
set_property PACKAGE_PIN AF11 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA22_N
set_property PACKAGE_PIN AJ5 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA23_P
set_property PACKAGE_PIN AK5 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA23_N
set_property PACKAGE_PIN AK7 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA24_P
set_property PACKAGE_PIN AK6 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA24_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

