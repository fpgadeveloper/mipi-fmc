# Copyright (C) 2021 Xilinx, Inc
#
# SPDX-License-Identifier: BSD-3-Clause

open_project pixel_pack
set_top pixel_pack
add_files ./pixel_pack.cpp
add_files -tb ./pixel_pack_test.cpp
open_solution "solution1"
set_part {xczu5eg-sfvc784-1-e}
create_clock -period 7
csynth_design
export_design -format ip_catalog -description "Pixel Packing from 24-bit to 32-bit" -display_name "Pixel Pack"
exit
