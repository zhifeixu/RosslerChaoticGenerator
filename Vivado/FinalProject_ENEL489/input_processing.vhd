
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.nn_package.all;

entity input_processing is
    Port ( 
        clk : in std_logic;
        x : in x_array;
        p1, p2, p3 : in p1_array;
        x_norm : out x_array);
end input_processing;

architecture Behavioral of input_processing is
    
    component mult
        port( 
            a : in signed(N-1 downto 0);
            b : in signed(N-1 downto 0);
            c : out signed(N-1 downto 0));
    end component;
    
    signal temp1, temp2 : x_array;

begin

    sub1gen : for i in 0 to NUM_X-1 generate
    begin
        temp1(i) <= x(i) - p1(i);
    end generate;
    
    multgen : for i in 0 to NUM_X-1 generate
    begin
        mult_unit: mult
        port map (a=>temp1(i), b=>p2(i), c=>temp2(i));
    end generate;
    
    sub2gen : for i in 0 to NUM_X-1 generate
    begin
        x_norm(i) <= temp2(i) - p3(i);
    end generate;
        
end Behavioral;
