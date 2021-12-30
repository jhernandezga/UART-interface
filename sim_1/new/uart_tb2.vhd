----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2021 11:47:49 PM
-- Design Name: 
-- Module Name: uart_tb2 - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tb2 is
--  Port ( );
end uart_tb2;

architecture Behavioral of uart_tb2 is

constant T: time :=  8 ns;
constant T2: time := 104.2 us;
signal clk, reset: std_logic;
	signal rd_uart, wr_uart: std_logic:='0'; -- Para el FIFO
		signal rx: std_logic:='0';
		signal w_data: std_logic_vector(7 downto 0):=(others=>'0');
		signal tx_full, rx_empty: std_logic;
		signal r_data: std_logic_vector(7 downto 0);
		signal tx: std_logic;

begin
FBA: entity work.uart port map(clk => clk, reset => reset, rd_uart => rd_uart,  wr_uart => wr_uart, rx=>rx, w_data=>w_data, tx_full=>tx_full, rx_empty=>rx_empty, r_data=>r_data, tx=>tx);

CLK1:process
begin
clk <= '1'; 
wait for T/2;
clk <= '0';
wait for T/2;
end process;


RX1:process
begin
rx<='0';
wait for T2/2;
rx <= '1'; 
wait for T2;
rx <= '0';
wait for T2;
rx <= '1'; 
wait for T2;
rx <= '0';
wait for T2;
rx <= '0'; 
wait for T2;
rx <= '0';
wait for T2;
rx <= '1'; 
wait for T2;
rx <= '1';
wait for T2; --hasta acá transmitimos 11000101
rx <= '0';
wait for T2/2+T2; 

rx <= '1'; 
wait for T2;
rx <= '0';
wait for T2;
rx <= '0'; 
wait for T2;
rx <= '0';
wait for T2;
rx <= '0'; 
wait for T2;
rx <= '0'; 
wait for T2;
rx <= '0';
wait for T2; 
rx <= '1';
wait for T2; --hasta acá transmitimos 10000001

rx <='0';
wait for T2; 



end process;

stm:process

begin

reset <= '1', '0' after T;

-- para probar el envio de datos desde la FPGA a el bluetooth y ver el tx (que es un escalon raro) que arroja a partir de un binario de 8 bits


rd_uart <='0';
wr_uart <='1';
w_data<="10010101";
        
wait for 83 us;


rd_uart <='0';
wr_uart <='1';
w_data<="10010101";
        
wait for 83 us;


rd_uart <='0';
wr_uart <='1';
w_data<="10010101";
        
wait for 83 us;


-- para probar el envio de datos desde bluetooth a la FPGA y ver el binario que arroja a partir de rx que es como un escalon todo raro
rd_uart <='1';
wr_uart <='1';
        
wait for 83 us;


wait;
end process stm;



end Behavioral;

