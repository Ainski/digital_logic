proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param simulator.modelsimInstallPath E:/models/modelsim/win32pe
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir E:/model/hw1_4/hw1_4.cache/wt [current_project]
  set_property parent.project_path E:/model/hw1_4/hw1_4.xpr [current_project]
  set_property ip_repo_paths e:/model/hw1_4/hw1_4.cache/ip [current_project]
  set_property ip_output_repo e:/model/hw1_4/hw1_4.cache/ip [current_project]
  add_files -quiet E:/model/hw1_4/hw1_4.runs/synth_1/three_state_gates.dcp
  read_xdc E:/model/hw1_4/hw1_4.srcs/constrs_1/new/three_state_gates_xdc.xdc
  link_design -top three_state_gates -part xc7a100tcsg324-1
  write_hwdef -file three_state_gates.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force three_state_gates_opt.dcp
  report_drc -file three_state_gates_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force three_state_gates_placed.dcp
  report_io -file three_state_gates_io_placed.rpt
  report_utilization -file three_state_gates_utilization_placed.rpt -pb three_state_gates_utilization_placed.pb
  report_control_sets -verbose -file three_state_gates_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force three_state_gates_routed.dcp
  report_drc -file three_state_gates_drc_routed.rpt -pb three_state_gates_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file three_state_gates_timing_summary_routed.rpt -rpx three_state_gates_timing_summary_routed.rpx
  report_power -file three_state_gates_power_routed.rpt -pb three_state_gates_power_summary_routed.pb -rpx three_state_gates_power_routed.rpx
  report_route_status -file three_state_gates_route_status.rpt -pb three_state_gates_route_status.pb
  report_clock_utilization -file three_state_gates_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force three_state_gates.mmi }
  write_bitstream -force three_state_gates.bit 
  catch { write_sysdef -hwdef three_state_gates.hwdef -bitfile three_state_gates.bit -meminfo three_state_gates.mmi -file three_state_gates.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

