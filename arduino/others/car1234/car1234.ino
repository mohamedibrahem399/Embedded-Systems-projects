
//frontal ultrasonic pins
int trig1=2;
int echo1=3;
long duration1;
//rgiht ultrasonic pins 
int trig2=4;
int echo2=5;
long duration2;
//left ultrasonic pins
int trig3=6;1
int echo3=7;
long duration3;

// right dc motor
int pinR1=8;
int pinL1=9;

//left dc motor 
int pinL2=10;
int pinR2=11;


//controlling values 

long dist1f;
long dist2r;
long dist3l;


void setup() {
  Serial.begin (9600);
    //frontal ultrasonic pinspinMode(2,OUTPUT);
pinMode(2,OUTPUT);
pinMode(3,INPUT);

   //rgiht ultrasonic pins 
pinMode(4,OUTPUT);
pinMode(5,INPUT);

  //left ultrasonic pins 
pinMode(6,OUTPUT);
pinMode(7,INPUT);

//RIGHT DC MOTOR
pinMode(8,OUTPUT);
pinMode (9,OUTPUT);

//LEFT DC MOTOR 
pinMode(10,OUTPUT);
pinMode (11,OUTPUT);
//-----------


}
void loop() {
  // first u.s 
  digitalWrite(2, LOW);
  delayMicroseconds(5);
  digitalWrite(2, HIGH);
  delayMicroseconds(10);
  digitalWrite(2, LOW);
  duration1 = pulseIn(3, HIGH);
  dist1f = (duration1/2) * 0.034029 ;

  // second u.s
 digitalWrite(4, LOW);
  delayMicroseconds(5);
  digitalWrite(4, HIGH);
  delayMicroseconds(10);
  digitalWrite(4, LOW);
  duration2 = pulseIn(5, HIGH);
   dist2r = (duration2/2) *0.034029;
  //third u.s

  digitalWrite(6, LOW);
  delayMicroseconds(5);
  digitalWrite(6, HIGH);
  delayMicroseconds(10);
  digitalWrite(6, LOW);

  duration3 = pulseIn(7, HIGH);
   
   dist3l = (duration3/2) *0.034029;

//MOTOR MOVING 
if (dist1f>20){
digitalWrite (8,HIGH);
digitalWrite(9,LOW);
digitalWrite(10,HIGH);
digitalWrite(11,LOW);Serial.println ( " be 3 " );}

else if  ( dist2r>20 || dist3l>20)
{if (dist2r>dist3l)
  {digitalWrite(8,HIGH);
  digitalWrite(9,LOW);
  digitalWrite(10,LOW); 
digitalWrite(11,LOW);Serial.println ( " be 2 " );
delay (500);}

if(dist3l>dist2r){
digitalWrite(8,LOW);
digitalWrite(9,HIGH);
digitalWrite(10,LOW);Serial.println ( " be 1 " );
digitalWrite(11,LOW);}
 


}
}
