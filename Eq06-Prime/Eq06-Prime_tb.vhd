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

entity Prime_tb is
  
end entity;

architecture a_Prime_tb of Prime_tb is

component ROM_PC_UC is
    port(   clk : in std_logic;
            rst : in std_logic;
            addr: out unsigned(15 downto 0);
            data: out unsigned(31 downto 0)
        );
 end component;

  signal s_clk            : std_logic                 := '0';
  signal s_rst            : std_logic                 := '0';
  signal s_addr           : unsigned(15 downto 0)     := "0000000000000000";
  signal s_data           : unsigned(31 downto 0)     := "00000000000000000000000000000000";

begin
  uut: ROM_PC_UC port map (s_clk, s_rst, s_addr, s_data);

  process
    begin
      s_clk   <= '1';
      wait for 50 ns;
      s_clk   <= '0';
      wait for 50 ns;
  end process;

  process
    begin
      s_rst <= '1'; -- Ativa o reset
      wait for 100 ns;
      s_rst <= '0'; -- Desativa o reset
      wait for 100 ns;
      wait;
  end process;

end architecture;
