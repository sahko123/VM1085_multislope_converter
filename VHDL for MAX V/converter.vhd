library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
port(
CLK:in std_logic;
data:out std_logic_vector(7 downto 0);
address:in std_logic_vector(3 downto 0);
SW10K1,SW10k2,SW80k2,SW640K3,SW5120K4:out std_logic;
COMP,RUNUP:in std_logic

);
end entity;

architecture behavioral of converter is


signal RP_COUNT:signed(23 downto 0):=(others=>'0');--runup counter
signal count_stage1:unsigned(7 downto 0):=(others=>'0');--10k rundown
signal count_stage23:unsigned(7 downto 0):=(others=>'0');--80k pos(4MSB) 640k neg(4LSB)
signal count_stage4:unsigned(7 downto 0):=(others=>'0');--5.12M pos

begin



--control registers
process(address) begin
	case address is
		when "0000" => data<=std_logic_vector(count_stage1);
		when "0001" => data<=std_logic_vector(count_stage23);
		when "0010" => data<=std_logic_vector(count_stage4);
		when "0011" => data<=std_logic_vector(RP_COUNT)(7 downto 0);
		when "0100" => data<=std_logic_vector(RP_COUNT)(15 downto 8);
		when "0101" => data<=std_logic_vector(RP_COUNT)(23 downto 16);
		when "1001" => data<="01010101";
		when others => data<=(others=>'Z');
	end case;
end process;

--conversion process
process(CLK) begin

if rising_edge(CLK) then
RP_COUNT<=RP_COUNT+1;
count_stage1<=count_stage1+1;
count_stage23<=count_stage23+1;
count_stage4<=count_stage4+1;

end if;

end process;



end behavioral;