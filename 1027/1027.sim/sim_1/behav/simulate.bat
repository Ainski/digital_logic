@echo off
set xv_path=D:\\Vivado\\2016.2\\bin
call %xv_path%/xsim Timer_tb_behav -key {Behavioral:sim_1:Functional:Timer_tb} -tclbatch Timer_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
