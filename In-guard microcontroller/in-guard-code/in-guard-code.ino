//define pins
int add_0=0;//address out to cpld
int add_1=1;
int add_2=2;
int add_3=3;

int dat_0=4;//data from or too cpld
int dat_1=5;
int dat_2=6;
int dat_3=7;
int dat_4=8;
int dat_5=9;
int dat_6=10;
int dat_7=11;
//relays
int zero=17;
int ref_input=16;
//cpld pins
int conv=12;
int data_ready=13;

double stime=0.2;
double clk=10000000;
double samplecount=clk*stime;
double vref=10.0169870399;
double zerocal=0.0;
double ext_zerocal=-0.0554799688;
double gain=-1.8098457364;

int running_average=0;
int average_samples=10;
double rolling=0;

void average_1(double reading){
  if(running_average==0){rolling=reading;}
  else if(running_average<average_samples){rolling=(rolling+reading)/2;}
  else{running_average=0;}
  running_average+=1;
  }

void toggle_relay(int relay){
  pinMode(relay,OUTPUT);
  if(digitalRead(relay)==HIGH){digitalWrite(relay,LOW);}
  else{digitalWrite(relay,HIGH);}
  }
void set_relay(int relay,bool setting){
  pinMode(relay,OUTPUT);
  digitalWrite(relay,setting);
  }
byte read_id(){
  byte out=read_cpld(0b00001000);
  return out;
  }
  
byte read_cpld(byte address){
  byte data;
  //set data pinmodes
  pinMode(dat_0,INPUT);
  pinMode(dat_1,INPUT);
  pinMode(dat_2,INPUT);
  pinMode(dat_3,INPUT);
  pinMode(dat_4,INPUT);
  pinMode(dat_5,INPUT);
  pinMode(dat_6,INPUT);
  pinMode(dat_7,INPUT);
  //write address byte
  if(bitRead(address,0)==1){digitalWrite(add_0,HIGH);}
  else{digitalWrite(add_0,LOW);}
  if(bitRead(address,1)==1){digitalWrite(add_1,HIGH);}
  else{digitalWrite(add_1,LOW);}
  if(bitRead(address,2)==1){digitalWrite(add_2,HIGH);}
  else{digitalWrite(add_2,LOW);}
  if(bitRead(address,3)==1){digitalWrite(add_3,HIGH);}
  else{digitalWrite(add_3,LOW);}
  //read data
  delayMicroseconds(10);//setup
  bitWrite(data,0,digitalRead(dat_0));
  bitWrite(data,1,digitalRead(dat_1));
  bitWrite(data,2,digitalRead(dat_2));
  bitWrite(data,3,digitalRead(dat_3));
  bitWrite(data,4,digitalRead(dat_4));
  bitWrite(data,5,digitalRead(dat_5));
  bitWrite(data,6,digitalRead(dat_6));
  bitWrite(data,7,digitalRead(dat_7));
  return data;
  }
  
void write_cpld(byte address,byte data){
  //set data pinmodes
  pinMode(dat_0,OUTPUT);
  pinMode(dat_1,OUTPUT);
  pinMode(dat_2,OUTPUT);
  pinMode(dat_3,OUTPUT);
  pinMode(dat_4,OUTPUT);
  pinMode(dat_5,OUTPUT);
  pinMode(dat_6,OUTPUT);
  pinMode(dat_7,OUTPUT);
  //write address
  if(bitRead(address,0)==1){digitalWrite(add_0,HIGH);}
  else{digitalWrite(add_0,LOW);}
  if(bitRead(address,1)==1){digitalWrite(add_1,HIGH);}
  else{digitalWrite(add_1,LOW);}
  if(bitRead(address,2)==1){digitalWrite(add_2,HIGH);}
  else{digitalWrite(add_2,LOW);}
  if(bitRead(address,3)==1){digitalWrite(add_3,HIGH);}
  else{digitalWrite(add_3,LOW);}
  //write data
  delayMicroseconds(1);
  digitalWrite(dat_0,bitRead(data,0));
  digitalWrite(dat_1,bitRead(data,1));
  digitalWrite(dat_2,bitRead(data,2));
  digitalWrite(dat_3,bitRead(data,3));
  digitalWrite(dat_4,bitRead(data,4));
  digitalWrite(dat_5,bitRead(data,5));
  digitalWrite(dat_6,bitRead(data,6));
  digitalWrite(dat_7,bitRead(data,7));
  }
long get_runup_read(){
  long reading;
  int msb=read_cpld(0b00000011)<<24;
  int mmsb=read_cpld(0b00000010)<<16;
  int mlsb=read_cpld(0b00000001)<<8;
  int lsb=read_cpld(0b00000000);
  reading=lsb+mlsb+mmsb+msb;
  if(reading>8388608){
    reading=reading-16777216;}
  return reading;
  }
float read_run1(){
  float reading=read_cpld(0b00000100);
  return reading;
}
float read_run2(){
  float reading=read_cpld(0b00000101);
  return reading;
}
float read_run3(){
  float reading=read_cpld(0b00000110);
  return reading;
}
float read_run4(){
  float reading=read_cpld(0b00000111);
  return reading;
  } 
float read_run5(){
  float reading=read_cpld(0b00001000);
  return reading;
  }
void adc_gain(){
  set_relay(zero,true);
  set_relay(ref_input,false);
  delay(500);
  start_conversion();
  delay(500);
  double reading=samplecount/(((10.0*get_runup_read())+(read_run1())-(read_run2())+(read_run3()/4.1)-(read_run4()/38.0)+(read_run5()/260.0) ));
  set_relay(zero,false);
  set_relay(ref_input,true);
  gain=reading;
  }
void adc_vref(){
  set_relay(zero,true);
  set_relay(ref_input,true);
  delay(500);
  start_conversion();
  delay(500);
  double reading=((10+ext_zerocal)*samplecount)/(gain*((10.0*get_runup_read())+(read_run1())-(read_run2())+(read_run3()/4.1)-(read_run4()/38.0)+(read_run5()/260.0) ));
  vref=reading;
  set_relay(zero,false);
  set_relay(ref_input,false);
  }
void adc_zero(){
  set_relay(zero,false);
  delay(500);
  start_conversion();
  delay(500);
  double reading=gain*(((( (10.0*get_runup_read())+(read_run1())-(read_run2())+(read_run3()/4.1)-(read_run4()/38.0)+(read_run5()/260.0) ))/samplecount));
  zerocal=reading;
  set_relay(zero,true);
  }
void ext_zero(){
  set_relay(zero,true);
  set_relay(ref_input,true);
  delay(500);
  start_conversion();
  delay(500);
  double reading=gain*(((( (10.0*get_runup_read())+(read_run1())-(read_run2())+(read_run3()/4.1)-(read_run4()/38.0)+(read_run5()/260.0) ))/samplecount));
  ext_zerocal=reading;
  set_relay(zero,false);
  set_relay(ref_input,false);
  }

double reading(double stime){
  double reading=(vref*gain)*(((( (10.0*get_runup_read())+(read_run1())-(read_run2())+(read_run3()/4.1)-(read_run4()/38.0)+(read_run5()/260.0) ))/samplecount))-ext_zerocal;
  return reading;
  }
void start_conversion(){
  delayMicroseconds(500);
  digitalWrite(conv,HIGH);
  delayMicroseconds(100);
  digitalWrite(conv,LOW);
  }
void test_func(){
    Serial.print("Runup Read: ");
    Serial.println(get_runup_read());
    Serial.print("Rundown 1: ");
    Serial.println(read_run1());
    Serial.print("Rundown 2: ");
    Serial.println(read_run2());
    Serial.print("Rundown 3: ");
    Serial.println(read_run3());
    Serial.print("Rundown 4: ");
    Serial.println(read_run4());
    Serial.print("Rundown 5: ");
    Serial.println(read_run5());
    
  }
void setup() {
  Serial.begin(115200);
  pinMode(conv,OUTPUT);
  pinMode(data_ready,INPUT);
  pinMode(add_0,OUTPUT);
  pinMode(add_1,OUTPUT);
  pinMode(add_2,OUTPUT);
  pinMode(add_3,OUTPUT);
  
  adc_gain();
  adc_zero();
  //ext_zero();
  adc_vref();
  
  set_relay(zero,true);
  set_relay(ref_input,false);
}

void loop() {
  
  
  if(digitalRead(data_ready)){
    double new_reading=reading(stime);
    Serial.print(new_reading,7);
    Serial.print("\t");
    average_1(new_reading);
    if(running_average==10){
      Serial.print(rolling,7);
      Serial.print("\t");
      }
    else{
      Serial.print("not average");
      Serial.print("\t");
      }
    Serial.print(vref,10);
    Serial.print("\t");
    Serial.print(gain,10);
    Serial.print("\t");
    Serial.print(zerocal,10);
    Serial.print("\t");
    Serial.println(ext_zerocal,10);
    //Serial.println("Vdc");
    start_conversion();
    }
    
  if(!digitalRead(data_ready)){
    //Serial.println("Conving");
    //delay(10);
    }

  

}
