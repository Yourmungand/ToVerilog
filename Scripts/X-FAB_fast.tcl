### Project Name:			"ToVerilog"
### Author:			"V.V. Bezrukov"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_5V, 5V"
### Tools:			"Cadence RTL Compiler 14.27"
###
### Stage:			"Synthesis"
### File description:		"Technology library for fast corner"
###
### Work directory:			-
### Run command:	
#Setup path for liberty CPF directory
set_attribute lib_search_path /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v5_0/liberty_LP5MOS_MOS5/v5_0_0/PVT_5_00V_range

#Setup PVT corner .lib file
set_attribute library {D_CELLS_5V_LP5MOS_MOS5_fast_5_50V_m40C.lib}

#Setup LEF files
set_attribute lef_library {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v7_0/techLEF/v7_0_1_1/xt018_xx43_MET4_METMID_METTHK.lef \
/Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v5_0/LEF/v5_0_1/xt018_D_CELLS_5V.lef \
/Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v5_0/LEF/v5_0_1/xt018_xx43_MET4_METMID_METTHK_D_CELLS_5V_mprobe.lef \
}
# Setup Capacitance Table File
set_attribute cap_table_file /Cadence/Libs/X_FAB/XKIT/xt018/cadence/v7_0/capTbl/v7_0_1/xt018_xx43_MET4_METMID_METTHK_min.capTbl
# Setup error on blackbox
set_attribute hdl_error_on_blackbox true
