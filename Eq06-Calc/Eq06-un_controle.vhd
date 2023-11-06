-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 5 - Unidade de Controle
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle is
   port(    clk : in std_logic;
            dado_rom : in unsigned(31 downto 0);
            rst : in std_logic;
            jump_en : out std_logic;
            const : out unsigned(15 downto 0);
            wr_en : out std_logic
);
end entity;

architecture a_un_controle of un_controle is

  component maq_estados is
    port(	estado    	: out unsigned (1 downto 0);             -- Saída do estado
            clk   	    	: in  std_logic;   			 -- Condicao
            rst_maq			: in  std_logic			 	 -- Flag
        );
    end component maq_estados;
    
  component ULARegs is
    port( 	A1			    : in unsigned(2 downto 0);		-- Seleção de quais registradores serão lidos
            A2    		  : in unsigned(2 downto 0);     	-- Seleção de quais registradores serão lidos
            A3    		  : in unsigned(2 downto 0);     	-- Seleção de qual registrador será escrito
            WE3   		  : in std_logic;                	-- Write enable (habilita a escrita no momento correto)
            CLK     	  : in std_logic;                	-- Clock
            rst     	  : in std_logic;                	-- Reset
            op   		    : in unsigned(2  downto 0);	   	-- Seleciona operacao na ULA
            flags 		  : out unsigned(1 downto 0);		-- Flags da ULA
            in_ext 		  : in unsigned(15 downto 0);  	-- Valor de input externo
            select_MUX 	: in std_logic				 	-- Selecao do MUX
       );
   end component ULARegs;

  signal sSelect_MUX, s_wr_en: std_logic;
  signal s_estado, s_flags : unsigned (1 downto 0);
  signal opcode: unsigned(6 downto 0);
  signal sRegA, sRegB, sRegC, sOp_Sel: unsigned (2 downto 0);
  signal sConst: unsigned(15 downto 0);

  begin
  -- Instanciar a MAQ_ESTADOS
  maq_instance: maq_estados port map(s_estado, clk, rst);
  ULARegs_instance: ULARegs port map(sRegC, sRegA, sRegB, s_wr_en, clk, rst, sOp_Sel, s_flags, sConst, sSelect_MUX);

  s_wr_en <= '1' when s_estado = "10" else
           '0';

   -- coloquei o opcode nos 7 bits MSB
   opcode <= dado_rom(31 downto 25);
   
   sRegA <= dado_rom(24 downto 22);
   
   sRegB <= dado_rom(21 downto 19);

   sRegC <= dado_rom(18 downto 16);

   sConst <= dado_rom(15 downto 0);
  
   sSelect_MUX <= '1' when opcode = "0000100" else -- Addi
                  '1' when opcode = "0000111" else -- Subi
                  '0';

   -- meu jump: opcode 1111111
   jump_en <= '1' when opcode="1111111" else
              '0';

   sOp_Sel <= "000" when opcode = "0000000" else -- Add
              "000" when opcode = "0000100" else -- Addi
              "001" when opcode = "0000010" else -- Div
              "110" when opcode = "0000011" else -- Sub
              "110" when opcode = "0000111" else -- Subi
              "111";

  wr_en <= s_wr_en;

end architecture;
