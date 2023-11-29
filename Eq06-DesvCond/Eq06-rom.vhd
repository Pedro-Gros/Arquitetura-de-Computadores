-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 7 - Desvio Condicional
-- Membros:
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is 
    port(   clk : in std_logic;
            endereco : in unsigned(15 downto 0);
            dado : out unsigned(31 downto 0)
        );
end entity;

architecture a_rom of rom is
    type mem is array (0 to 127) of unsigned(31 downto 0);
    constant conteudo_rom : mem := (
        -- caso endereco => conteudo (apenas exemplo. Altere para refletir o
        -- programa solicitado)
        0  => b"0001000_011_000_000_0000000000001010", -- addi $3, $0, $0, 10
        1  => b"0001000_100_000_000_0000000000000101", -- addi $4, $0, $0, 5
        2  => b"0001000_001_001_000_0000000000000001", -- addi $1, $1, $0, 1
        3  => b"0000000_010_010_011_0000000000000000", -- add  $2, $2, $3, 0
        4  => b"1110110_000_001_100_0000000000000010", -- bneq $1, @4, 2
        5  => b"1000000_000_000_000_0000000000000101", -- jump 5
        -- abaixo: casos omissos => (zero em todos os bits a decodificação do pc
        --é parcial dos 7 least significat bits)
        others => (others=>'0')
    );
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            dado <= conteudo_rom(to_integer(endereco));
        end if;
    end process;
end architecture;
   