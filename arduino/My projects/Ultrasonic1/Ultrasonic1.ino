int trig=12 ,echo=13;
long dis,dur;

void setup() {
  // put your setup code here, to run once:
pinMode(trig,OUTPUT);
pinMode(echo,INPUT);
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
 
 digitalWrite(trig,LOW);
 delayMicroseconds(2);
 digitalWrite(trig,HIGH);
 delayMicroseconds(10);
 digitalWrite(trig,LOW);

 dur=pulseIn(echo,HIGH);
 dis=(dur/2)*0.034029;
if (dis>= 200|| dis<=0) {Serial.println("out of range ");}
else { Serial.println(dis);
Serial.println("  cm");}
delay(10);

 
}
