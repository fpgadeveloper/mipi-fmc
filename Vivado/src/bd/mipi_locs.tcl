
# Opsero Electronic Design Inc. Copyright 2022

# MIPI pin LOC constraints are required in the configuration of the MIPI subsystem IPs.
# The following code constructs a nested dictionary that contains the MIPI pin assignments
# for each target board, which is then used by the script that builds the block diagram.

# To use the dictionary:
#   * Get the bank number:          dict get <target> <interface> bank
#   * Get the clk_p pin:            dict get <target> <interface> clk pin
#   * Get the clk_p pin name:       dict get <target> <interface> clk pin_name
#   * Get the data<0-3>_p pin:      dict get <target> <interface> data<0-3> pin
#   * Get the data<0-3>_p pin name: dict get <target> <interface> data<0-3> pin_name

dict set mipi_loc_dict zcu104 0 bank 67
dict set mipi_loc_dict zcu104 0 clk { pin H18 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu104 0 data0 { pin G18 pin_name IO_L17P_T2U_N8_AD10P_67 }
dict set mipi_loc_dict zcu104 0 data1 { pin G15 pin_name IO_L14P_T2L_N2_GC_67 }
dict set mipi_loc_dict zcu104 0 data2 { pin C13 pin_name IO_L6P_T0U_N10_AD6P_67 }
dict set mipi_loc_dict zcu104 0 data3 { pin D16 pin_name IO_L7P_T1L_N0_QBC_AD13P_67 }
dict set mipi_loc_dict zcu104 1 bank 68
dict set mipi_loc_dict zcu104 1 clk { pin D11 pin_name IO_L16P_T2U_N6_QBC_AD3P_68 }
dict set mipi_loc_dict zcu104 1 data0 { pin F11 pin_name IO_L14P_T2L_N2_GC_68 }
dict set mipi_loc_dict zcu104 1 data1 { pin B11 pin_name IO_L24P_T3U_N10_68 }
dict set mipi_loc_dict zcu104 1 data2 { pin B6 pin_name IO_L21P_T3L_N4_AD8P_68 }
dict set mipi_loc_dict zcu104 1 data3 { pin C7 pin_name IO_L19P_T3L_N0_DBC_AD9P_68 }
dict set mipi_loc_dict zcu102_hpc0 0 bank 66
dict set mipi_loc_dict zcu102_hpc0 0 clk { pin AB4 pin_name IO_L16P_T2U_N6_QBC_AD3P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data0 { pin W7 pin_name IO_L9P_T1L_N4_AD12P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data1 { pin AB8 pin_name IO_L8P_T1L_N2_AD5P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data2 { pin AC7 pin_name IO_L7P_T1L_N0_QBC_AD13P_66 }
dict set mipi_loc_dict zcu102_hpc0 0 data3 { pin Y10 pin_name IO_L6P_T0U_N10_AD6P_66 }
dict set mipi_loc_dict zcu102_hpc0 1 bank 67
dict set mipi_loc_dict zcu102_hpc0 1 clk { pin N9 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data0 { pin P11 pin_name IO_L13P_T2L_N0_GC_QBC_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data1 { pin L16 pin_name IO_L19P_T3L_N0_DBC_AD9P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data2 { pin L12 pin_name IO_L18P_T2U_N10_AD2P_67 }
dict set mipi_loc_dict zcu102_hpc0 1 data3 { pin M11 pin_name IO_L17P_T2U_N8_AD10P_67 }
dict set mipi_loc_dict zcu102_hpc1 0 bank 65
dict set mipi_loc_dict zcu102_hpc1 0 clk { pin AJ6 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data0 { pin AD7 pin_name IO_L9P_T1L_N4_AD12P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data1 { pin AG8 pin_name IO_L8P_T1L_N2_AD5P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data2 { pin AH7 pin_name IO_L7P_T1L_N0_QBC_AD13P_65 }
dict set mipi_loc_dict zcu102_hpc1 0 data3 { pin AD10 pin_name IO_L6P_T0U_N10_AD6P_65 }
dict set mipi_loc_dict zcu106_hpc0 0 bank 67
dict set mipi_loc_dict zcu106_hpc0 0 clk { pin H18 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data0 { pin G18 pin_name IO_L17P_T2U_N8_AD10P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data1 { pin G15 pin_name IO_L14P_T2L_N2_GC_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data2 { pin C13 pin_name IO_L6P_T0U_N10_AD6P_67 }
dict set mipi_loc_dict zcu106_hpc0 0 data3 { pin D16 pin_name IO_L7P_T1L_N0_QBC_AD13P_67 }
dict set mipi_loc_dict zcu106_hpc0 1 bank 68
dict set mipi_loc_dict zcu106_hpc0 1 clk { pin D11 pin_name IO_L16P_T2U_N6_QBC_AD3P_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data0 { pin F11 pin_name IO_L14P_T2L_N2_GC_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data1 { pin B11 pin_name IO_L24P_T3U_N10_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data2 { pin B6 pin_name IO_L21P_T3L_N4_AD8P_68 }
dict set mipi_loc_dict zcu106_hpc0 1 data3 { pin C7 pin_name IO_L19P_T3L_N0_DBC_AD9P_68 }
dict set mipi_loc_dict zcu106_hpc1 0 bank 28
dict set mipi_loc_dict zcu106_hpc1 0 clk { pin E24 pin_name IO_L16P_T2U_N6_QBC_AD3P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data0 { pin E19 pin_name IO_L7P_T1L_N0_QBC_AD13P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data1 { pin C21 pin_name IO_L15P_T2L_N4_AD11P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data2 { pin D20 pin_name IO_L9P_T1L_N4_AD12P_28 }
dict set mipi_loc_dict zcu106_hpc1 0 data3 { pin A18 pin_name IO_L19P_T3L_N0_DBC_AD9P_28 }
dict set mipi_loc_dict uzev 0 bank 64
dict set mipi_loc_dict uzev 0 clk { pin AF16 pin_name IO_L13P_T2L_N0_GC_QBC_64 }
dict set mipi_loc_dict uzev 0 data0 { pin AJ14 pin_name IO_L9P_T1L_N4_AD12P_64 }
dict set mipi_loc_dict uzev 0 data1 { pin AJ15 pin_name IO_L10P_T1U_N6_QBC_AD4P_64 }
dict set mipi_loc_dict uzev 0 data2 { pin AF15 pin_name IO_L12P_T1U_N10_GC_64 }
dict set mipi_loc_dict uzev 0 data3 { pin AK13 pin_name IO_L8P_T1L_N2_AD5P_64 }
dict set mipi_loc_dict uzev 1 bank 65
dict set mipi_loc_dict uzev 1 clk { pin AH6 pin_name IO_L13P_T2L_N0_GC_QBC_65 }
dict set mipi_loc_dict uzev 1 data0 { pin AG6 pin_name IO_L14P_T2L_N2_GC_65 }
dict set mipi_loc_dict uzev 1 data1 { pin AJ5 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict uzev 1 data2 { pin AK7 pin_name IO_L15P_T2L_N4_AD11P_65 }
dict set mipi_loc_dict uzev 1 data3 { pin AF6 pin_name IO_L18P_T2U_N10_AD2P_65 }
dict set mipi_loc_dict pynqzu 0 bank 65
dict set mipi_loc_dict pynqzu 0 clk { pin P7 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict pynqzu 0 data0 { pin M6 pin_name IO_L14P_T2L_N2_GC_65 }
dict set mipi_loc_dict pynqzu 0 data1 { pin R6 pin_name IO_L6P_T0U_N10_AD6P_65 }
dict set mipi_loc_dict pynqzu 0 data2 { pin R7 pin_name IO_L5P_T0U_N8_AD14P_65 }
dict set mipi_loc_dict pynqzu 0 data3 { pin N9 pin_name IO_L17P_T2U_N8_AD10P_65 }
dict set mipi_loc_dict pynqzu 1 bank 64
dict set mipi_loc_dict pynqzu 1 clk { pin AD2 pin_name IO_L16P_T2U_N6_QBC_AD3P_64 }
dict set mipi_loc_dict pynqzu 1 data0 { pin AC4 pin_name IO_L14P_T2L_N2_GC_64 }
dict set mipi_loc_dict pynqzu 1 data1 { pin AC9 pin_name IO_L1P_T0L_N0_DBC_64 }
dict set mipi_loc_dict pynqzu 1 data2 { pin AG3 pin_name IO_L20P_T3L_N2_AD1P_64 }
dict set mipi_loc_dict pynqzu 1 data3 { pin AH2 pin_name IO_L23P_T3U_N8_64 }
dict set mipi_loc_dict genesyszu 0 bank 65
dict set mipi_loc_dict genesyszu 0 clk { pin L7 pin_name IO_L13P_T2L_N0_GC_QBC_65 }
dict set mipi_loc_dict genesyszu 0 data0 { pin J7 pin_name IO_L21P_T3L_N4_AD8P_65 }
dict set mipi_loc_dict genesyszu 0 data1 { pin N7 pin_name IO_L15P_T2L_N4_AD11P_65 }
dict set mipi_loc_dict genesyszu 0 data2 { pin P7 pin_name IO_L16P_T2U_N6_QBC_AD3P_65 }
dict set mipi_loc_dict genesyszu 0 data3 { pin R8 pin_name IO_L4P_T0U_N6_DBC_AD7P_SMBALERT_65 }
dict set mipi_loc_dict genesyszu 1 bank 64
dict set mipi_loc_dict genesyszu 1 clk { pin AG9 pin_name IO_L7P_T1L_N0_QBC_AD13P_64 }
dict set mipi_loc_dict genesyszu 1 data0 { pin AD2 pin_name IO_L16P_T2U_N6_QBC_AD3P_64 }
dict set mipi_loc_dict genesyszu 1 data1 { pin AH2 pin_name IO_L23P_T3U_N8_64 }
dict set mipi_loc_dict genesyszu 1 data2 { pin AF7 pin_name IO_L11P_T1U_N8_GC_64 }
dict set mipi_loc_dict genesyszu 1 data3 { pin AG3 pin_name IO_L20P_T3L_N2_AD1P_64 }
dict set mipi_loc_dict vcu118_hpc 0 bank 66
dict set mipi_loc_dict vcu118_hpc 0 clk { pin BF10 pin_name IO_L10P_T1U_N6_QBC_AD4P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data0 { pin BC14 pin_name IO_L19P_T3L_N0_DBC_AD9P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data1 { pin AY8 pin_name IO_L17P_T2U_N8_AD10P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data2 { pin AW8 pin_name IO_L18P_T2U_N10_AD2P_66 }
dict set mipi_loc_dict vcu118_hpc 0 data3 { pin BB16 pin_name IO_L20P_T3L_N2_AD1P_66 }
dict set mipi_loc_dict vcu118_hpc 1 bank 67
dict set mipi_loc_dict vcu118_hpc 1 clk { pin AP12 pin_name IO_L16P_T2U_N6_QBC_AD3P_67 }
dict set mipi_loc_dict vcu118_hpc 1 data0 { pin AR14 pin_name IO_L13P_T2L_N0_GC_QBC_67 }
dict set mipi_loc_dict vcu118_hpc 1 data1 { pin AN16 pin_name IO_L17P_T2U_N8_AD10P_67 }
dict set mipi_loc_dict vcu118_hpc 1 data2 { pin AP13 pin_name IO_L14P_T2L_N2_GC_67 }
dict set mipi_loc_dict vcu118_hpc 1 data3 { pin AT12 pin_name IO_L1P_T0L_N0_DBC_67 }
dict set mipi_loc_dict vcu118_fmcp 0 bank 43
dict set mipi_loc_dict vcu118_fmcp 0 clk { pin AL30 pin_name IO_L16P_T2U_N6_QBC_AD3P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data0 { pin AH33 pin_name IO_L21P_T3L_N4_AD8P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data1 { pin AJ35 pin_name IO_L20P_T3L_N2_AD1P_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data2 { pin AG31 pin_name IO_L23P_T3U_N8_43 }
dict set mipi_loc_dict vcu118_fmcp 0 data3 { pin AG32 pin_name IO_L24P_T3U_N10_43 }
dict set mipi_loc_dict vcu118_fmcp 1 bank 45
dict set mipi_loc_dict vcu118_fmcp 1 clk { pin R31 pin_name IO_L10P_T1U_N6_QBC_AD4P_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data0 { pin R34 pin_name IO_L13P_T2L_N0_GC_QBC_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data1 { pin Y32 pin_name IO_L1P_T0L_N0_DBC_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data2 { pin T34 pin_name IO_L6P_T0U_N10_AD6P_45 }
dict set mipi_loc_dict vcu118_fmcp 1 data3 { pin Y34 pin_name IO_L3P_T0L_N4_AD15P_45 }
dict set mipi_loc_dict pynqzu_pcam 0 bank 66
dict set mipi_loc_dict pynqzu_pcam 0 clk { pin D7 pin_name IO_L13P_T2L_N0_GC_QBC_66 }
dict set mipi_loc_dict pynqzu_pcam 0 data0 { pin E5 pin_name IO_L14P_T2L_N2_GC_66 }
dict set mipi_loc_dict pynqzu_pcam 0 data1 { pin G6 pin_name IO_L15P_T2L_N4_AD11P_66 }
dict set mipi_loc_dict kv260_pcam 0 bank 66
dict set mipi_loc_dict kv260_pcam 0 clk { pin D7 pin_name IO_L13P_T2L_N0_GC_QBC_66 }
dict set mipi_loc_dict kv260_pcam 0 data0 { pin E5 pin_name IO_L14P_T2L_N2_GC_66 }
dict set mipi_loc_dict kv260_pcam 0 data1 { pin G6 pin_name IO_L15P_T2L_N4_AD11P_66 }
