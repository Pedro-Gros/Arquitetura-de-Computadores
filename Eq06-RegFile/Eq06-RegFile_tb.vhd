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

entity Reg_tb is
end;

architecture a_Reg_tb of Reg_tb is
    component RegistersBank
    port( 	A1			: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
            A2    		: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
            WD3   		: in unsigned(15  downto 0);   -- Barramento de dados para escrita
            A3    		: in unsigned(2 downto 0);     -- Seleção de qual registrador será escrito
            WE3   		: in std_logic;                -- Write enable (habilita a escrita no momento correto)
            CLK     	: in std_logic;                -- Clock
            rst     	: in std_logic;                -- Reset
       
            RD1     	: out unsigned(15  downto 0); -- Dados dos registradores lidos
            RD2     	: out unsigned(15  downto 0)  -- Dados dos registradores lidos
        );
    end component;
    
    signal s_A1, s_A2, s_A3     : unsigned(2 downto 0) 	:= "000";
    signal s_WD3, s_RD1, s_RD2  : unsigned(15 downto 0) := "0000000000000000";
    signal s_WE3, s_CLK, s_rst  : std_logic             := '0';

    begin
    uut: RegistersBank port map(s_A1, s_A2, s_WD3, s_A3, s_WE3, s_CLK, s_rst, s_RD1, s_RD2);
    process
        begin
            ---FAZER O TESTE AQUI
    end process;

end architecture;