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
	component Register is
		port( in			: in  unsigned(15 downto 0); -- Entrada de Dados
			  out   		: out unsigned(15 downto 0); -- Saída de Dados
			  clk			: in  std_logic;   			 -- Condicao
			  rst			: in  std_logic;			 -- Flag
			  wr_en			: in  std_logic				 -- Write enable
			 );
	   end component Register;

	-- Sinais de entrada dos registradores
	signal in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7			: unsigned(15 downto 0);
	-- Sinais de saida dos registradores
	signal out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7	: unsigned(15 downto 0);

	begin
		-- Instanciando registrador 0
		rg0: Register port map(in_0, out_0, CLK, rst, WE3);
		-- Instanciando registrador 1
		rg1: Register port map(in_1, out_1, CLK, rst, WE3);
		-- Instanciando registrador 2
		rg2: Register port map(in_2, out_2, CLK, rst, WE3);
		-- Instanciando registrador 3
		rg3: Register port map(in_3, out_3, CLK, rst, WE3);
		-- Instanciando registrador 4
		rg4: Register port map(in_4, out_4, CLK, rst, WE3);
		-- Instanciando registrador 5
		rg5: Register port map(in_5, out_5, CLK, rst, WE3);
		-- Instanciando registrador 6
		rg6: Register port map(in_6, out_6, CLK, rst, WE3);
		-- Instanciando registrador 7
		rg7: Register port map(in_7, out_7, CLK, rst, WE3);

		-- Saida 1 recebe o valor do registrador selecionado por A1
		RD1 <= 	out_0 when A1 = "000" else
				out_1 when A1 = "001" else
				out_2 when A1 = "010" else
				out_3 when A1 = "011" else
				out_4 when A1 = "100" else
				out_5 when A1 = "101" else
				out_6 when A1 = "110" else
				out_7 when A1 = "111" else
				"0000000000000000";

		-- Saida 2 recebe o valor de saida do registrador selecionado por A2				
		RD2 <= 	out_0 when A2 = "000" else
				out_1 when A2 = "001" else
				out_2 when A2 = "010" else
				out_3 when A2 = "011" else
				out_4 when A2 = "100" else
				out_5 when A2 = "101" else
				out_6 when A2 = "110" else
				out_7 when A2 = "111" else
				"0000000000000000";

		-- ISSO SO ACONTECE CASO O WE3 FOR IGUAL A 1, PRECISA DE UM PROCESS AQUI PARA FAZER O IF
		-- PRECISA TAMBEM FAZER A CONDIÇÃO DE RESET QUE ZERA TODOS OS REGISTRADORES
		
		-- Entrada WD3 é enviada para a entrada do registrador selecionado por A3
		WD3 => 	in_0 when A3 = "000" else -- registrador 0 é sempre 0? Acho que esta escrito na atividade mas agora estou compreguiça de verificar. Ver depois!!!!
				in_1 when A3 = "001" else
				in_2 when A3 = "010" else
				in_3 when A3 = "011" else
				in_4 when A3 = "100" else
				in_5 when A3 = "101" else
				in_6 when A3 = "110" else
				in_7 when A3 = "111" else
				"0000000000000000";

end architecture;
