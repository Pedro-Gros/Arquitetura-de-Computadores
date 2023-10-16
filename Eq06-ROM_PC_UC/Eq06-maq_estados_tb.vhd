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

entity maq_estados_tb is
end entity;

architecture a_maq_estados_tb of maq_estados_tb is
  component maq_estados
  port(	  estado_out  : out std_logic;
          clk   	    : in  std_logic;
          rst_maq			: in  std_logic
    );
  end component;

  signal s_clk : std_logic := '0';
  signal s_reset : std_logic := '0';
  signal s_estado : std_logic := '0';

begin
  uut: maq_estados port map (s_clk, s_reset, s_estado);

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
      s_estado <= '1';
      wait for 100 ns;
      s_estado <= '0';
      wait for 100 ns;
      s_estado <= '1';
      wait for 100 ns;
      s_estado <= '0';
      wait for 100 ns;
      wait;
  end process;

end architecture;
