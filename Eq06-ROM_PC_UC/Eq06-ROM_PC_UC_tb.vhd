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

entity un_controle_tb is
end entity;

architecture a_un_controle_tb of un_controle_tb is
  component un_controle is
    port (  clk             : in std_logic;
            rst             : in std_logic;
            endereco_rom    : out unsigned(15 downto 0);
            dado_rom        : in unsigned(7 downto 0);
            jump_enable     : in std_logic
    );
  end component;

  signal s_clk            : std_logic     := '0';
  signal s_rst            : std_logic     := '0';
  signal s_jump_enable    : std_logic     := '0';
  signal s_endereco_rom   : unsigned(15 downto 0);
  signal s_dado_rom       : unsigned(7 downto 0);

begin
  uut: un_controle port map (s_clk, s_reset, s_endereco_rom, s_dado_rom, s_jump_enable);

  process
    begin
      s_clk   <= '0';
      wait for 50 ns;
      s_clk   <= '1';
      wait for 50 ns;
  end process;

  process
    begin
      s_reset <= '1'; -- Ativa o reset
      wait for 100 ns;
      s_reset <= '0'; -- Desativa o reset
      wait for 100 ns;

      wait for 100 ns;
      wait;
  end process;

end architecture;
