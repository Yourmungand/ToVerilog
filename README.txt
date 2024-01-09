The archive contains source files and scripts needed to build ASIC design of DC removal and Envelope Detector modules, which is originally was built in MATLAB Simulink. The archive contains the folowing folders and files:

Bezrukov V:
	Logs:
		encounter.log		# log file from Cadence Encounter
		qrc.log			# log file for QRC
		rc.log			# log file for RTL_Compiler
	Outputs:
                Place and Route:
		ToVerilog.def		# topology file from Encounter
		DC_Env.sdf		# sdf file from encounter	
		ToVerilog.v	# generated logic netlist
		ToVerilog_phys.v	# generated physical netlist
        Sythesis:
                ToVerilog_syn.v	# generated netlist by RTL Compiler
	Reports:
		Place and Route:
			# Reports for Hold and Setup Violations from Encounter:
			postCTS:
				ToVerilog_postCTS.summary
				ToVerilog_postCTS_hold.summary
			postRoute:
				ToVerilog_postRoute.summary
				ToVerilog_postRoute_hold.summary
			preCTS:
				ToVerilog_preCTS.summary
				ToVerilog_preCTS_hold.summary			
			signoff:
				ToVerilog_signOff.summary
				ToVerilog_signOff_hold.summary
		Sythesis:
			# Timing and area reports from RTL Compiler
			ToVerilog_area_report
			ToVerilog_timing_report
	Scripts:
                ToVerilog.sdc                   #Design constraints
		ToVerilog_PaR.tcl		# PaR script
		ToVerilog_pins.tcl		# IO assignment
		ToVerilog_syn.tcl		# script for RTL compiler
		MMMC.tcl		# technology script
		XFAB_fast.tcl		# tcl script for fast corner
		XFAB_slow.tcl		# tcl script for fast slow
		XFAB_typ.tcl		# tcl script for fast tupical
	Source:
		ToVerilog_GilbertTransformer.v	# Gilbert Transform module
		ToVerilog_DC_and_EnvDet_TB.v		# original testbench
		ToVerilog_ToVerilog.v			# Top module
		ToVerilog_DataIn.txt			# input signal
		ToVerilog_DC_Out.txt		# output signal (DC removal filter)
		ToVerilog_Env_Out.txt		# output signal (EnvelopeDetector)
		ToVerilog_Subsystem.v			# submodule
		ToVerilog_EnvelopeDetection       #Envelope Detector module
                ToVerilog_DC_filter               #DC removal module
                ToVerilog_FI_Full1                #Submodule
If you need to rebuild the netlist using RTL_Compiler, then in the terminal you need to enter the command RTL_Compiler ../Scripts/ToVerilog_syn.tñl. After calling the command, a netlist will be generated.
To simulate the generated netlist, you need to open Cadence Incisive using the Incisive command terminal. In the program window, create a working folder, transfer the file there from the Outputs/Syntnesis/ToVerilog_sun.tsl folder. Before this, you need to create a folder with a suitable digital library that contains information about the functional blocks that are used in the netlist. Then elaborate the netlist by right-clicking on the file and selecting NCELab. Do the same with the testbench. Then select the file that appears in the Snapshots folder and click NCSim
To assemble a project in Cadence Encounter, you need to write Encounter ../Scripts/ToVerilog_PaR.tñl in the terminal. This file is used as a topology building script.To simulate the circuit after the topology, you need to do the same as for the netlist, only elaborate the ToVerilog.v file, which is generated using Cadence Encounter.