library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity converter is
port(
CLK:in std_logic;
data:out std_logic_vector(7 downto 0):=(others=>'Z');
address:in std_logic_vector(3 downto 0);
SW_sample,SW10K1,SW10k2,SW80k3,SW640K4,SW5120K5,SW_short:out std_logic:='0';
SW_input0:out std_logic:='1';
state_output_0:out std_logic:='0';
state_output_1:out std_logic:='0';
COMP,CONV:in std_logic;
CLK_pass:out std_logic;
data_ready:out std_logic:='0'
);
end entity;

architecture behavioral of converter is

signal conversion_timer:signed(31 downto 0);
signal sample_time:signed(31 downto 0):=to_signed(2000000,32);
signal RP_COUNT:signed(31 downto 0);--runup counter
signal count_stage1:unsigned(7 downto 0):=(others=>'0');--10k rundown
signal count_stage2:unsigned(7 downto 0):=(others=>'0');--10k rundown
signal count_stage3:unsigned(7 downto 0):=(others=>'0');--80k pos
signal count_stage4:unsigned(7 downto 0):=(others=>'0');--640k neg
signal count_stage5:unsigned(7 downto 0):=(others=>'0');--5.12M pos
signal state:std_logic_vector(3 downto 0);
signal timer:unsigned(3 downto 0);
signal compMeta,compStab:std_logic:='0';
signal comp_hold:std_logic;--flag for comparator input
signal conving:std_logic;--status flags
signal conv_sync:std_logic:='0';
signal OVFerror:std_logic_vector(7 downto 0):=(others=>'0');

begin

state_output_0<=not data_ready;
state_output_1<=not conving;
CLK_pass<=CLK;

--control registers
process(address,CLK,RP_COUNT,count_stage1,count_stage2,count_stage3,count_stage4,count_stage5,timer,state,sample_time,OVFerror) begin
	case address is
		when "0000" => data<=std_logic_vector(RP_COUNT(7 downto 0));
		when "0001" => data<=std_logic_vector(RP_COUNT(15 downto 8));
		when "0010" => data<=std_logic_vector(RP_COUNT(23 downto 16));
		when "0011" => data<=std_logic_vector(RP_COUNT(31 downto 24));
		when "0100" => data<=std_logic_vector(count_stage1);
		when "0101" => data<=std_logic_vector(count_stage2);
		when "0110" => data<=std_logic_vector(count_stage3);
		when "0111" => data<=std_logic_vector(count_stage4);
		when "1000" => data<=std_logic_vector(count_stage5);
		when "1001" => data<="01010101";
		when "1010" => data(3 downto 0)<=std_logic_vector(timer);data(7 downto 4)<=(others=>'0');
		when "1011" => data(3 downto 0)<=state;data(7 downto 4)<=(others=>'0');
		when "1100" => data<=OVFerror;
		when "1101" => data<="01010101";
		when "1110" => data<="01010101";
		when "1111" => data<="01010101";
		when others => data<="01010101";
	end case;
end process;

--syncro
process(CLK,COMP) begin
if rising_edge(CLK) then
	compStab<=comp;
	conv_sync<=conv;
end if;
end process;


--conversion process
process(CLK,conv_sync) begin
if rising_edge(CLK) then
conversion_timer<=conversion_timer+1;
timer<=timer+1;

case state is
-----------------------------------------------initial state
when "0000" =>
data_ready<='1';
conving<='0';
SW_input0<='1';
SW_short<='1';
SW_sample<='0';
SW10K1<='0';
SW10K2<='0';
SW80K3<='0';
SW640K4<='0';
SW5120K5<='0';
if CONV_sync='1' then --if conversion triggered
data_ready<='0';
conving<='1';
RP_COUNT<=(others=>'0');
count_stage1<=(others=>'0');
count_stage2<=(others=>'0');
count_stage3<=(others=>'0');
count_stage4<=(others=>'0');
count_stage5<=(others=>'0');
timer<=(others=>'0');
state<="0010";
conversion_timer<=(others=>'0');
end if;
-----------------------------------------------pause before conversion
when "0001"=>
if timer=10 then
state<="0010";
timer<=(others=>'0');
else
end if;
-----------------------------------------------t1 sample
when "0010"=>
SW_input0<='0';
SW_short<='0';
SW_sample<='1';
if timer=10 then
comp_hold<=comp;
timer<=(others=>'0');
state<="0011";
end if;
-----------------------------------------------runup
when "0011"=>
if comp_hold='1' then
SW10K1<='1';
if timer=4 then
SW10K2<='1';
else
SW10K2<='0';
end if;

else
SW10K2<='1';
if timer=4 then
SW10K1<='1';
else
SW10K1<='0';
end if;

end if;


if timer=9 then
if comp_hold='1' then
RP_count<=RP_count+1;
else
RP_count<=RP_count-1;
end if;
end if;

if timer=10 then
timer<=(others=>'0');
state<="0100";
end if;
-----------------------------------------------pad
when "0100"=> 
SW10K2<='0';
SW10K1<='0';
SW_sample<='1';

if timer=1 then
comp_hold<=comp;
timer<=(others=>'0');
state<="0011";

if conversion_timer>=sample_time then
state<="0101";
end if;
end if;
-----------------------------------------------rundown 20k pos
when "0101"=>
SW_sample<='0';
if count_stage1>250 then
OVFerror(0)<='1';
end if;
if compstab='1' then
SW10K1<='1';--positive ramp
SW10K2<='0';
count_stage1<=count_stage1+1;
else
SW10K1<='0';
SW10K2<='0';
state<="0110";
end if;
-----------------------------------------------rundown 20k neg
when "0110"=>
if count_stage2>250 then
OVFerror(1)<='1';
end if;
if compstab='0' then--negative ramp
SW10K1<='0';
SW10K2<='1';
count_stage2<=count_stage2+1;
else
SW10K1<='0';
SW10K2<='0';
state<="0111";
end if;
-----------------------------------------------rundown 80k pos
when "0111"=>
if count_stage3>250 then
OVFerror(2)<='1';
end if;
SW80K3<='1';--positive ramp
if compstab='1' then
count_stage3<=count_stage3+1;
else
state<="1000";
SW80K3<='0';
end if;

-----------------------------------------------rundown 640k neg
when "1000"=>
if count_stage4>250 then
OVFerror(3)<='1';
end if;
SW640K4<='1';--positive ramp
if compstab='0' then
count_stage4<=count_stage4+1;
else
SW640K4<='0';
state<="1001";
end if;
-----------------------------------------------rundown 5.12M pos
when "1001"=>
if count_stage5>250 then
OVFerror(4)<='1';
end if;
SW5120K5<='1';--positive ramp
if compstab='1' then
count_stage5<=count_stage5+1;
else
state<="0000";
SW5120K5<='0';
end if;
-----------------------------------------------
when others =>state<="0000";
end case;
end if;
end process;




end behavioral;