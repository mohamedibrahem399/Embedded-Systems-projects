int green=2;
int red=3;
int yellow=4;
int blue=5;

void setup() {
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);

}

void loop() {
 digitalWrite(2,HIGH);
 delay(20);
 digitalWrite(3,HIGH);
 delay(20);
 digitalWrite(4,HIGH);
 delay(20);
 digitalWrite(5,HIGH);
 delay(20);
 digitalWrite(2,LOW);
 delay(20);
 digitalWrite(3,LOW);
 delay(20);
 digitalWrite(4,LOW);
 delay(20);
 digitalWrite(5,LOW);
 delay(20);
}
