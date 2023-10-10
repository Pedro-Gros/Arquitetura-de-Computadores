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

entity program_counter is
    port( 	data_out	: out unsigned(15 downto 0);    -- Valor do program counter
            clk  		: in std_logic;                 -- Clock
            rst			: in std_logic;		    	    -- Flag
            wr_en   	: in std_logic                  -- Write enable (habilita a escrita)
        );
end entity;

architecture a_program_counter of program_counter is

    -- Declaração do componente registrador
    component register_comp is
        port(	reg_in			: in  unsigned(15 downto 0); -- Entrada de Dados
                reg_out    	    : out unsigned(15 downto 0); -- Saída de Dados
                clk   	    	: in  std_logic;   			 -- Condicao
                rst_reg			: in  std_logic;			 -- Flag
                wr_en	    	: in  std_logic				 -- Write enable
            );
    end component register_comp;

    -- Sinais de saida do program counter
    signal pc_out       : unsigned(15 downto 0) := "0000000000000000";
    -- Sinal de incremento do program counter
    signal data_in      : unsigned(15 downto 0) := "0000000000000000";
    -- Sinais de enable para o program counter
	signal s_wr_en_pc   : std_logic := '0';

    begin
        -- Instanciando program counter
		pc: register_comp port map(data_in, data_out, clk, rst, s_wr_en_pc);

        -- Saida do PC e incrementada e ligada na entrada
        data_in <= pc_out + 1;

end architecture;