
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.nn_package.all;

entity n_hidden is
    Port ( 
        clk : in std_logic; 
        x, w : in x_array;
        bi : in signed(N-1 downto 0);
        sum_out : out signed(N-1 downto 0));
end n_hidden;

architecture Behavioral of n_hidden is

    component mult is
        Port(
            a : in SIGNED(N-1 downto 0);
            b : in SIGNED(N-1 downto 0);
            c : out SIGNED(N-1 downto 0)
         );
    end component;
    
    signal mult_array : x_array;
    signal sum : signed(N+NUM_X-1 downto 0);

begin

    -- Multiply each input with its corresponding weight
    -- YOUR CODE HERE
	
	
	Mult_GEN: 
	for i in 0 to NUM_X-1 generate
	begin  
	   mult_unit: mult port map(
	       a => x(i),
	       b => w(i),
	       c => mult_array(i)
	   );
	end generate;
	
	-- Sum the products and bias
    -- YOUR CODE HERE
	
	
	
	process(clk)
	variable temp: SIGNED(N+NUM_X-1 downto 0);
	variable b35: SIGNED(N+NUM_X-1 downto 0);
	begin
	   temp := (others => '0');
	   b35 := resize(bi, N+NUM_X); 
	   for i in 0 to NUM_X-1 loop
	       temp := temp+mult_array(i);
	       
	   end loop;
	   
	   temp:= temp + b35;
	   
	   sum <= temp;
	end process;
	
	  
    sum_out <= resize(sum, N);

end Behavioral;
