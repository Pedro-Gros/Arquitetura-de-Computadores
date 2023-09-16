-------------------------------------------------------------
-- Equipe n° 06
-- Data: 27/08/2023
-- Disciplina: Arquitetura e Organização de Computadores

-- Laboratório 2 - ULA
-- Membros:
--         * Mateus Stupp
--         * Pedro Henrique Gros
--         * Pedro Henrique Grossi da Silva
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA_tb is
end;

architecture a_ULA_tb of ULA_tb is
	component ULA
	port( 	in_A 	: in  unsigned(15 downto 0);
	   		in_B 	: in  unsigned(15 downto 0);
	   		op   	: in  unsigned(2  downto 0); 
	   		out_ULA : out unsigned(15 downto 0);
	   		flags 	: out unsigned(1 downto 0));

	end component;

	signal s_in_A, s_in_B, s_out_ULA	: unsigned(15 downto 0) := "0000000000000000";
	signal s_op							: unsigned(2 downto 0) 	:= "000";
	signal s_flags						: unsigned(1 downto 0) 	:= "00";
	
	begin
	 uut: ULA port map(
						in_A => s_in_A,
					   	in_B => s_in_B,
					   	op => s_op,
					   	out_ULA => s_out_ULA,
					   	flags => s_flags);  
					  
	process
		begin
			for i in 0 to 7 loop
				-- Case A = B
				s_in_A 	<= "0000000000000001"; -- 1
				s_in_B 	<= "0000000000000001"; -- 1
				s_op 	<= "000" + i;
				wait for 50 ns;
				-- Case A > B -> result integer
				s_in_A 	<= "0000000000001010"; -- 10
				s_in_B 	<= "0000000000000010"; -- 2
				s_op 	<= "000" + i;
				wait for 50 ns;
				-- Case A > B -> result float
				s_in_A 	<= "0000000000001011"; -- 11
				s_in_B 	<= "0000000000000010"; -- 2
				s_op 	<= "000" + i;
				wait for 50 ns;
				-- Case A < B  -> result integer
				s_in_A 	<= "0000000000000010"; -- 2
				s_in_B 	<= "0000000000001010"; -- 10
				s_op 	<= "000" + i;
				wait for 50 ns;
				-- Case A < B -> result float
				s_in_A 	<= "0000000000000010"; -- 2
				s_in_B 	<= "0000000000001011"; -- 11
				s_op 	<= "000" + i;
				wait for 50 ns;
			end loop;
			-- Case RA_1 / RA_2
			s_in_A 	<= x"1FEA";	-- 8170 end of RA = 1798170
			s_in_B 	<= x"0E67";	-- 3687 end of RA = 1873687
			s_op 	<= "001";	-- division
			wait for 50 ns;
			wait;
	end process;
end architecture;