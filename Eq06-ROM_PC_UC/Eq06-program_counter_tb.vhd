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

entity program_counter_tb is
end entity;

architecture a_program_counter_tb of program_counter_tb is
  component program_counter
  port(   data_out  : out unsigned(15 downto 0);
          clk       : in std_logic;
          rst       : in std_logic;
          wr_en     : in std_logic
    );
  end component;

  signal s_clk      : std_logic             := '0';
  signal s_rst      : std_logic             := '0';
  signal s_wr_en    : std_logic             := '0';
  signal s_data_out : unsigned(15 downto 0) := "0000000000000000";

begin
  uut: program_counter port map(s_data_out, s_clk, s_rst, s_wr_en);

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
      wr_en <= '1';
      wait for 100 ns;
      wr_en <= '0';
      wait for 100 ns;
      wait;
  end process;

end architecture;
