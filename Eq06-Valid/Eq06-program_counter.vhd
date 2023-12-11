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

entity program_counter is
port(	data_in			: in  unsigned(15 downto 0); -- Entrada de Dados
		data_out    	: out unsigned(15 downto 0); -- Saída de Dados
		clk   	    	: in  std_logic;   			 -- Condicao
		rst 			: in  std_logic;			 -- Flag
		wr_en	    	: in  std_logic				 -- Write enable
		);
end entity program_counter;


architecture a_program_counter of program_counter is
	signal counter: unsigned(15 downto 0);
begin

	process(clk, rst, wr_en)
	begin
		if rst = '1' then
			counter <= "0000000000000000";
		elsif wr_en = '1' then
			if rising_edge(clk) then
				counter <= data_in;
			end if;
		end if;
	end process;

	data_out <= counter;
end architecture;