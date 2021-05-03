----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2021 11:36:19 PM
-- Design Name: 
-- Module Name: tb_NN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.nn_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_NN is
--  Port ( );
end tb_NN;

architecture Behavioral of tb_NN is

component nn is 
    Port ( 
        clk : in std_logic;
        x_in : in x_array;
        y_out : out y_array);
 end component;
--Inputs
constant Time_delta: time := 5 ns;
constant Time_delta1: time := 15 ns;
signal clk : STD_LOGIC  ;
signal x_in : x_array;
signal y_out : y_array;



--Clock period definitions


begin

    ct: nn port map (x_in => x_in, y_out => y_out, clk => clk);
    process
    begin
        clk <= '0';
        wait for time_delta;
        clk <= '1';
        wait for time_delta;
    end process;

    process
    begin
       
        x_in <= ("00000000000000000011001000010011", "00000000000000000001000010011011", "00000000000000000000000001110110");
        wait for 10ns;
        x_in <= ("00000000000000000001100101111001", "00000000000000000011101111111100", "00000000000000000000000000011101");
        wait for 10ns;
      
        
        
        
        
    end process;

end Behavioral;
