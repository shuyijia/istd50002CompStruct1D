set projDir "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/vivado"
set projName "ALUTest"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/au_top_0.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/reset_conditioner_1.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/game_2.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/multi_seven_seg_3.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/random_position_4.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/button_conditioner_5.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/button_debounce_6.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/alu_7.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/seven_seg_8.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/pn_gen_9.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/pipeline_10.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/adder_11.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/comparator_12.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/boolean_13.v" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/verilog/shifter_14.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/constraint/alchitry.xdc" "D:/Users/arissa/Desktop/50.002/ALU_FINAL_V1/ALUTest/work/constraint/custom.xdc" "D:/Program\ Files/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
