-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 5 - Unidade de Controle
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maq_estados is
port(	estado_out    	: out std_logic;             -- Saída do estado
		clk   	    	: in  std_logic;   			 -- Condicao
		rst_maq			: in  std_logic			 	 -- Flag
		);
end entity maq_estados;


architecture a_maq_estados of maq_estados is
	signal estado: std_logic := '0';	-- Inicia no estado 0
begin

	process(clk, rst_maq)
	begin
		if rst_maq = '1' then
			estado <= '0';				-- Reset
		elsif rising_edge(clk) then
			estado <= not estado;	-- Troca de estado
		end if;
	end process;

	estado_out <= estado;
end architecture;