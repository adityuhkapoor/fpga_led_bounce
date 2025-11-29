library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_bounce is
port (
clk: in std_logic;
reset: in std_logic;
led: out std_logic_vector(15 downto 0) );

end led_bounce;

architecture Behavioral of led_bounce is
signal count: unsigned(26 downto 0) := (others => '0');
signal led_reg: std_logic_vector(15 downto 0) := (others => '0');

type nested_unsigned_array is array(0 to 15) of unsigned(26 downto 0);

CONSTANT segment: unsigned(26 downto 0) := to_unsigned(3333333, 27);

begin
led <= led_reg;

process(clk, reset)
begin
if reset = '1' then
    count <= (others => '0');
    led_reg <= (others => '0');
elsif rising_edge(clk) then
    if count = to_unsigned(100_000_000, 27) then
        count <= to_unsigned(0, 27);
    else
        count <= count + 1;
    end if;
    
    if count = to_unsigned(0, 27) then
        led_reg(0) <= not led_reg(0);
        if led_reg(1) = '1' then
            led_reg(1) <= '0';
        end if;
    elsif count = segment * 1 then
        led_reg(0) <= not led_reg(0);
        led_reg(1) <= not led_reg(1);
    elsif count = segment * 2 then
        led_reg(1) <= not led_reg(1);
        led_reg(2) <= not led_reg(2);
    elsif count = segment * 3 then
        led_reg(2) <= not led_reg(2);
        led_reg(3) <= not led_reg(3);
    elsif count = segment * 4 then
        led_reg(3) <= not led_reg(3);
        led_reg(4) <= not led_reg(4);
    elsif count = segment * 5 then
        led_reg(4) <= not led_reg(4);
        led_reg(5) <= not led_reg(5);
    elsif count = segment * 6 then
        led_reg(5) <= not led_reg(5);
        led_reg(6) <= not led_reg(6);
    elsif count = segment * 7 then
        led_reg(6) <= not led_reg(6);
        led_reg(7) <= not led_reg(7);
    elsif count = segment * 8 then
        led_reg(7) <= not led_reg(7);
        led_reg(8) <= not led_reg(8);
    elsif count = segment * 9 then
        led_reg(8) <= not led_reg(8);
        led_reg(9) <= not led_reg(9);
    elsif count = segment * 10 then
        led_reg(9) <= not led_reg(9);
        led_reg(10) <= not led_reg(10);
    elsif count = segment * 11 then
        led_reg(10) <= not led_reg(10);
        led_reg(11) <= not led_reg(11);
    elsif count = segment * 12 then
        led_reg(11) <= not led_reg(11);
        led_reg(12) <= not led_reg(12);
    elsif count = segment * 13 then
        led_reg(12) <= not led_reg(12);
        led_reg(13) <= not led_reg(13);
    elsif count = segment * 14 then
        led_reg(13) <= not led_reg(13);
        led_reg(14) <= not led_reg(14);
    elsif count = segment * 15 then
        led_reg(14) <= not led_reg(14);
        led_reg(15) <= not led_reg(15);
    elsif count = segment * 16 then
        led_reg(15) <= not led_reg(15);
        led_reg(14) <= not led_reg(14);
    elsif count = segment * 17 then
        led_reg(14) <= not led_reg(14);
        led_reg(13) <= not led_reg(13);
    elsif count = segment * 18 then
        led_reg(13) <= not led_reg(13);
        led_reg(12) <= not led_reg(12);
    elsif count = segment * 19 then
        led_reg(12) <= not led_reg(12);
        led_reg(11) <= not led_reg(11);
    elsif count = segment * 20 then
        led_reg(11) <= not led_reg(11);
        led_reg(10) <= not led_reg(10);
    elsif count = segment * 21 then
        led_reg(10) <= not led_reg(10);
        led_reg(9) <= not led_reg(9);
    elsif count = segment * 22 then
        led_reg(9) <= not led_reg(9);
        led_reg(8) <= not led_reg(8);
    elsif count = segment * 23 then
        led_reg(8) <= not led_reg(8);
        led_reg(7) <= not led_reg(7);        
    elsif count = segment * 24 then
        led_reg(7) <= not led_reg(7);
        led_reg(6) <= not led_reg(6);
     elsif count = segment * 25 then
        led_reg(6) <= not led_reg(6);
        led_reg(5) <= not led_reg(5);
     elsif count = segment * 26 then
        led_reg(5) <= not led_reg(5);
        led_reg(4) <= not led_reg(4);
     elsif count = segment * 27 then
        led_reg(4) <= not led_reg(4);
        led_reg(3) <= not led_reg(3);
    elsif count = segment * 28 then
        led_reg(3) <= not led_reg(3);
        led_reg(2) <= not led_reg(2);
    elsif count = segment * 29 then
        led_reg(2) <= not led_reg(2);
        led_reg(1) <= not led_reg(1);
    end if;
end if;
end process;
        

end Behavioral;
