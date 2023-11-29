-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 6 - Calculadora
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
        0  => b"0000100_100_000_000_0000000000000100", -- addi $4,  $0,  4
        1  => b"0000100_101_000_000_0000000000000110", -- addi $5,  $0,  6
        2  => b"0000000_110_100_101_0000000000000000", -- add  $6,  $4,  $5
        3  => b"0000111_110_110_000_0000000000000010", -- subi $6,  $6,  2
        4  => b"1111111_000_000_000_0000000000001111", -- j end15
        5  => b"1000000_000_000_000_0000000000000000",
        6  => b"1000000_000_000_000_0000000000000000",
        7  => b"1000000_000_000_000_0000000000000000",
        8  => b"1000000_000_000_000_0000000000000000",
        9  => b"1000000_000_000_000_0000000000000000",
        10 => b"1000000_000_000_000_0000000000000000",
        11 => b"1000000_000_000_000_0000000000000000",
        12 => b"1000000_000_000_000_0000000000000000",
        13 => b"1000000_000_000_000_0000000000000000",
        14 => b"1000000_000_000_000_0000000000000000",
        15 => b"0000000_100_000_110_0000000000000000", -- add  $4,  $0, $6
        16 => b"0000110_111_110_000_0000000000000011", -- divi $7,  $6, 3
        17 => b"1111111_000_000_000_0000000000000010", -- j end3
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
   