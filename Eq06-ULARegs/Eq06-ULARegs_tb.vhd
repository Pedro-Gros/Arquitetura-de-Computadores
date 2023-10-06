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

entity ULARegs_tb is
end;

architecture a_ULARegs_tb of ULARegs_tb is
    component RegistersBank
    port(	A1			: in unsigned(2 downto 0);		-- Seleção de quais registradores serão lidos
		 	A2    		: in unsigned(2 downto 0);     	-- Seleção de quais registradores serão lidos
			A3    		: in unsigned(2 downto 0);     	-- Seleção de qual registrador será escrito
			WE3   		: in std_logic;                	-- Write enable (habilita a escrita no momento correto)
			CLK     	: in std_logic;                	-- Clock
			rst     	: in std_logic;                	-- Reset

			op   		: in unsigned(2  downto 0);	   	-- Seleciona operacao na ULA
			flags 		: out unsigned(1 downto 0);		-- Flags da ULA
			in_ext 		: in unsigned(15 downto 0);  	-- Valor de input externo
			select_MUX 	: in std_logic;				 	-- Selecao do MUX
        );
    end component;
    
    signal s_A1, s_A2, s_A3     : unsigned(2 downto 0) 	:= "000";
    signal s_WE3, s_CLK, s_rst  : std_logic             := '0';
	signal s_op					: unsigned(2 downto 0) 	:= "000";
	signal s_flags				: unsigned(1 downto 0)	:= "00";
    signal s_in_ext			    : unsigned(15 downto 0) := "0000000000000000";
	signal s_select_MUX			: std_logic				:= '0';

    begin
    uut: RegistersBank port map(s_A1, s_A2, s_WD3, s_A3, s_WE3, s_CLK, s_rst, s_RD1, s_RD2);
    process
        begin
			s_CLK   <= '0';
			wait for 50 ns;
			s_CLK   <= '1';
			wait for 50 ns;
	end process;
	
	process
		begin
			-- O teste deve conter inicialmente um reset explícito
			s_rst <= '1'; -- Ativa o reset
			wait for 100 ns;
			s_rst <= '0'; -- Desativa o reset
			wait for 100 ns;

			-- Seguido de 2 escritas dos RAs truncados da equipe em registradores 
			-- distintos (R6 e R7).
			s_A3 			<= "110"; 			   	-- Seleciona o registrador 6
			s_select_MUX 	<= '1';			 	   	-- Seleciona entrada externa
			s_in_ext 		<= "0001110000000100"; 	-- Valor a ser escrito
			s_op 			<= "000";			  	-- Soma
			s_A1			<= "000";				-- Seleciona o registrador 0
			s_WE3			<= '1'; 			   	-- Ativa a escrita
			wait for 100 ns;

			s_A3 			<= "111"; 			   	-- Seleciona o registrador 7
			s_select_MUX 	<= '1';				   	-- Seleciona entrada externa
			s_in_ext 		<= "0000111001100111";  -- Valor a ser escrito
			s_op			<- "000";			   	-- Soma
			s_A1			<= "000";			   	-- Seleciona o registrador 0
			s_WE3 			<= '1'; 			   	-- Ativa a escrita
			wait for 100 ns;

			-- O cáculo da divisão R6/R7 com o resultado em R6. 
			s_A3 			<= "110"; 			   	-- Seleciona o registrador 6
			s_select_MUX 	<= '0';					-- Seleciona entrada interna
			s_op 			<= "001";				-- divisão
			s_A1			<= "110";				-- Seleciona o registrador 6
			s_A2			<= "111";				-- Seleciona o registrador 7
			s_WE3			<= '1'					-- Ativa a escrita
			wait for 100 ns;

			 -- Em seguida uma divisão de R6 por $zero
			s_A3 			<= "110"; 			   	-- Seleciona o registrador 6
			s_select_MUX 	<= '0';					-- Seleciona entrada interna
			s_op 			<= "001";				-- divisão
			s_A1			<= "110";				-- Seleciona o registrador 6
			s_A2			<= "000";				-- Seleciona o registrador 0
			s_WE3			<= '1'					-- Ativa a escrita
			wait for 100 ns;

			wait;
    end process;

end architecture;