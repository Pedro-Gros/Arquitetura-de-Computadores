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
end entity;


architecture a_RegistersBank of RegistersBank is

	-- Declaração do componente registrador
	component register_comp is
		port(	reg_in			: in  unsigned(15 downto 0); -- Entrada de Dados
				reg_out    	    : out unsigned(15 downto 0); -- Saída de Dados
				clk   	    	: in  std_logic;   			 -- Condicao
				rst_reg			: in  std_logic;			 -- Flag
				wr_en	    	: in  std_logic				 -- Write enable
				);
	end component register_comp;

	-- Sinais de saida dos registradores
	signal out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7	: unsigned(15 downto 0);
	-- Sinais de enable para cada registrador
	signal s_WE3_0, s_WE3_1, s_WE3_2, s_WE3_3, s_WE3_4, s_WE3_5, s_WE3_6, s_WE3_7 : std_logic := '0';

	begin
		-- Instanciando registrador 0
		rg0: register_comp port map(WD3, out_0, CLK, rst, s_WE3_0);
		-- Instanciando registrador 1
		rg1: register_comp port map(WD3, out_1, CLK, rst, s_WE3_1);
		-- Instanciando registrador 2
		rg2: register_comp port map(WD3, out_2, CLK, rst, s_WE3_2);
		-- Instanciando registrador 3
		rg3: register_comp port map(WD3, out_3, CLK, rst, s_WE3_3);
		-- Instanciando registrador 4
		rg4: register_comp port map(WD3, out_4, CLK, rst, s_WE3_4);
		-- Instanciando registrador 5
		rg5: register_comp port map(WD3, out_5, CLK, rst, s_WE3_5);
		-- Instanciando registrador 6
		rg6: register_comp port map(WD3, out_6, CLK, rst, s_WE3_6);
		-- Instanciando registrador 7
		rg7: register_comp port map(WD3, out_7, CLK, rst, s_WE3_7);

		-- Saida 1 recebe o valor do registrador selecionado por A1
		RD1 <= 	out_1 when A1 = "001" else
				out_2 when A1 = "010" else
				out_3 when A1 = "011" else
				out_4 when A1 = "100" else
				out_5 when A1 = "101" else
				out_6 when A1 = "110" else
				out_7 when A1 = "111" else
				"0000000000000000";

		-- Saida 2 recebe o valor de saida do registrador selecionado por A2				
		RD2 <=	out_1 when A2 = "001" else
				out_2 when A2 = "010" else
				out_3 when A2 = "011" else
				out_4 when A2 = "100" else
				out_5 when A2 = "101" else
				out_6 when A2 = "110" else
				out_7 when A2 = "111" else
				"0000000000000000";

		s_WE3_1 <= '1' when A3 = "001" and WE3 = '1' else '0';
		s_WE3_2 <= '1' when A3 = "010" and WE3 = '1' else '0';
		s_WE3_3 <= '1' when A3 = "011" and WE3 = '1' else '0';
		s_WE3_4 <= '1' when A3 = "100" and WE3 = '1' else '0';
		s_WE3_5 <= '1' when A3 = "101" and WE3 = '1' else '0';
		s_WE3_6 <= '1' when A3 = "110" and WE3 = '1' else '0';
		s_WE3_7 <= '1' when A3 = "111" and WE3 = '1' else '0';
		

end architecture;