ghdl --clean
ghdl --remove

ghdl -a Eq06-reg16bits.vhd
ghdl -a Eq06-RegFile.vhd
ghdl -a Eq06-RegFile_tb.vhd

ghdl -r Reg_tb --stop-time=900ns --wave=Eq06-RegFile.ghw --ieee-asserts=disable-at-0

pause