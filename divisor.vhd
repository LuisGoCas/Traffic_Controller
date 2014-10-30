library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity divisor is
	port(
		reset 	: in std_logic;
		CLKin 	: in std_logic;
		CLKOut	: out std_logic
	);
end divisor;

architecture arch of divisor is
signal counter : integer;
signal temp 	: std_logic;
begin
process(CLKin, reset,temp)
begin
	if(reset = '0') then
		counter <= 0;
		temp <= '1';
	elsif(rising_edge(CLKin)) then
		counter <= counter + 1;
		if(counter = 24999999) then
			temp <= NOT temp;
			counter <= 0;
		end if;
	end if;
	CLKOut <= temp;
end process;
end arch;