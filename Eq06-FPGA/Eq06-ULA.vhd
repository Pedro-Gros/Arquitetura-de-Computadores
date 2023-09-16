-------------------------------------------------------------------------------
-- Equipe n° 06
-- Data: 03/09/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 3 - Síntese e teste de circuitos combinacionais reais em FPGA
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
-------------------------------------------------------------------------------

-- Foi utilizado como base o circuito da ULA desenvolvido pela equipe n°6 
-- para o laboratório 2 - ULA para a disciplina de Arquitetura e Organizacao 
-- de Computadores no 2° semestre de 2023 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
 port( in_A 	: in  unsigned(15 downto 0);
	   in_B 	: in  unsigned(15 downto 0);
	   op   	: in  unsigned(1  downto 0); 
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
		tmp <=	in_A + in_B 			when op = "00" else
			 		in_A / in_B 		when op = "01" else
					tmp2(15 downto 0) 	when op = "10" else
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
