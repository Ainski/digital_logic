# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/model/project_5/project_5.cache/wt [current_project]
set_property parent.project_path E:/model/project_5/project_5.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib E:/model/project_5/project_5.srcs/sources_1/new/encoder_83_Pri.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/model/project_5/project_5.srcs/constrs_1/new/encoder83_Pri_xdc.xdc
set_property used_in_implementation false [get_files E:/model/project_5/project_5.srcs/constrs_1/new/encoder83_Pri_xdc.xdc]


synth_design -top encoder83_Pri -part xc7a100tcsg324-1


write_checkpoint -force -noxdef encoder83_Pri.dcp

catch { report_utilization -file encoder83_Pri_utilization_synth.rpt -pb encoder83_Pri_utilization_synth.pb }
