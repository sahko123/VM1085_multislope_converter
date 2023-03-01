//define pins
int add_0=1;
int add_1=2;
int add_2=3;
int add_3=4;

int read_id(){
  if(read_cpld==01010101){return 1;}
  else{return 0;}
  }
  
byte read_cpld(byte address){
  byte data;
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
