int trig=2;
int echo=4;
long dis,dur;
int red=6;
int green=7;
int yellow=8;
int blue=9;
int dis1,dis2,dis3,dis4,dis5;

void setup() {
  pinMode(trig,OUTPUT);
  pinMode(echo,INPUT);
  pinMode(red,OUTPUT);
  pinMode(green,OUTPUT);
  pinMode(yellow,OUTPUT);
  pinMode(blue,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(trig,LOW);delayMicroseconds(2);digitalWrite(trig,HIGH);delayMicroseconds(10);digitalWrite(trig,LOW);dur=pulseIn(echo,HIGH);dis=(dur/2)*0.034029;
  if(dis>=200 || dis<=0) {Serial.println("out of range");}
  else {Serial.println(dis);Serial.println("   cm");dis1=dis;delay(1000);}
  if(dis1==dis){digitalWrite(blue,HIGH);digitalWrite(yellow,HIGH);digitalWrite(green,HIGH);digitalWrite(red,HIGH);}
  digitalWrite(trig,LOW);delayMicroseconds(2);digitalWrite(trig,HIGH);delayMicroseconds(10);digitalWrite(trig,LOW);dur=pulseIn(echo,HIGH);dis=(dur/2)*0.034029;
  if(dis<=200 || dis>=0){Serial.println(dis);Serial.println("   cm");dis2=dis;delay(1000);}
  if(dis1>dis2){digitalWrite(blue,LOW);digitalWrite(yellow,HIGH);digitalWrite(green,HIGH);digitalWrite(red,HIGH);}
  digitalWrite(trig,LOW);delayMicroseconds(2);digitalWrite(trig,HIGH);delayMicroseconds(10);digitalWrite(trig,LOW);dur=pulseIn(echo,HIGH);dis=(dur/2)*0.034029;
  if(dis<=200 || dis>=0){Serial.println(dis);Serial.println("   cm");dis2=dis;delay(1000);}
  if(dis2>dis3){digitalWrite(blue,LOW);digitalWrite(yellow,LOW);digitalWrite(green,HIGH);digitalWrite(red,HIGH);}
  digitalWrite(trig,LOW);delayMicroseconds(2);digitalWrite(trig,HIGH);delayMicroseconds(10);digitalWrite(trig,LOW);dur=pulseIn(echo,HIGH);dis=(dur/2)*0.034029;
  if(dis<=200 || dis>=0){Serial.println(dis);Serial.println("   cm");dis4=dis;delay(1000);}
  if(dis3>dis4){digitalWrite(blue,LOW);digitalWrite(yellow,LOW);digitalWrite(green,LOW);digitalWrite(red,HIGH);}
  digitalWrite(trig,LOW);delayMicroseconds(2);digitalWrite(trig,HIGH);delayMicroseconds(10);digitalWrite(trig,LOW);dur=pulseIn(echo,HIGH);dis=(dur/2)*0.034029;
  if(dis<=200 || dis>=0){Serial.println(dis);Serial.println("   cm");dis5=dis;delay(1000);}
  if(dis4>dis5){digitalWrite(blue,LOW);digitalWrite(yellow,LOW);digitalWrite(green,LOW);digitalWrite(red,LOW);}
}
