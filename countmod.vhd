library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count is
	port
	(
		clk		: in std_logic;
		reset	: in std_logic;
		enable 	: in std_logic;
		q		: out integer range 0 to 255
	);
end entity;

architecture rtl of count is
begin
	process (clk,reset)
		variable   cnt	: integer range 0 to 255;
	begin
		if reset = '1' then
		-- Reset the counter to 0
		cnt := 0;
		elsif (rising_edge(clk)) then

			if enable = '1' then
				-- Increment the counter if counting is enabled
				cnt := cnt + 1;
			end if;
		end if;
		
		-- Output the current count
		q <= cnt;
	end process;

end rtl;