int lm=2,lmX=3,rm=4,rmX=5;

void setup(){
  // put your setup code here, to run once:
pinMode (2,OUTPUT);
pinMode (3,OUTPUT);
pinMode (4,OUTPUT);
pinMode (5,OUTPUT);



}

void loop() {
  // forward :
digitalWrite(lm,HIGH);
digitalWrite(lmX,LOW);
digitalWrite (rm,HIGH);
digitalWrite(rmX,LOW);
delay (2000);
digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay (225);
// backward
digitalWrite(lmX,HIGH);
digitalWrite(lm,LOW);
digitalWrite (rmX,HIGH);
digitalWrite(rm,LOW);
delay (2000);
digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay(225);
//left
digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,HIGH);
digitalWrite(rmX,LOW);
delay(2000);
digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay(225);
//right
digitalWrite(lm,HIGH);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay(2000);
digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay(225);

digitalWrite(lm,LOW);
digitalWrite(lmX,LOW);
digitalWrite (rm,LOW);
digitalWrite(rmX,LOW);
delay(2000);
}

