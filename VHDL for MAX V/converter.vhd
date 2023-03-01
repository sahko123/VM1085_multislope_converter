library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
port(
CLK:in std_logic;
data:out std_logic_vector(7 downto 0):=(others=>'Z');
address:in std_logic_vector(3 downto 0);
SW_sample,SW10K1,SW10k2,SW80k3,SW640K4,SW5120K5:out std_logic:='0';
COMP,CONV:in std_logic

);
end entity;





architecture behavioral of converter is


signal RP_COUNT:signed(23 downto 0):=(others=>'0');--runup counter
signal count_stage12:unsigned(7 downto 0):=(others=>'0');--10k rundown
signal count_stage34:unsigned(7 downto 0):=(others=>'0');--80k pos(4MSB) 640k neg(4LSB)
signal count_stage5:unsigned(7 downto 0):=(others=>'0');--5.12M pos
signal state:unsigned(3 downto 0):=(others=>'0');
signal timer:std_logic_vector(3 downto 0);
signal timer_reset:std_logic:='0';
signal comp_hold:std_logic:='0';--flag for comparator input

component counter is
port(
count_out:out std_logic_vector(3 downto 0);
RST,CLK:in std_logic:='0'
);
end component;
begin

time_counter:counter port map(count_out=>timer,CLK=>CLK,RST=>timer_reset);

--control registers
process(address,CLK) begin
	if rising_edge(clk) then
	case address is
		when "0000" => data<=std_logic_vector(count_stage12);
		when "0001" => data<=std_logic_vector(count_stage34);
		when "0010" => data<=std_logic_vector(count_stage5);
		when "0011" => data<=std_logic_vector(RP_COUNT(7 downto 0));
		when "0100" => data<=std_logic_vector(RP_COUNT(15 downto 8));
		when "0101" => data<=std_logic_vector(RP_COUNT(23 downto 16));
		when "0110" => data<="01010101";
		when others => data<=(others=>'Z');
	end case;
	end if;
end process;

--conversion process



process(CLK) begin


case state is


when "0000" =>					--initial state;
SW_sample<='0';
SW10K1<='0';
SW10K2<='0';
SW80K3<='0';
SW640K4<='0';
SW5120K5<='0';
timer_reset<='1';
if CONV='1' then --if conversion triggered
state<="0001";
timer_reset<='0';
end if;



when "0001"=>					--t1 sample
SW_sample<='1'; --enable sample switch
if timer>="0111" then
timer_reset<='1';
state<="0010";

comp_hold<=comp;

end if;


when "0010"=>					--runup
timer_reset<='0';
if comp_hold='1' then
SW10K1<='1';--positive ramp
SW10K2<='0';

else
SW10K1<='0';--negative ramp
SW10K2<='1';

end if;


if timer>="1010" then --if timer=10
if comp_hold='1' then
RP_COUNT<=RP_COUNT+1;
else
RP_COUNT<=RP_COUNT-1;
end if;
timer_reset<='1';
comp_hold<=comp;
state<="0011";
end if;




when "0011"=> --recharge
timer_reset<='0';
SW10K1<='0';
SW10K2<='0';
if timer="0011" then
if CONV='1' then
state<="0010";
timer_reset<='1';
else
state<="0100";
end if;
end if;


when "0100"=>--rundown start



when others =>state<="0000";
end case;
end process;




end behavioral;