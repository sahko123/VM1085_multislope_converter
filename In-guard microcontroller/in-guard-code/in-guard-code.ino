//define pins
int add_0=1;//address out to cpld
int add_1=2;
int add_2=3;
int add_3=4;

int dat_0=5;//data from or too cpld
int dat_1=6;
int dat_2=7;
int dat_3=8;
int dat_4=9;
int dat_5=10;
int dat_6=11;
int dat_7=12;

int read_id(){
  if(read_cpld(00000110)==01010101){return 1;}
  else{return 0;}
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
  if(bitRead(address,0)==1){digitalWrite(add_0,1);}
  else{digitalWrite(add_0,0);}
  if(bitRead(address,1)==1){digitalWrite(add_1,1);}
  else{digitalWrite(add_1,0);}
  if(bitRead(address,2)==1){digitalWrite(add_2,1);}
  else{digitalWrite(add_2,0);}
  if(bitRead(address,3)==1){digitalWrite(add_3,1);}
  else{digitalWrite(add_3,0);}
  //read data
  delayMicroseconds(10);
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
  
byte write_cpld(int address,byte data){
  
  }
  
void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
