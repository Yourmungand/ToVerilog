### Project Name:			"ToVerilog"
### Author:			"V.V. Bezrukov"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_5V, 5V"
### Tools:			"Cadence RTL Compiler, Cadence Encounter"
###
### Stage:			"Synthesis, Layout"
### File description:		"Design constraints"
###
### Work directory:		-
### Run command:	
#Clock_discription
set_units -time 1.0ns;

set_units -capacitance 1.0pF;

create_clock -name "Clock" -period 50 [get_ports {clk}]

set MINRISE 0.20
set MAXRISE 0.25
set MINFALL 0.20
set MAXFALL 0.25

set_clock_transition -rise -min $MINRISE [get_clocks Clock]
set_clock_transition -rise -max $MAXRISE [get_clocks Clock]
set_clock_transition -fall -min $MINFALL [get_clocks Clock]
set_clock_transition -fall -max $MAXFALL [get_clocks Clock]


set SKEW 0.200

set_clock_uncertainty $SKEW [get_clocks Clock]

set_max_capacitance 0.5 [all_outputs]

set_ideal_network [get_ports {reset}]
set_false_path -from [get_ports {reset}]
