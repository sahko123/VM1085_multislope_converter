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

int conv=12;
int data_ready=13;

byte read_id(){
  byte out=read_cpld(0b00000110);
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
  delay(1);
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
  delayMicroseconds(5);
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
  int lsb=read_cpld(0b00000010)<<16;
  int mlsb=read_cpld(0b00000001)<<8;
  int msb=read_cpld(0b00000000);
  reading=lsb+mlsb+msb;
  if(reading>8388608){
    reading=reading-16777216;}
  else{}
  return reading;
  
  }
int read_run12(){
  int reading=read_cpld(0b00000011);
  return reading;
  }
int read_run34(){
  int reading=read_cpld(0b00000100);
  return reading;
  }
int read_run5(){
  int reading=read_cpld(0b00000101);
  return reading;
  }
double conversion(long testcount,int rpd1){
  double reading;
  double cal=-4.364321;
  double samplecount=1*10000000.0;
  reading=(10/cal)*((10*((7*testcount)+rpd1)/samplecount));
  return reading;
  }
double raw_conversion(long testcount,int rpd1){
  double reading;
  double cal=-4.364321;
  double samplecount=1*10000000.0;
  reading=((10*((7*testcount)+rpd1)/samplecount));
  return reading;
  }
void setup() {
  Serial.begin(115200);
  pinMode(conv,OUTPUT);
  pinMode(data_ready,INPUT);
  pinMode(add_0,OUTPUT);
  pinMode(add_1,OUTPUT);
  pinMode(add_2,OUTPUT);
  pinMode(add_3,OUTPUT);
  digitalWrite(conv,HIGH);
  delay(100);
  digitalWrite(conv,LOW);
  
}

void loop() {
  
  
  if(digitalRead(data_ready)){
    Serial.print("Runup Read: ");
    Serial.println(get_runup_read());
    Serial.print("Rundown 12: ");
    Serial.println(read_run12());
    Serial.print("Rundown 34: ");
    Serial.println(read_run34());
    Serial.print("Rundown 5: ");
    Serial.println(read_run5());
    Serial.print("Raw Cal: ");
    Serial.println(raw_conversion(get_runup_read(),read_run12()),12);
    Serial.print("Reading: ");
    Serial.println(conversion(get_runup_read(),read_run12()),7);
    digitalWrite(conv,HIGH);
    delay(1);
    digitalWrite(conv,LOW);
    }
    
  if(!digitalRead(data_ready)){
    //Serial.println("Conving");
    //delay(10);
    }

  

}
