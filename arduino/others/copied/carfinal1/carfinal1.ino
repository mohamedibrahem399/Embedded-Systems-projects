int trigr=2;
int echor=3;
long disr,durr;

int trigf=4;
int echof=5;
long disf,durf;

int trigl=6;
int echol=7;
long disl,durl;

int m1=8,m11=9,m2=10,m22=11;
int x=1;

void setup() {
  pinMode(trigr,OUTPUT);
  pinMode(echor,INPUT);
  
  pinMode(trigf,OUTPUT);
  pinMode(echof,INPUT);
  
  pinMode(trigl,OUTPUT);
  pinMode(echol,INPUT);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(trigr,LOW);delayMicroseconds(2);digitalWrite(trigr,HIGH);delayMicroseconds(10);digitalWrite(trigr,LOW);durr=pulseIn(echor,HIGH);disr=(durr/2)*0.034029;
  digitalWrite(trigf,LOW);delayMicroseconds(2);digitalWrite(trigf,HIGH);delayMicroseconds(10);digitalWrite(trigf,LOW);durf=pulseIn(echof,HIGH);disf=(durf/2)*0.034029;
  digitalWrite(trigl,LOW);delayMicroseconds(2);digitalWrite(trigl,HIGH);delayMicroseconds(10);digitalWrite(trigl,LOW);durl=pulseIn(echol,HIGH);disl=(durl/2)*0.034029;

  if(disf>20) {//forward
 digitalWrite(m1,HIGH);
 digitalWrite(m11,LOW);
 digitalWrite(m2,HIGH);
 digitalWrite(m22,LOW);}
 
 else if (disr>20 || disl>20) 
 {if(disr>disl) { //right
 digitalWrite(m1,LOW);
 digitalWrite(m11,LOW);
 digitalWrite(m2,HIGH);
 digitalWrite(m22,LOW);
 x=1;}
 if(disl>disr) {//left
 digitalWrite(m1,HIGH);
 digitalWrite(m11,LOW);
 digitalWrite(m2,LOW);
 digitalWrite(m22,LOW);
 x=1;}}

 else if(disr<20 && disl<20 && disf<20) {//back
 digitalWrite(m1,LOW);
 digitalWrite(m11,HIGH);
 digitalWrite(m2,LOW);
 digitalWrite(m22,HIGH);
 delay(150*x);
 x=x+1;}
 
 
}
