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
            dado_rom : in unsigned(7 downto 0);
            rst : in std_logic;
            jump_en : out std_logic;
            addr_jump : out unsigned(5 downto 0);
            wr_en : out std_logic
);
end entity;

architecture a_un_controle of un_controle is

  component maq_estados is
    port(	estado_out    	: out std_logic;             -- Saída do estado
            clk   	    	: in  std_logic;   			 -- Condicao
            rst_maq			: in  std_logic			 	 -- Flag
        );
    end component maq_estados;

  signal s_estado_out : std_logic := '0';
  signal opcode: unsigned(1 downto 0);

  begin
  -- Instanciar a MAQ_ESTADOS
  maq_instance: maq_estados port map(s_estado_out, clk, rst);

  wr_en <= '1' when s_estado_out = '1' else
            '0';

   -- coloquei o opcode nos 3 bits MSB
   opcode <= dado_rom(7 downto 6);

   addr_jump <= dado_rom(5 downto 0);

   -- meu jump: opcode 11
   jump_en <= '1' when opcode="11" else
               '0';

end architecture;
