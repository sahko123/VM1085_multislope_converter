library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity converter is
port(
CLK:in std_logic;
data:out std_logic_vector(7 downto 0):=(others=>'Z');
address:in std_logic_vector(3 downto 0);
SW_sample,SW10K1,SW10k2,SW80k3,SW640K4,SW5120K5,SW_short,SW_input0:out std_logic:='0';
state_output_0:out std_logic:='0';
state_output_1:out std_logic:='0';
COMP,CONV:in std_logic;
CLK_pass:out std_logic;
data_ready:out std_logic:='0'
);
end entity;

architecture behavioral of converter is

signal conversion_timer:signed(31 downto 0);
signal sample_time:signed(31 downto 0):=to_signed(10000000,32);
signal RP_COUNT:signed(23 downto 0):=(others=>'0');--runup counter
signal count_stage12:unsigned(7 downto 0):=(others=>'0');--10k rundown
signal count_stage34:unsigned(7 downto 0):=(others=>'0');--80k pos(4MSB) 640k neg(4LSB)
signal count_stage5:unsigned(7 downto 0):=(others=>'0');--5.12M pos
signal state:std_logic_vector(3 downto 0):=(others=>'0');
signal timer:std_logic_vector(3 downto 0):=(others=>'0');
signal timer_reset:std_logic:='0';
signal comp_hold:std_logic:='0';--flag for comparator input
signal ready,conving:std_logic;--status flags
signal st_snapshot:std_logic_vector(3 downto 0);

component counter is
port(
count_out:out std_logic_vector(3 downto 0);
RST,CLK:in std_logic:='0'
);
end component;
begin

state_output_0<=not ready;
state_output_1<=not conving;
CLK_pass<=CLK;
time_counter:counter port map(count_out=>timer,CLK=>CLK,RST=>timer_reset);

--control registers
process(address,CLK) begin
	case address is
		when "0000" => data<=std_logic_vector(RP_COUNT(7 downto 0));
		when "0001" => data<=std_logic_vector(RP_COUNT(15 downto 8));
		when "0010" => data<=std_logic_vector(RP_COUNT(23 downto 16));
		when "0011" => data<=std_logic_vector(count_stage12);
		when "0100" => data<=std_logic_vector(count_stage34);
		when "0101" => data<=std_logic_vector(count_stage5);
		when "0110" => data<="01010101";
		when "0111" => data(3 downto 0)<=timer;data(7 downto 4)<=(others=>'0');
		when "1000" => data(3 downto 0)<=state;data(7 downto 4)<=(others=>'0');
		when "1001" => data<=std_logic_vector(conversion_timer(7 downto 0));
		when "1010" => data<=std_logic_vector(conversion_timer(15 downto 8));
		when "1011" => data<=std_logic_vector(conversion_timer(23 downto 16));
		when "1100" => data<=std_logic_vector(conversion_timer(31 downto 24));
		when others => data<="01010101";
	end case;
end process;



--conversion process
process(CLK) begin
if rising_edge(CLK) then

if data_ready='0' then --sample timer counter
conversion_timer<=conversion_timer-1;
end if;

case state is
-----------------------------------------------initial state
when "0000" =>

data_ready<='1';
timer_reset<='1';
conving<='0';
SW_input0<='1';
SW_short<='1';
SW_sample<='0';
SW10K1<='0';
SW10K2<='0';
SW80K3<='0';
SW640K4<='0';
SW5120K5<='0';
ready<='1';
if CONV='1' then --if conversion triggered
ready<='0';
state<="0001";
end if;
-----------------------------------------------pause before conversion
when "0001"=>
RP_COUNT<=(others=>'0');
count_stage12<=(others=>'0');
count_stage34<=(others=>'0');
count_stage5<=(others=>'0');
data_ready<='0';
conving<='1';
SW_short<='1';
timer_reset<='0';
conversion_timer<=sample_time;
if timer="0111" then
state<="0010";
timer_reset<='1';
end if;
-----------------------------------------------t1 sample
when "0010"=>
SW_input0<='0';
SW_short<='0';
timer_reset<='0';
SW_sample<='1';
if timer="0111" then
comp_hold<=comp;
timer_reset<='1';
state<="0011";
end if;
-----------------------------------------------runup
when "0011"=>
timer_reset<='0';

if comp_hold='1' then--switching with qin comp
SW10K1<='1';
if timer="0100" then
SW10K2<='1';
else
SW10K2<='0';
end if;
else
SW10K2<='1';
if timer="0100" then
SW10K1<='1';
else
SW10K1<='0';
end if;
end if;


if timer="1010" then
if conversion_timer=0 then

if comp_hold='1' then
state<="0101";
else
state<="0110";
end if;

end if;
if comp_hold='1' then
RP_COUNT<=RP_COUNT+1;
else
RP_COUNT<=RP_COUNT-1;
end if;
comp_hold<=comp;

timer_reset<='1';
state<="0100";
st_snapshot<=std_logic_vector(conversion_timer)(3 downto 0);
end if;
-----------------------------------------------pad
when "0100"=>
timer_reset<='0';
SW10K1<='0';
SW10K2<='0';
comp_hold<=comp;
if conversion_timer<=10 then

if timer=st_snapshot then
state<="0101";
timer_reset<='1';
end if;
else
if timer="0001" then
state<="0011";
timer_reset<='1';
end if;
end if;
-----------------------------------------------test case
when "1010"=>
SW_sample<='0';
if comp='1' then
state<="0101";
else
state<="0110";
end if;

-----------------------------------------------rundown 20k pos
when "0101"=>
SW_sample<='0';
SW10K2<='0';
comp_hold<=comp;
if comp_hold='1' then
SW10K1<='1';--positive ramp
count_stage12<=count_stage12+1;
else
state<="0110";
end if;

-----------------------------------------------rundown 20k neg
when "0110"=>--
SW10K1<='0';
comp_hold<=comp;

if comp_hold='0' then--negative ramp
SW10K2<='1';
count_stage12<=count_stage12-1;
else
state<="0111";
end if;
-----------------------------------------------rundown 80k pos
when "0111"=>--
SW10K1<='0';
SW10K2<='0';
comp_hold<=comp;

if comp_hold='1' then
SW80K3<='1';--positive ramp
count_stage34<=count_stage34+"00010000";
else
state<="1000";
end if;

-----------------------------------------------rundown 640k neg
when "1000"=>--
SW80K3<='0';
comp_hold<=comp;

if comp_hold='0' then
SW640K4<='1';--positive ramp
count_stage34<=count_stage34+"00000001";
else
state<="1001";
end if;
-----------------------------------------------rundown 5.12M pos
when "1001"=>--
SW640K4<='0';
comp_hold<=comp;
if comp_hold='1' then
SW5120K5<='1';--positive ramp
count_stage5<=count_stage5+1;
else
state<="0000";
end if;
-----------------------------------------------
when others =>state<="0000";
end case;
end if;
end process;




end behavioral;