
# DisplayPort AUX channel over EMIO
set_property PACKAGE_PIN K12 [get_ports dp_aux_din]; #IO_L2N_AD14N_45/25 Sch=dp_aux_din
set_property IOSTANDARD LVCMOS18 [get_ports dp_aux_din]
set_property PACKAGE_PIN K13 [get_ports {dp_aux_doe}]; #IO_L2P_AD14P_45/25 Sch=dp_aux_doe
set_property IOSTANDARD LVCMOS18 [get_ports {dp_aux_doe}]
set_property PACKAGE_PIN J11 [get_ports dp_aux_dout]; #IO_L1P_AD15P_45/25 Sch=dp_aux_dout
set_property IOSTANDARD LVCMOS18 [get_ports dp_aux_dout]
set_property PACKAGE_PIN J10 [get_ports dp_aux_hotplug_detect]; #IO_L1N_AD15N_45/25 Sch=dp_aux_hotplug_detect
set_property IOSTANDARD LVCMOS18 [get_ports dp_aux_hotplug_detect]

# I2C signals for MIPI 0
set_property PACKAGE_PIN R6 [get_ports iic_0_scl_io]; # LA05_P
set_property PACKAGE_PIN T6 [get_ports iic_0_sda_io]; # LA05_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_0_*]
set_property SLEW SLOW [get_ports iic_0_*]
set_property DRIVE 4 [get_ports iic_0_*]

# I2C signals for MIPI 1
set_property PACKAGE_PIN AC4 [get_ports iic_1_scl_io]; # LA19_P
set_property PACKAGE_PIN AC3 [get_ports iic_1_sda_io]; # LA19_N
set_property IOSTANDARD LVCMOS12 [get_ports iic_1_*]
set_property SLEW SLOW [get_ports iic_1_*]
set_property DRIVE 4 [get_ports iic_1_*]

# PIN_SWAP signal
set_property PACKAGE_PIN J6 [get_ports {pin_swap[0]}]; # LA02_P
set_property IOSTANDARD LVCMOS12 [get_ports {pin_swap[0]}]

# GPIOs for MIPI camera 0
set_property PACKAGE_PIN R7 [get_ports {gpio_0_tri_o[0]}]; # LA08_P
set_property PACKAGE_PIN T7 [get_ports {gpio_0_tri_o[1]}]; # LA08_N
set_property PACKAGE_PIN K9 [get_ports {gpio_0_tri_o[2]}]; # LA07_P
set_property PACKAGE_PIN J9 [get_ports {gpio_0_tri_o[3]}]; # LA07_N
set_property PACKAGE_PIN K2 [get_ports {gpio_0_tri_o[4]}]; # LA04_P
set_property PACKAGE_PIN J2 [get_ports {gpio_0_tri_o[5]}]; # LA04_N
set_property PACKAGE_PIN J1 [get_ports {gpio_0_tri_o[6]}]; # LA10_P
set_property PACKAGE_PIN H1 [get_ports {gpio_0_tri_o[7]}]; # LA10_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_0_tri_o[*]}]

# GPIOs for MIPI camera 1
set_property PACKAGE_PIN AB2 [get_ports {gpio_1_tri_o[0]}]; # LA32_P
set_property PACKAGE_PIN AC2 [get_ports {gpio_1_tri_o[1]}]; # LA32_N
set_property PACKAGE_PIN AB7 [get_ports {gpio_1_tri_o[2]}]; # LA30_P
set_property PACKAGE_PIN AC7 [get_ports {gpio_1_tri_o[3]}]; # LA30_N
set_property PACKAGE_PIN AB8 [get_ports {gpio_1_tri_o[4]}]; # LA22_P
set_property PACKAGE_PIN AC8 [get_ports {gpio_1_tri_o[5]}]; # LA22_N
set_property PACKAGE_PIN AC9 [get_ports {gpio_1_tri_o[6]}]; # LA26_P
set_property PACKAGE_PIN AD9 [get_ports {gpio_1_tri_o[7]}]; # LA26_N
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_1_tri_o[*]}]

# Reserved GPIOs
set_property PACKAGE_PIN H6 [get_ports {rsvd_gpio_tri_o[0]}]; # LA02_N
set_property PACKAGE_PIN K4 [get_ports {rsvd_gpio_tri_o[1]}]; # LA03_P
set_property PACKAGE_PIN K3 [get_ports {rsvd_gpio_tri_o[2]}]; # LA03_N
set_property IOSTANDARD LVCMOS12 [get_ports {rsvd_gpio_tri_o[*]}]

# MIPI interface 0
set_property PACKAGE_PIN L7 [get_ports {mipi_phy_if_0_clk_p}]; # LA00_CC_P
set_property PACKAGE_PIN L6 [get_ports {mipi_phy_if_0_clk_n}]; # LA00_CC_N
set_property PACKAGE_PIN J7 [get_ports {mipi_phy_if_0_data_p[0]}]; # LA12_P
set_property PACKAGE_PIN H7 [get_ports {mipi_phy_if_0_data_n[0]}]; # LA12_N
set_property PACKAGE_PIN N7 [get_ports {mipi_phy_if_0_data_p[1]}]; # LA13_P
set_property PACKAGE_PIN N6 [get_ports {mipi_phy_if_0_data_n[1]}]; # LA13_N
set_property PACKAGE_PIN P7 [get_ports {mipi_phy_if_0_data_p[2]}]; # LA14_P
set_property PACKAGE_PIN P6 [get_ports {mipi_phy_if_0_data_n[2]}]; # LA14_N
set_property PACKAGE_PIN R8 [get_ports {mipi_phy_if_0_data_p[3]}]; # LA15_P
set_property PACKAGE_PIN T8 [get_ports {mipi_phy_if_0_data_n[3]}]; # LA15_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_0_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_0_data_n[*]]

# MIPI interface 1
set_property PACKAGE_PIN AG9 [get_ports {mipi_phy_if_1_clk_p}]; # LA18_CC_P
set_property PACKAGE_PIN AH9 [get_ports {mipi_phy_if_1_clk_n}]; # LA18_CC_N
set_property PACKAGE_PIN AD2 [get_ports {mipi_phy_if_1_data_p[0]}]; # LA17_CC_P
set_property PACKAGE_PIN AD1 [get_ports {mipi_phy_if_1_data_n[0]}]; # LA17_CC_N
set_property PACKAGE_PIN AH2 [get_ports {mipi_phy_if_1_data_p[1]}]; # LA23_P
set_property PACKAGE_PIN AH1 [get_ports {mipi_phy_if_1_data_n[1]}]; # LA23_N
set_property PACKAGE_PIN AF7 [get_ports {mipi_phy_if_1_data_p[2]}]; # LA24_P
set_property PACKAGE_PIN AF6 [get_ports {mipi_phy_if_1_data_n[2]}]; # LA24_N
set_property PACKAGE_PIN AG3 [get_ports {mipi_phy_if_1_data_p[3]}]; # LA25_P
set_property PACKAGE_PIN AH3 [get_ports {mipi_phy_if_1_data_n[3]}]; # LA25_N

set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_p]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_clk_n]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_p[*]]
set_property IOSTANDARD MIPI_DPHY_DCI [get_ports mipi_phy_if_1_data_n[*]]

set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_p]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_clk_n]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_p[*]]
set_property DIFF_TERM_ADV TERM_100 [get_ports mipi_phy_if_1_data_n[*]]

