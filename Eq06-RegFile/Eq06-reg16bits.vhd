-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 3 - Banco de registradores
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register is
 port( in			: in  unsigned(15 downto 0); -- Entrada de Dados
	   out    	    : out unsigned(15 downto 0); -- Saída de Dados
	   clk   	    : in  std_logic;   			 -- Condicao
	   rst			: in  std_logic;			 -- Flag
	   wr_en	    : in  std_logic				 -- Write enable
	  );
end entity Register;


architecture a_Register of Register is
	signal register: unsigned(15 downto 0);
begin

	process(clk, rst, wr_en)
	begin
		if rst = '1' then
		register <= "0000000000000000";
		elsif wr_en = '1' then
			if rising_edge(clk) then
				register <= in;
			end if;
		end if;
	end process;

	out <= register;
end architecture;
