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
			s_clk   <= '0';
			wait for 50 ns;
			s_clk   <= '1';
			wait for 50 ns;
	end process;
	
	process
		begin			
			s_rst <= '1'; -- Ativa o reset
			wait for 100 ns;
			s_rst <= '0'; -- Desativa o reset
			wait for 100 ns;

			s_A3 <= "001"; 			   -- Seleciona o registrador 1
			s_WD3 <= "0001110000000100"; -- Valor a ser escrito
			s_WE3 <= '1'; 			   -- Ativa a escrita
			wait for 100 ns;

			s_A3 <= "010"; 			   -- Seleciona o registrador 2
			s_WD3 <= "0000111001100111"; -- Valor a ser escrito
			s_WE3 <= '1'; 			   -- Ativa a escrita
			wait for 100 ns;

			s_A1 <= "001"; 			   -- Seleciona o registrador 1
			s_A2 <= "010"; 			   -- Seleciona o registrador 2
			wait for 100 ns;
			s_A1 <= "010"; 			   -- Seleciona o registrador 1
			s_A2 <= "001"; 			   -- Seleciona o registrador 2
			wait for 100 ns;
			
			s_rst <= '1'; -- Ativa o reset
			wait for 100 ns;
			s_rst <= '0'; -- Desativa o reset
			wait for 100 ns;

			wait;
    end process;

end architecture;