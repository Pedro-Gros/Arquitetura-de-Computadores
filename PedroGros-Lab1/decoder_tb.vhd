library ieee;
use ieee.std_logic_1164.all;

entity decoder_tb is
end;

architecture a_decoder_tb of decoder_tb is
	component decoder
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
	end component;
	signal s_in_a, s_in_b, s_in_c, s_out_0, s_out_1, s_out_2, s_out_3, s_out_4, s_out_5, s_out_6,s_out_7: std_logic;
	
	begin
	
	 uut: decoder port map( in_a => s_in_a,
						  in_b => s_in_b,
						  in_c => s_in_c,
						  out_0 => s_out_0,
						  out_1 => s_out_1,
						  out_2 => s_out_2,
						  out_3 => s_out_3,
						  out_4 => s_out_4,
						  out_5 => s_out_5,
						  out_6 => s_out_6,
						  out_7 => s_out_7);
					  
					  
	process
		begin
		 s_in_a <= '0';
		 s_in_b <= '0';
		 s_in_c <= '0';
		 wait for 50 ns;
		 s_in_a <= '0';
		 s_in_b <= '0';
		 s_in_c <= '1';
		 wait for 50 ns;
		 s_in_a <= '0';
		 s_in_b <= '1';
		 s_in_c <= '0';
		 wait for 50 ns;
		 s_in_a <= '0';
		 s_in_b <= '1';
		 s_in_c <= '1';
		 wait for 50 ns;
		 s_in_a <= '1';
		 s_in_b <= '0';
		 s_in_c <= '0';
		 wait for 50 ns;
		 s_in_a <= '1';
		 s_in_b <= '0';
		 s_in_c <= '1';
		 wait for 50 ns;
		 s_in_a <= '1';
		 s_in_b <= '1';
		 s_in_c <= '0';
		 wait for 50 ns;
		 s_in_a <= '1';
		 s_in_b <= '1';
		 s_in_c <= '1';
		 wait for 50 ns;
		 wait;
	end process;
end architecture;