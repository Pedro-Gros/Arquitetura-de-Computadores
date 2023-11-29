-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 6 - Calculadora
-- Membros:
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maq_estados is
port(	estado	    	: out unsigned (1 downto 0) ;             -- Saída do estado
		clk   	    	: in  std_logic;   			 -- Condicao
		rst_maq			: in  std_logic			 	 -- Flag
		);
end entity maq_estados;


architecture a_maq_estados of maq_estados is
	signal s_estado: unsigned(1 downto 0) := "00";	-- Inicia no estado 0
begin

	process(clk, rst_maq)
	begin
		if rst_maq = '1' then
			s_estado <= "00";				-- Reset
		elsif rising_edge(clk) then
			if s_estado = "10" then
				s_estado <= "00";
			else
				s_estado <= s_estado + 1;	-- Troca de estado 
			end if;
		end if;
	end process;

	estado <= s_estado;
end architecture;