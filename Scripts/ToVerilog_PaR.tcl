### Project Name:			"ToVerilog"
### Author:			"V.V. Bezrukov"
### Technology:			"X-FAB 180nm CMOS, XT018 1143"
### Library:			"D_CELLS_5V, 5V"		
### Tools:			"Cadence Encounter"
###
### Stage:			"Layout"
### File description:		"Layout flow script"
###
### Work directory:			Digital_ASIC/Encounter
### Run command:			"Encounter ../Scripts/STD_PaR.tcl"


#______________________________Design Import____________________#
set init_gnd_net VSS
set init_io_file ../Scripts/Module_pins.tcl
set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v7_0/techLEF/v7_0_1_1/xt018_xx43_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_5V/v5_0/LEF/v5_0_1/xt018_D_CELLS_5V.lef}
set init_mmmc_file ../Scripts/MMMC.tcl
set init_pwr_net VDD
set init_verilog ../Source/Synthesis/FI_Full_synth.v
init_design
#________________Floorplanning_______________#
floorPlan -fplanOrigin center -site core_5v -r 1 0.7 25 25 25 25
#_____________________Powerplaninng____________________#
clearGlobalNets
globalNetConnect VDD -type pgpin -pin vdd5 -inst * -module {}
globalNetConnect VSS -type pgpin -pin gnd -inst * -module {}
globalNetConnect VSS -type tielo -inst * -module {}
globalNetConnect VDD -type tiehi -inst * -module {}
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -type core_rings -jog_distance 3.15 -threshold 3.15 -nets {VSS VDD} -follow core -stacked_via_bottom_layer MET1 -layer {bottom MET1 top MET1 right MET2 left MET2} -width 3 -spacing {bottom 0.23 top 0.23 right 0.28 left 0.28} -offset 3.15
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit MET1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -padcore_ring_top_layer_limit MET3 -spacing 2.5 -merge_stripes_value 3.15 -layer MET2 -block_ring_bottom_layer_limit MET1 -width 3 -nets {VDD VSS} -stacked_via_bottom_layer MET1
selectWire -153.6000 -162.9500 -150.6000 162.9500 2 VSS
deleteSelectedFromFPlan
selectWire -159.1000 -166.1800 -156.1000 166.1800 2 VDD
deleteSelectedFromFPlan
selectWire 140.9000 -166.1800 143.9000 166.1800 2 VDD
deleteSelectedFromFPlan
selectWire 146.4000 -162.9500 149.4000 162.9500 2 VSS
deleteSelectedFromFPlan
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 METTPL } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 METTPL } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 METTPL }
editPowerVia -skip_via_on_pin Standardcell -bottom_layer MET1 -add_vias 1 -top_layer METTPL
#____________________Placement______________________#
setPlaceMode -fp false
placeDesign -inPlaceOpt
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix ToVerilog_preCTS -outDir timingReports_preCTS
timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix ToVerilog_preCTS -outDir timingReports_preCTS
#_____________________Clock-Tree Synthesis____________________#
createClockTreeSpec -bufferList {BU_5VX0 BU_5VX1 BU_5VX12 BU_5VX16 BU_5VX2 BU_5VX3 BU_5VX4 BU_5VX6 BU_5VX8 DLY1_5VX1 DLY2_5VX1 DLY4_5VX1 DLY8_5VX1 IN_5VX0 IN_5VX1 IN_5VX12 IN_5VX16 IN_5VX2 IN_5VX3 IN_5VX4 IN_5VX6 IN_5VX8 STE_5VX1 STE_5VX2 STE_5VX3 STE_5VX4 ST_5VX1 ST_5VX2 ST_5VX3} -file Clock.ctstch
setCTSMode -engine ck
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix ToVerilog_postCTS -outDir timingReports_postCTS
timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix ToVerilog_postCTS -outDir timingReports_postCTS
#____________________Routing___________________________________#
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
#____________________________Final Steps and Verify_______________#
setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute -hold
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix ToVerilog_postRoute -outDir timingReports_postRoute
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix ToVerilog_postRoute -outDir timingReports_postRoute
getFillerMode -quiet
addFiller -cell FEED7_5V FEED5_5V FEED3_5V FEED2_5V FEED25_5V FEED1_5V FEED15_5V FEED10_5V -prefix FILLER
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verify_drc -report ToVerilog.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -signoff -pathReports -drvReports -slackReports -numPaths 50 -prefix ToVerilog_signOff -outDir timingReports_signOff
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
#_______________________Sign-Off and Generation Files_____________________#
timeDesign -signoff -pathReports -drvReports -slackReports -numPaths 50 -prefix ToVerilog_signOff -outDir timingReports_signOff
timeDesign -signoff -hold -pathReports -slackReports -numPaths 50 -prefix ToVerilog_signOff -outDir timingReports_signOff
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf -view MAXview DC_Env.sdf
saveNetlist ToVerilog.v
saveNetlist ToVerilog_phys -includePhysicalCell {FEED7_5V FEED5_5V FEED3_5V FEED2_5V FEED25_5V FEED1_5V FEED15_5v FEED10_5V}
saveNetlist ToVerilog_phys -includePhysicalCell {FEED7_5V FEED5_5V FEED3_5V FEED2_5V FEED25_5V FEED1_5V FEED15_5V FEED10_5V}
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing ToVerilog.def
