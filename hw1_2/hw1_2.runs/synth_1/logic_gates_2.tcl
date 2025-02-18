# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_param simulator.modelsimInstallPath E:/models/modelsim/win32pe
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/model/hw1_2/hw1_2.cache/wt [current_project]
set_property parent.project_path E:/model/hw1_2/hw1_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib E:/model/hw1_2/hw1_2.srcs/sources_1/new/logic_gate_2.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/model/hw1_2/hw1_2.srcs/constrs_1/new/logic_gate_2_xdc.xdc
set_property used_in_implementation false [get_files E:/model/hw1_2/hw1_2.srcs/constrs_1/new/logic_gate_2_xdc.xdc]


synth_design -top logic_gates_2 -part xc7a100tcsg324-1


write_checkpoint -force -noxdef logic_gates_2.dcp

catch { report_utilization -file logic_gates_2_utilization_synth.rpt -pb logic_gates_2_utilization_synth.pb }
