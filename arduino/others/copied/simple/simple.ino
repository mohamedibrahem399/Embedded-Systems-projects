int but=7;
int red=3;
int green=5;
int yellow=9;
int blue=11;
int x=0;

void setup() {
  pinMode(but,INPUT);
  pinMode(red,OUTPUT);
  pinMode(green,OUTPUT);
  pinMode(yellow,OUTPUT);
  pinMode(blue,OUTPUT);

}

void loop() {
  if(digitalRead(but)==HIGH&&x==0){x++;digitalWrite(red,HIGH);delay(500);} 
  if(digitalRead(but)==HIGH&&x==1){x++;digitalWrite(green,HIGH);delay(500);}   
  if(digitalRead(but)==HIGH&&x==2){x++;digitalWrite(yellow,HIGH);delay(500);}   
  if(digitalRead(but)==HIGH&&x==3){x++;digitalWrite(blue,HIGH);delay(500);} 
  if(digitalRead(but)==HIGH&&x==4){x=0;digitalWrite(blue,LOW);digitalWrite(yellow,LOW);digitalWrite(green,LOW);digitalWrite(red,LOW);delay(500);}                                                     
  
}
