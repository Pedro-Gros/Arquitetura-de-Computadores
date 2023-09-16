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

entity RegistersBank is
 port( A1   	: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
	    A2    	: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
	    WD3   	: in unsigned(15  downto 0);   -- Barramento de dados para escrita
	    A3    	: in unsigned(2 downto 0);     -- Seleção de qual registrador será escrito
	    WE3   	: in std_logic;                -- Write enable (habilita a escrita no momento correto)
       CLK     : in std_logic;                -- Clock
       rst     : in std_logic;                -- Reset

       RD1     : out unsigned(15  downto 0); -- Dados dos registradores lidos
       RD2     : out unsigned(15  downto 0)  -- Dados dos registradores lidos
	  );
end entity;


architecture a_RegistersBank of RegistersBank is
	begin
end architecture;
