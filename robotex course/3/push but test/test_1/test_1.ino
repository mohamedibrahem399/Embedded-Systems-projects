int but1=5;
int led1=6;
int i;
void setup() {

pinMode (but1,INPUT);
pinMode (led1,OUTPUT);
Serial.begin(9600);

}

void loop() {
i=0 ;
digitalWrite (led1,LOW);

i=digitalRead (but1);
Serial.println (i);

if (i==HIGH) {
digitalWrite (led1,HIGH);
 
delay (250);
   
}

i=0;

  
}
