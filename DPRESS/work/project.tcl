set projDir "C:/Users/loan/Downloads/DPRESS/work/vivado"
set projName "Dpress"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/loan/Downloads/DPRESS/work/verilog/au_top_0.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/reset_conditioner_1.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/game_2.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/multi_seven_seg_3.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/random_position_4.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/button_conditioner_5.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/button_debounce_6.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/alu_7.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/seven_seg_8.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/pn_gen_9.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/pipeline_10.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/adder_11.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/comparator_12.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/boolean_13.v" "C:/Users/loan/Downloads/DPRESS/work/verilog/shifter_14.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/loan/Downloads/DPRESS/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/loan/Downloads/DPRESS/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
