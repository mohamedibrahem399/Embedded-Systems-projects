int coilpin1=8; 
int coilpin2=9;
int rowpin1=1;
int rowpin2=2;
int rowpin3=3;
int rowpin4=4;
int rowpin5=5;

void setup() {
  // put your setup code here, to run once:

pinMode(coilpin1,OUTPUT);
pinMode(coilpin2,OUTPUT);
pinMode(rowpin1,OUTPUT);
pinMode(rowpin2,OUTPUT);
pinMode(rowpin3,OUTPUT);
pinMode(rowpin4,OUTPUT);
pinMode(rowpin5,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:

digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,HIGH);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,HIGH);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);


digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,HIGH);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,HIGH);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,HIGH);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,HIGH);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,HIGH);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,HIGH);
digitalWrite(rowpin5,LOW);
delay(200);

digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,HIGH);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,LOW);
digitalWrite(rowpin2,LOW);
digitalWrite(rowpin3,LOW);
digitalWrite(rowpin4,LOW);
digitalWrite(rowpin5,HIGH);
delay(200);

digitalWrite(coilpin1,HIGH);
digitalWrite(coilpin2,LOW);
digitalWrite(rowpin1,HIGH);
digitalWrite(rowpin2,HIGH);
digitalWrite(rowpin3,HIGH);
digitalWrite(rowpin4,HIGH);
digitalWrite(rowpin5,HIGH);
delay(200);

digitalWrite(coilpin1,LOW);
digitalWrite(coilpin2,HIGH);
digitalWrite(rowpin1,HIGH);
digitalWrite(rowpin2,HIGH);
digitalWrite(rowpin3,HIGH);
digitalWrite(rowpin4,HIGH);
digitalWrite(rowpin5,HIGH);
delay(200);





}
