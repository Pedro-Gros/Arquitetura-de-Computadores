-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 4 - Banco de registradores
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_comp is
port(	reg_in			: in  unsigned(15 downto 0); -- Entrada de Dados
		reg_out    	    : out unsigned(15 downto 0); -- Saída de Dados
		clk   	    	: in  std_logic;   			 -- Condicao
		rst_reg			: in  std_logic;			 -- Flag
		wr_en	    	: in  std_logic				 -- Write enable
		);
end entity register_comp;


architecture a_register_comp of register_comp is
	signal s_register: unsigned(15 downto 0);
begin

	process(clk, rst_reg, wr_en)
	begin
		if rst_reg = '1' then
			s_register <= "0000000000000000";
		elsif wr_en = '1' then
			if rising_edge(clk) then
				s_register <= reg_in;
			end if;
		end if;
	end process;

	reg_out <= s_register;
end architecture;