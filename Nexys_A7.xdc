
## Nexys A7 100 MHz Clock
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 [get_ports clk]

## Reset - Center Push Button
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports reset]

## Emergency - Up Push Button
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports emergency]

## North-South Traffic Lights
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports red_ns]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports yellow_ns]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports green_ns]

## East-West Traffic Lights
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports red_ew]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports yellow_ew]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports green_ew]
