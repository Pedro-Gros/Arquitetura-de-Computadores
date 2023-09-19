------------------------------------------------------------
--                      EQUIPE 5
--              Daiara Dyba, Leonardo Moura e Fernanda Pimpão
------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
    port(
        in_A, in_B : in unsigned(15 downto 0);
        Opcode : in unsigned(2 downto 0);
        Result : out unsigned(15 downto 0);
        ZeroFlag : out std_logic;
        MaiorFlag : out std_logic
    );
end entity ULA;

architecture a_ULA of ULA is
    signal Temp : unsigned(15 downto 0);
    signal Temp_Mult : unsigned(31 downto 0); -- Sinal intermediário para multiplicação
   
begin
     MaiorFlag <= '1' when in_A > in_B else 
                  '0';

    ZeroFlag <= '1' when Temp = "0000000000000000" else
                '0';
    Result <= Temp;
    Temp_Mult <= in_A * in_B;
    --Opcode 000 = Soma
    --Opcode 001 = Divisão
    --Opcode 010 = Resto da Divisão
    --Opcode 011 = Multiplicação
    --Opcode 100 = Operação Lógica OU Exclusivo
    --Opcode 101 = Lógica Negação

    Temp <= in_A + in_B                          when Opcode = "000" else
              in_A/in_B                          when Opcode = "001" else
              in_A rem in_B                      when Opcode = "010" else
              Temp_Mult(15 downto 0)             when Opcode = "011" else
              in_A xor in_B                      when Opcode = "100" else
              not in_A                           when Opcode = "101" else
              "0000000000000000";
                

end architecture a_ULA;
