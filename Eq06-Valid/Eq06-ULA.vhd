-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 8 - Prime
-- Membros:
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
 port( in_A 	: in  unsigned(15 downto 0);
	   in_B 	: in  unsigned(15 downto 0);
	   op   	: in  unsigned(2  downto 0); 
	   out_ULA 	: out unsigned(15 downto 0);
	   flags 	: out unsigned(1 downto 0)
	  );
end entity;


architecture a_ULA of ULA is
	signal tmp : unsigned(15 downto 0);
	signal tmp2 : unsigned(31 downto 0);
	begin
		out_ULA <= tmp;
		tmp2 <= in_A*in_B;
		-- operation mux	  
		tmp <=	in_A + in_B 			when op = "000" else
			 		in_A / in_B 		when op = "001" and in_B /= "0000000000000000" else -- tratativa do 0 inserida
					in_A rem in_B		when op = "010" and in_B /= "0000000000000000" else
					tmp2(15 downto 0) 	when op = "011" else
					in_A XOR in_B 		when op = "100" else
					NOT in_A 			when op = "101" else
					in_A - in_B			when op = "110" else
					"0000000000000000";
		-- signal flag
		flags(0) <= '1' 	when in_A > in_B 	else
					'0' 	when in_A < in_B 	else
			 		'0' 	when in_A = in_B 	else
					'0';
		-- rasult zero flag
		flags(1) <= '1' when tmp = "0000000000000000" 	else
					'0' when tmp /= "0000000000000000" 	else
					'0';
end architecture;
