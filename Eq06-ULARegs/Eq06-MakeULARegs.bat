ghdl --clean
ghdl --remove

ghdl -a Eq06-reg16bits.vhd
ghdl -a Eq06-RegFile.vhd
ghdl -a Eq06-ULA.vhd
ghdl -a Eq06-ULARegs.vhd
ghdl -a Eq06-ULARegs_tb.vhd

ghdl -r ULARegs_tb --stop-time=500ns --wave=Eq06-ULARegs.ghw --ieee-asserts=disable-at-0

pause