set projDir "G:/ALU_CSH/ALUTest/work/vivado"
set projName "ALUTest"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "G:/ALU_CSH/ALUTest/work/verilog/au_top_0.v" "G:/ALU_CSH/ALUTest/work/verilog/reset_conditioner_1.v" "G:/ALU_CSH/ALUTest/work/verilog/game_2.v" "G:/ALU_CSH/ALUTest/work/verilog/seven_seg_3.v" "G:/ALU_CSH/ALUTest/work/verilog/random_position_4.v" "G:/ALU_CSH/ALUTest/work/verilog/button_conditioner_5.v" "G:/ALU_CSH/ALUTest/work/verilog/button_debounce_6.v" "G:/ALU_CSH/ALUTest/work/verilog/pn_gen_7.v" "G:/ALU_CSH/ALUTest/work/verilog/pipeline_8.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "G:/ALU_CSH/ALUTest/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "G:/ALU_CSH/ALUTest/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
