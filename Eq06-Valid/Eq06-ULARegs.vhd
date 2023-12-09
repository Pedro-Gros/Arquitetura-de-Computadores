-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 8 - Prime
-- Membros:
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULARegs is
 port( 	A1			: in unsigned(2 downto 0);		-- Seleção de quais registradores serão lidos
		A2    		: in unsigned(2 downto 0);     	-- Seleção de quais registradores serão lidos
		A3    		: in unsigned(2 downto 0);     	-- Seleção de qual registrador será escrito
		WE3   		: in std_logic;                	-- Write enable (habilita a escrita no momento correto)
		CLK     	: in std_logic;                	-- Clock
		rst     	: in std_logic;                	-- Reset
		op   		: in unsigned(2  downto 0);	   	-- Seleciona operacao na ULA
		flags 		: out unsigned(1 downto 0);		-- Flags da ULA
		in_ext 		: in unsigned(15 downto 0);  	-- Valor de input externo
		select_MUX 	: in std_logic;				 	-- Selecao do MUX
		debug_reg: 	 in unsigned (2 downto 0);      -- ligar em chaves p.ex.: debug_reg => S WITCH_HW(2 downto 0);
		debug_valor: out	unsigned(15 downto 0)   -- ligar na entrada de dados do RAMDisp, p.ex.: debug_valor => dado_inRAMDisp;	  
	  );
end entity;

architecture a_ULARegs of ULARegs is

	-- Declaração do ULA
	component ULA is
	 port( in_A 	: in  unsigned(15 downto 0);
		   in_B 	: in  unsigned(15 downto 0);
		   op   	: in  unsigned(2  downto 0); 
		   out_ULA 	: out unsigned(15 downto 0);
		   flags 	: out unsigned(1 downto 0)
		  );
	end component;
	
	-- Declaração do RegistersBank
	component RegistersBank is
	 port( 	A1			: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
			A2    		: in unsigned(2 downto 0);     -- Seleção de quais registradores serão lidos
			WD3   		: in unsigned(15  downto 0);   -- Barramento de dados para escrita
			A3    		: in unsigned(2 downto 0);     -- Seleção de qual registrador será escrito
			WE3   		: in std_logic;                -- Write enable (habilita a escrita no momento correto)
			CLK     	: in std_logic;                -- Clock
			rst     	: in std_logic;                -- Reset

			RD1     	: out unsigned(15  downto 0); -- Dados dos registradores lidos
			RD2     	: out unsigned(15  downto 0);  -- Dados dos registradores lidos
			debug_reg: 	 in unsigned (2 downto 0);      -- ligar em chaves p.ex.: debug_reg => S WITCH_HW(2 downto 0);
			debug_valor: out	unsigned(15 downto 0)   -- ligar na entrada de dados do RAMDisp, p.ex.: debug_valor => dado_inRAMDisp;	
		  );
	end component;
	
	-- Sinais da ULA
	signal s_in_A, s_in_B, s_out_ULA 	: unsigned(15 downto 0);
	
	-- Sinais do RegistersBank
	signal s_WD3, s_RD1, s_RD2 			: unsigned(15 downto 0);
	
	-- Sinais do MUX
	signal s_out_MUX					: unsigned(15 downto 0);
	
	-- Sinais debug
	signal s_debug_reg : unsigned(2 downto 0);
	signal s_debug_valor : unsigned(15 downto 0);
	
	begin
		-- Instanciando ULA
		ula0: ULA port map(s_in_A, s_in_B, op, s_out_ULA, flags);
		-- Instanciando RegistersBank
		rb: RegistersBank port map(A1, A2, s_WD3, A3, WE3, CLK, rst, s_RD1, s_RD2, s_debug_reg, s_debug_valor);
		
		s_WD3 <= s_out_ULA;
		s_in_A <= s_RD1;
		
		s_out_MUX <=	s_RD2 	when select_MUX = '0' else
						in_ext 	when select_MUX = '1' else
						"0000000000000000";
		
		s_in_B <= s_out_MUX;
		
		s_debug_reg <= debug_reg;
		debug_valor <= s_debug_valor;
end architecture;