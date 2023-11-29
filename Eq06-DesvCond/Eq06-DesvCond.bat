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
ghdl -a Eq06-DesvCond_tb.vhd

ghdl -r DesvCond_tb --stop-time=6500ns --wave=Eq06-DesvCond.ghw --ieee-asserts=disable-at-0

pause