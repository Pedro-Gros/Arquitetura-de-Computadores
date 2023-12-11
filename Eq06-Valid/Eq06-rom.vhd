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
        0  => b"0001000_001_000_000_0000000000011110", -- addi $1, $0, $0, 30
        1  => b"0001000_010_000_000_0000000000000010", -- addi $2, $0, $0, 2
        2  => b"0001000_011_000_000_0000000000000010", -- addi $3, $0, $0, 2
        3  => b"1110110_001_010_011_0000000000001000", -- beq $2, $3, 8
        4  => b"0000010_100_010_011_0000000000000000", -- rem $4, $2, $3
        5  => b"1110110_001_000_100_0000000000001110", -- beq $0, $4, 14
        6  => b"0001000_011_011_000_0000000000000001", -- addi $3, $3, 1
        7  => b"1000000_000_000_000_0000000000000011", -- jump 3
        8  => b"0000000_111_010_000_0000000000000000", -- add $7, $2, $0
        9  => b"0001000_110_110_000_0000000000000001", -- addi $6, $6, 1
        10 => b"0001000_010_010_000_0000000000000001", -- addi $2, $2, 1
        11 => b"0001000_011_000_000_0000000000000010", -- addi $3, $0, 2
        12 => b"1110110_000_010_001_0000000000000011", -- bneq $2, $1, 3
        13 => b"1000000_000_000_000_0000000000000011", -- jump 3
        14 => b"0001000_010_010_000_0000000000000001", -- addi $2, $2, 1
        15 => b"0001000_011_000_000_0000000000000010", -- addi $3, $0, 2
        16 => b"1110110_000_010_001_0000000000000011", -- bneq $2, $1, 3
        17 => b"1000000_000_000_000_0000000000000011", -- jump 3
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
   