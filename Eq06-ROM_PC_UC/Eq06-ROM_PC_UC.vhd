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
  port (
    clk : in std_logic;
    rst : in std_logic;
    endereco_rom : out unsigned(15 downto 0);
    dado_rom : in unsigned(7 downto 0);
    jump_enable : in std_logic
  );
end entity;

architecture a_un_controle of un_controle is
  signal pc_out : unsigned(15 downto 0);
  signal estado : std_logic := '0';

  signal opcode: unsigned(1 downto 0);
  begin
   -- coloquei o opcode nos 3 bits MSB
   opcode <= dado_rom(7 downto 6);
   -- meu jump: opcode 11
   jump_enable <= '1' when opcode="11" else
                  '0';

  component program_counter
    port (
      data_out : out unsigned(15 downto 0);
      clk : in std_logic;
      rst : in std_logic;
      wr_en : in std_logic
    );
  end component;

  component rom
    port (
      clk : in std_logic;
      endereco : in unsigned(15 downto 0);
      dado : out unsigned(7 downto 0)
    );
  end component;

begin
  pc_instance: program_counter port map(pc_out, clk, rst, wr_en);

		estado <= 	'0' when rst = '1' else -- Reset para o estado 0 (fetch)
                -- Se o salto estiver habilitado, vá para o estado 1 (decode/execute)
				        '1'         when jump_enable = '1' and rising_edge(clk) else
                -- Caso contrário, alternar estados
				        not estado  when jump_enable = '0' and rising_edge(clk) else
				        '0'';

  -- Conectar a saída do PC à entrada de endereços da ROM
  endereco_rom <= pc_out;

  -- Instanciar a ROM
  rom_instance: rom port map(clk, endereco_rom, dado_rom);


end architecture;
