------------------------------------------------------------
--                      EQUIPE 5
--              Daiara Dyba, Leonardo Moura e Fernanda Pimpão
------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY tb_ULA IS
END tb_ULA;

ARCHITECTURE a_tb_ULA OF tb_ULA IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ULA
    PORT(
         in_A : IN  unsigned(15 downto 0);
         in_B : IN  unsigned(15 downto 0);
         Opcode : IN  unsigned(2 downto 0);
         Result : OUT  unsigned(15 downto 0);
         ZeroFlag : OUT  std_logic;
         MaiorFlag : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal in_A : unsigned(15 downto 0) := (others => '0');
   signal in_B : unsigned(15 downto 0) := (others => '0');
   signal Opcode : unsigned(2 downto 0) := (others => '0');

    --Outputs
   signal Result : unsigned(15 downto 0);
   signal ZeroFlag : std_logic;
   signal MaiorFlag : std_logic;

       --Opcode 000 = Soma
    --Opcode 001 = Divisão
    --Opcode 010 = Resto da Divisão
    --Opcode 011 = Multiplicação
    --Opcode 100 = Operação Lógica OU Exclusivo
    --Opcode 101 = Lógica Negação

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: ULA PORT MAP (
          in_A => in_A,
          in_B => in_B,
          Opcode => Opcode,
          Result => Result,
          ZeroFlag => ZeroFlag,
          MaiorFlag => MaiorFlag
        );

   -- Stimulus process
   process
   begin
    ----Teste de soma sem zero
      wait for 10 ns;
      in_A <= "0000000000001011";
      in_B <= "0000000000000101";
      Opcode <= "000";
      wait for 10 ns;

    ----Teste de soma com zero

    in_A <= "0000000000000000";
    in_B <= "0000000000000000";
    Opcode <= "000";
    wait for 10 ns;



    in_A <= "0000000000000101";
    in_B <= "0000000000001011";
    Opcode <= "000";
    wait for 10 ns;

      in_A <= "0000000000001011";
      in_B <= "0000000000001010";
      Opcode <= "001";
      wait for 10 ns;

    in_A <= "0000000000001010";
    in_B <= "0000000000001010";
    Opcode <= "001";
    wait for 10 ns;


    in_A <= "0000000000000010";
    in_B <= "0000000000001010";
    Opcode <= "010";
    wait for 10 ns;



      in_A <= "0000000000001000";
      in_B <= "0000000000000000";
      Opcode <= "011"; -- Divisão
      wait for 10 ns;

      

     in_A <= "0000000000001001";
     in_B <= "0000000000000010";
     Opcode <= "011"; -- Divisão
     wait for 10 ns;

     
     in_B <= "0000000001011111";
     in_A <= "0010001110001100";
     Opcode <= "011"; 
     wait for 10 ns;



      in_A <= "0000000000001010";
      in_B <= "0000000000001010";
      Opcode <= "100"; --Resto
      wait for 10 ns;

      

      in_A <= "0000000000001011";
      in_B <= "0000000000001010";
      Opcode <= "100"; --Resto
      wait for 10 ns;

    

     in_A <= "0000000000001010";
     in_B <= "0000000000000010";
     Opcode <= "101"; -- Operação Multiplicação
     wait for 10 ns;


     in_A <= "1111111100001111";
     in_B <= "0000000011000011";
     Opcode <= "110"; -- Operação XOR
     wait for 10 ns;


     in_A <= "0000000000001010";
     in_B <= "0000000000000000";
     Opcode <= "111"; -- Operação NOT
     wait for 10 ns;

      wait;
   end process;

END;
