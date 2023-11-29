ghdl --clean
ghdl --remove

ghdl -a Eq06-rom.vhd
ghdl -a Eq06-maq_estados.vhd
ghdl -a Eq06-program_counter.vhd
ghdl -a Eq06-ULA.vhd
ghdl -a Eq06-reg16bits.vhd
ghdl -a Eq06-RegFile.vhd
ghdl -a Eq06-ULARegs.vhd
ghdl -a Eq06-un_controle.vhd
ghdl -a Eq06-ROM_PC_UC.vhd
ghdl -a Eq06-Calc_tb.vhd

ghdl -r CALC_tb --stop-time=3500ns --wave=Eq06-Calc.ghw --ieee-asserts=disable-at-0

pause