int echo=5 ;
int trig=6 ;
long distance ;
float duration ;


int red=3;
int green=10;
int blue=11;



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
distance=duration*0.034/2 ;

Serial.println (distance);
delay (50);
 if (distance<=50){
  Rgb (255,0,0);
  delay (50);
  
 }
else if (distance <=100){
  Rgb (0,0,255);
  delay (50);
  
}
else {
  Rgb (0,255,0);
  delay (50);
}

}




void Rgb(int redvalue,int greenvalue,int bluevalue){

  analogWrite (red,redvalue);
analogWrite (green,greenvalue);
analogWrite (blue,bluevalue);

}



