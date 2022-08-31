int trig=7,echo=8;
long dis,dur;

void setup() {
pinMode(trig,OUTPUT);
pinMode(echo,INPUT);
Serial.begin(9600);

}

void loop() {
  digitalWrite(trig,LOW);
  delayMicroseconds(2);
  digitalWrite(trig,HIGH);
  delayMicroseconds(10);
  digitalWrite(trig,LOW);
  
  dur=pulseIn(echo,HIGH);
  dis=(dur/2)*0.034029;

  if(dis>=200 || dis<=0){Serial.print("outofrang");}
  else{Serial.print(dis);
  Serial.println("...cm");}
  delay(10);}


 
