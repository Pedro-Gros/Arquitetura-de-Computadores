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

entity ROM_PC_UC is
   port(    clk : in std_logic;
            rst : in std_logic;
				    addr: out unsigned(15 downto 0);
				    data: out unsigned(7 downto 0)
);
end entity;

architecture a_ROM_PC_UC of ROM_PC_UC is

  component program_counter is
    port(	data_in			: in  unsigned(15 downto 0); -- Entrada de Dados
        data_out    	: out unsigned(15 downto 0); -- Saída de Dados
        clk   	    	: in  std_logic;   			 -- Condicao
        rst 			    : in  std_logic;			 -- Flag
        wr_en	    	  : in  std_logic				 -- Write enable
        );
    end component program_counter;

  component rom is
    port (
      clk : in std_logic;
      endereco : in unsigned(15 downto 0);
      dado : out unsigned(7 downto 0)
    );
  end component rom;

  component un_controle is
    port(    clk : in std_logic;
             dado_rom : in unsigned(7 downto 0);
             rst : in std_logic;
             jump_en : out std_logic;
             addr_jump : out unsigned(5 downto 0);
             wr_en : out std_logic
 );
 end component;

  signal pc_in, pc_out : unsigned(15 downto 0) := "0000000000000000";
  signal s_dado_rom : unsigned(7 downto 0) := "00000000";
  signal s_wr_en, s_jump_en : std_logic := '0';
  signal s_addr_jump : unsigned(5 downto 0) := "000000";


  begin

  -- Instanciar o PC
  pc_instance: program_counter port map(pc_in, pc_out, clk, rst, s_wr_en);
  -- Instanciar a ROM
  rom_instance: rom port map(clk, pc_out, s_dado_rom);
  -- Instanciar a ROM_PC_UC
  ROM_PC_UC_instance: un_controle port map(clk, s_dado_rom, rst, s_jump_en, s_addr_jump, s_wr_en);

  pc_in <=  pc_out + 1 when s_jump_en = '0' else
            "0000000000" & s_addr_jump;
	
  addr <= pc_out;
  data <= "00" & s_addr_jump;
end architecture;
