library ieee;
use ieee.std_logic_1164.all;

entity decoder is
		 port( in_a : in std_logic;
			   in_b : in std_logic;
			   in_c : in std_logic;
			   
			   out_0: out std_logic;
			   out_1: out std_logic;
			   out_2: out std_logic;
			   out_3: out std_logic;
			   out_4: out std_logic;
			   out_5: out std_logic;
			   out_6: out std_logic;
			   out_7: out std_logic
			 );
end entity;

architecture a_decoder_tb of decoder is
begin
	out_0 <= not in_a and not in_b and not in_c;
	out_1 <= not in_a and not in_b and 	   in_c;
	out_2 <= not in_a and 	  in_b and not in_c;
	out_3 <= not in_a and     in_b and 	   in_c;
	out_4 <= 	 in_a and not in_b and not in_c;
	out_5 <= 	 in_a and not in_b and 	   in_c;
	out_6 <= 	 in_a and 	  in_b and not in_c;
	out_7 <= 	 in_a and 	  in_b and 	   in_c;
end architecture;