ghdl --clean
ghdl --remove

ghdl -a Eq06-ULA.vhd
ghdl -a Eq06-ULA_tb.vhd
ghdl -r ULA_tb --wave=Eq06-ULA.ghw --ieee-asserts=disable-at-0

pause