### Project Name:			"ToVerilog"
### Author:			"V.V. Bezrukov"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_5V, 5V"
### Tools:			"Cadence RTL Compiler 14.27"
###
### Stage:			"Synthesis"
### File description:		"Script with main commands for synthesis"
###
### Work directory:			Digital_ASIC/RTL_Compiler
### Run command:			"RTL_Compiler ../Scripts/ToVerilog.tcl"

## Setup technologe files
include ../Scripts/X-FAB_typ.tcl

#Setup variables
set DESIGN ToVerilog
set PARAMS {}

## Read in Verilog HDL files
# DC filter modules
read_hdl -v2001 ../Source/DC_filter.v
#Subsystem module
read_hdl -v2001 ../Source/Subsystem.v
#GilbertTransformer module
read_hdl -v2001 ../GilbertTransformer.v
#Envelope detection module
read_hdl -v2001 ../EnvelopeDetection.v
#FI_Full1 module
read_hdl -v2001 ../Source/FI_Full1.v
#ToVerilog module
read_hdl -v2001 ../Source/ToVerilog.v

## Compile our code
elaborate -parameters $PARAMS $DESIGN

## Setup design constraints
read_sdc ../Scripts/ToVerilog.sdc

## Synthesize our schematic
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental

##Write out area and timing reports
report timing > ../Report/Synthesis/ToVerilog_synth_timing_report
report area > ../Report/Synthesis/ToVerilog_synth_area_report

##Write our synthesized Verilog netlist
write_hdl -mapped > ../Outputs/ToVerilog_synth.v

##Write out the SDC file
write_sdc > ../Outputs/ToVerilog_syn.sdc

gui_show
