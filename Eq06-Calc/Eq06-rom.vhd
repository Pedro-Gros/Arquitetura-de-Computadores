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

entity rom is 
    port(   clk : in std_logic;
            endereco : in unsigned(17 downto 0);
            dado : out unsigned(31 downto 0)
        );
end entity;

architecture a_rom of rom is
    type mem is array (0 to 127) of unsigned(31 downto 0);
    constant conteudo_rom : mem := (
        -- caso endereco => conteudo (apenas exemplo. Altere para refletir o
        -- programa solicitado)
        0  => "00001001000000000000000000000100", -- addi R4, R0, #4 (0000100 100 000 000 0000000000000100)
        1  => "00001001010000000000000000000110", -- addi R5, R0, #6 (0000100 101 000 000 0000000000000110)
        2  => "00000001101001010000000000000000", -- add R6, R4, R5  (0000000 110 100 101 0000000000000000)
        3  => "00001111101100000000000000000010", -- subi R6, R6, #2 (0000111 110 110 000 0000000000000010)
        4  => "11111110000000000000000000001111", -- jump #15        (1111111 000 000 000 0000000000001111)
        5  => "10000000000000000000000000000000",
        6  => "10000000000000000000000000000000",
        7  => "10000000000000000000000000000000",
        8  => "10000000000000000000000000000000",
        9  => "10000000000000000000000000000000",
        10 => "10000000000000000000000000000000",
        11 => "10000000000000000000000000000000",
        12 => "10000000000000000000000000000000",
        13 => "10000000000000000000000000000000",
        14 => "10000000000000000000000000000000",
        15 => "00000001100001000000000000000000", -- add R6, R0, R4 (0000000 110 000 100 0000000000000000)
        16 => "00001101111100000000000000000011", -- divi R7, R6, #3 (0000110 111 110 000 0000000000000011)
        17 => "11111110000000000000000000000011", -- jump #3         (1111111 000 000 000 0000000000000011)
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
   