----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2021 07:02:04 PM
-- Design Name: 
-- Module Name: UART_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_tb is
--  Port ( );
end UART_tb;

architecture Behavioral of UART_tb is

signal clk,reset,rd_uart,wr_uart,rx,tx_full,rx_empty,tx: std_logic := '0';
signal w_data,r_data: std_logic_vector(7 downto 0) := (others => '0');
constant T: time := 8 ns;


begin

uart_mod : entity work.uart
port map ( clk =>clk,reset =>reset,rd_uart => rd_uart,wr_uart => wr_uart, rx => rx,tx => tx,
tx_full=>tx_full,rx_empty=>rx_empty, w_data=>w_data, r_data => r_data
);

clkk: process
begin
clk <= '0';
wait for T/2;
clk <= '1';
wait for T/2;
end process; 


reset <= '1','0' after 5*T;

wr_uart <= '0','1' after 100*T;

w_data <= "10101100","11001100" after 1000 us;


end Behavioral;
