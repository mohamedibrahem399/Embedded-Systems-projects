int echo=5 ;
int trig=6 ;
long distance ;
float duration ;

void setup() {
 pinMode (trig,OUTPUT);
 pinMode (echo,INPUT);
Serial.begin (9600);

}

void loop() {
digitalWrite (trig,LOW);
delayMicroseconds (2);
digitalWrite (trig,HIGH);
delayMicroseconds (10);
digitalWrite (trig,LOW);

duration=pulseIn(echo,HIGH);
distance=duration*0.034 ;

Serial.println (distance/2);
delay (50);



}
