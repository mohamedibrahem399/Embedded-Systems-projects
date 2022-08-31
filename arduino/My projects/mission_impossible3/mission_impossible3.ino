
int trig1=2,echo1=3;

int trig2=4,echo2=5;

int trig3=6,echo3=7;
long dis1,dur1;
long dis2,dur2;
long dis3,dur3;

int m1sw1=8,m1sw2=9;

int m2sw1=10,m2sw2=11;

void setup() {
  // put your setup code here, to run once:
pinMode(trig1,OUTPUT);
pinMode(echo1,INPUT);

pinMode(trig2,OUTPUT);
pinMode(echo2,INPUT);

pinMode(trig3,OUTPUT);
pinMode(echo3,INPUT);

Serial.begin(9600);

pinMode(m1sw1,OUTPUT);
pinMode(m1sw2,OUTPUT);

pinMode(m2sw1,OUTPUT);
pinMode(m2sw2,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(m1sw1,HIGH);
digitalWrite(m1sw2,LOW);

digitalWrite(m2sw1,HIGH);
digitalWrite(m2sw2,LOW);

digitalWrite (trig1,LOW);
delayMicroseconds(2);
digitalWrite (trig1,HIGH);
delayMicroseconds(10);
digitalWrite (trig1,LOW);

dur1=pulseIn(echo1,HIGH);
 dis1=(dur1/2)*0.034029;

digitalWrite (trig2,LOW);
delayMicroseconds(2);
digitalWrite (trig2,HIGH);
delayMicroseconds(10);
digitalWrite (trig2,LOW);

dur2=pulseIn(echo2,HIGH);
 dis2=(dur2/2)*0.034029;

digitalWrite (trig3,LOW);
delayMicroseconds(2);
digitalWrite (trig3,HIGH);
delayMicroseconds(10);
digitalWrite (trig3,LOW);

dur3=pulseIn(echo3,HIGH);
 dis3=(dur3/2)*0.034029;

if (dis1<dis2<dis3|| dis1>=0) {Serial.println("be carefull 10 ");
digitalWrite(m1sw1,LOW);
digitalWrite(m1sw2,LOW);

digitalWrite(m2sw1,HIGH);
digitalWrite(m2sw2,LOW);
}
else if (dis2<dis1<dis3|| dis2>=0) {Serial.println("be carefull 20 ");
digitalWrite(m1sw1,HIGH);
digitalWrite(m1sw2,LOW);

digitalWrite(m2sw1,LOW);
digitalWrite(m2sw2,LOW);
}

else if (dis3<dis1<dis2|| dis3>=0) {Serial.println("be carefull 30 ");
digitalWrite(m1sw1,LOW);
digitalWrite(m1sw2,HIGH);

digitalWrite(m2sw1,LOW);
digitalWrite(m2sw2,HIGH);

}
else {
digitalWrite(m1sw1,HIGH);
digitalWrite(m1sw2,LOW);

digitalWrite(m2sw1,HIGH);
digitalWrite(m2sw2,LOW);

}

delay(10);
}
