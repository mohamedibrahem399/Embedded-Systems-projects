int m1=3,m11=4,m2=5,m22=6;

void setup() { 
  pinMode(m11,OUTPUT);
  pinMode(m2,OUTPUT);
  pinMode(m22,OUTPUT);
  pinMode(m1,OUTPUT);

}

void loop() { //forward
 digitalWrite(m1,HIGH);
 digitalWrite(m11,LOW);
 digitalWrite(m2,HIGH);
 digitalWrite(m22,LOW);
 delay(2000);
 //right
 digitalWrite(m1,LOW);
 digitalWrite(m11,LOW);
 digitalWrite(m2,HIGH);
 digitalWrite(m22,LOW);
 delay(2000);
 //left
 digitalWrite(m1,HIGH);
 digitalWrite(m11,LOW);
 digitalWrite(m2,LOW);
 digitalWrite(m22,LOW);
 delay(2000);
 //back
 digitalWrite(m1,LOW);
 digitalWrite(m11,HIGH);
 digitalWrite(m2,LOW);
 digitalWrite(m22,HIGH);
 delay(2000);
 //stop
 digitalWrite(m1,LOW);
 digitalWrite(m11,LOW);
 digitalWrite(m2,LOW);
 digitalWrite(m22,LOW);
 delay(2000);
}
