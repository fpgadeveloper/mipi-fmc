# CONSTRAINTS BELOW ARE FOR FUNCTIONAL VERIFICATION WITH DIGILENT PCAM
#
# # Enable signal
# set_property PACKAGE_PIN AH7 [get_ports {cam_enable[0]}]; Bank 64, CAM_GPIO_LS
# set_property IOSTANDARD LVCMOS18 [get_ports {cam_enable[0]}]
# 
# # MIPI interface 0
# set_property PACKAGE_PIN D7 [get_ports {mipi_phy_if_0_clk_p}]
# set_property PACKAGE_PIN D6 [get_ports {mipi_phy_if_0_clk_n}]
# 
# set_property PACKAGE_PIN E5 [get_ports {mipi_phy_if_0_data_p[0]}]
# set_property PACKAGE_PIN D5 [get_ports {mipi_phy_if_0_data_n[0]}]
# set_property PACKAGE_PIN G6 [get_ports {mipi_phy_if_0_data_p[1]}]
# set_property PACKAGE_PIN F6 [get_ports {mipi_phy_if_0_data_n[1]}]
# 
# set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
# set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
# set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
# set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]
#
# CONSTRAINTS ABOVE ARE FOR FUNCTIONAL VERIFICATION WITH DIGILENT PCAM

# MIPI interface 0
set_property PACKAGE_PIN P7 [get_ports {mipi_phy_if_0_clk_p}]; # LA01_CC_P
set_property PACKAGE_PIN P6 [get_ports {mipi_phy_if_0_clk_n}]; # LA01_CC_N
set_property PACKAGE_PIN H9 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA04_P
set_property PACKAGE_PIN H8 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA04_N
set_property PACKAGE_PIN J1 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA05_P
set_property PACKAGE_PIN H1 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA05_N
set_property PACKAGE_PIN J6 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA07_P
set_property PACKAGE_PIN H6 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA07_N
set_property PACKAGE_PIN J5 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA08_P
set_property PACKAGE_PIN J4 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA08_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN AD2 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN AD1 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN AC4 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN AC3 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN AB1 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA22_P
set_property PACKAGE_PIN AC1 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA22_N
set_property PACKAGE_PIN AC9 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA23_P
set_property PACKAGE_PIN AD9 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA23_N
set_property PACKAGE_PIN AG3 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA24_P
set_property PACKAGE_PIN AH3 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA24_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

