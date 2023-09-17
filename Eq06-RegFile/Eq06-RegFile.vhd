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

	-- Sinais de entrada dos registradores
	signal in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7			: unsigned(15 downto 0);
	-- Sinais de saida dos registradores
	signal out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7	: unsigned(15 downto 0);

	begin
		-- Instanciando registrador 0
		rg0: register_comp port map(in_0, out_0, CLK, rst, WE3);
		-- Instanciando registrador 1
		rg1: register_comp port map(in_1, out_1, CLK, rst, WE3);
		-- Instanciando registrador 2
		rg2: register_comp port map(in_2, out_2, CLK, rst, WE3);
		-- Instanciando registrador 3
		rg3: register_comp port map(in_3, out_3, CLK, rst, WE3);
		-- Instanciando registrador 4
		rg4: register_comp port map(in_4, out_4, CLK, rst, WE3);
		-- Instanciando registrador 5
		rg5: register_comp port map(in_5, out_5, CLK, rst, WE3);
		-- Instanciando registrador 6
		rg6: register_comp port map(in_6, out_6, CLK, rst, WE3);
		-- Instanciando registrador 7
		rg7: register_comp port map(in_7, out_7, CLK, rst, WE3);

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

		process(rst, WE3, A3)
		begin
			-- Caso a flag de reset esteja habilitada, reseta todos os registradores para 0(zero)!
			if rst = '1' then
				in_0 <= "0000000000000000";
				in_1 <= "0000000000000000";
				in_2 <= "0000000000000000";
				in_3 <= "0000000000000000";
				in_4 <= "0000000000000000";
				in_5 <= "0000000000000000";
				in_6 <= "0000000000000000";
				in_7 <= "0000000000000000";
			-- Os registradores são escritos caso a flag de rst não esteja habilitada, mas a flag de escrita esteja!
			elsif WE3 = '1' then
				-- Entrada WD3 é enviada para a entrada do registrador selecionado por A3
				if 		A3 = "001" then in_1 <= WD3;
				elsif 	A3 = "010" then in_2 <= WD3;
				elsif 	A3 = "011" then in_3 <= WD3;
				elsif 	A3 = "100" then in_4 <= WD3;
				elsif 	A3 = "101" then in_5 <= WD3;
				elsif 	A3 = "110" then in_6 <= WD3;
				elsif 	A3 = "111" then in_7 <= WD3;
				-- registrador 0 sempre possui o valor 0 (zero). Por esse motivo não é possivel modifica-lo!
				else					in_0 <= "0000000000000000";
				end if;
			end if;
		end process;
end architecture;
