### Project Name:			"Toverilog"
### Author:			"V.V. Bezrukov"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_5V, 5V"
### Tools:			"Cadence RTL Compiler 14.27"
###
### Stage:			"Synthesis"
### File description:		"Script with main commands for synthesis"
###
### Work directory:			Digital_ASIC/RTL_Compiler
### Run command:			"RTL_Compiler ../Scripts/STD.tcl"

## Setup technologe files
include /home/student3/Bezrukov_V/Digital_ASIC/Scripts/X-FAB_typ.tcl

#Setup variables
set DESIGN ToVerilog
set PARAMS {}

## Read in Verilog HDL files
# DC filter modules
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/DC_filter.v
#Subsystem module
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/Subsystem.v
#GilbertTransformer module
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/GilbertTransformer.v
#Envelope detection module
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/EnvelopeDetection.v
#FI_Full1 module
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/FI_Full1.v
#ToVerilog module
read_hdl -v2001 /home/student3/Bezrukov_V/Digital_ASIC/Source/ToVerilog.v

## Compile our code
elaborate -parameters $PARAMS $DESIGN

## Setup design constraints
read_sdc /home/student3/Bezrukov_V/Digital_ASIC/Source/DesignConstraints.sdc

## Synthesize our schematic
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental

##Write out area and timing reports
report timing > /home/student3/Bezrukov_V/Digital_ASIC/FI_Full_timing_report
report area > /home/student3/Bezrukov_V/Digital_ASIC/FI_Full_area_report

##Write our synthesized Verilog netlist
write_hdl -mapped > /home/student3/Bezrukov_V/Digital_ASIC/Source/Synthesis/FI_Full_synth.v

##Write out the SDC file
write_sdc > /home/student3/Bezrukov_V/Digital_ASIC/Source/Synthesis/FI_Full_synth_out.sdc

gui_show
