set_property PACKAGE_PIN M13 [get_ports {sw[0]}] 
set_property PACKAGE_PIN L16 [get_ports {sw[1]}] 
set_property PACKAGE_PIN J15 [get_ports {sw[2]}] 
set_property PACKAGE_PIN K15 [get_ports led] 

set_property IOSTANDARD LVCMOS33 [get_ports led] 
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]