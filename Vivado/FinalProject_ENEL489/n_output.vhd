
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.nn_package.all;

entity n_output is
    Port ( 
        clk : in std_logic;
        x, w : in a_array;
        bi : in signed(N-1 downto 0);
        sum_out : out signed(N-1 downto 0));
end n_output;

architecture Behavioral of n_output is
    component mult is
        Port(
            a : in SIGNED(N-1 downto 0);
            b : in SIGNED(N-1 downto 0);
            c : out SIGNED(N-1 downto 0)
         );
    end component;
    signal mult_array : a_array;
    signal sum : signed(N+NUM_L1-1 downto 0);

begin

    -- Multiply each input with its corresponding weight
    -- YOUR CODE HERE
	Mult_GEN: 
	for i in 0 to NUM_L1-1 generate
	begin
	   mult_uni: mult port map(
	   a => x(i),
	   b => w(i),
	   c => mult_array(i)   
	   );
	end generate;
	
	
    -- Sum the products and bias
    -- YOUR CODE HERE
	process (clk)
	variable temp: SIGNED(N+NUM_L1-1 downto 0);
	variable b_41: SIGNED(N+NUM_L1-1 downto 0);
	begin
	   temp:= (others => '0');
	   b_41 := resize(bi, N+NUM_L1);
	   for i in 0 to NUM_L1-1 loop
	       temp := temp + mult_array(i);
	   
	   end loop;
	   temp := temp + b_41;
	   sum <= temp;
	end process;
	
    sum_out <= resize(sum, N);

end Behavioral;
