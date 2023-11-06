ghdl --clean
ghdl --remove

ghdl -a Eq06-rom.vhd
ghdl -a Eq06-maq_estados.vhd
ghdl -a Eq06-program_counter.vhd
ghdl -a Eq06-un_controle.vhd
ghdl -a Eq06-ROM_PC_UC.vhd
ghdl -a Eq06-ROM_PC_UC_tb.vhd

ghdl -r ROM_PC_UC_tb --stop-time=1500ns --wave=Eq06-ROM_PC_UC.ghw --ieee-asserts=disable-at-0

pause