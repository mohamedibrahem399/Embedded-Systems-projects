int leda=5;
int ledb=6;
int ledc=7;
int ledd=8;
int lede=9;
int ledf=10;
int ledg=12;



void setup() {
pinMode (leda,OUTPUT);
pinMode (ledb,OUTPUT);
pinMode (ledc,OUTPUT);
pinMode (ledd,OUTPUT);
pinMode (lede,OUTPUT);
pinMode (ledf,OUTPUT);
pinMode (ledg,OUTPUT);

}

void loop() {
alloff() ;
delay (500);

nine();
delay (1000);

alloff() ;
delay (500);

eight();
delay (1000);

alloff() ;
delay (500);

siven();
delay (1000);

alloff() ;
delay (500);

six();
delay (1000);

alloff() ;
delay (500);

five();
delay (1000);

alloff() ;
delay (500);

four();
delay (1000);

alloff() ;
delay (500);

three();
delay (1000);

alloff() ;
delay (500);

two();
delay (1000);

alloff() ;
delay (500);

one();
delay (1000);

alloff() ;
delay (500);

zero();
delay (1000);

alloff() ;
delay (500);

}
void nine() {
digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (ledf,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (lede,HIGH);

}

void eight(){

digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (ledd,HIGH);
digitalWrite (lede,HIGH);
digitalWrite (ledf,HIGH);
digitalWrite (ledg,HIGH);


}

void siven() {

digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledc,HIGH);

}

void six() {

digitalWrite (leda,HIGH);
digitalWrite (ledf,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (lede,HIGH);
digitalWrite (ledd,HIGH);

}

void five() {

digitalWrite (leda,HIGH);
digitalWrite (ledf,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (lede,HIGH);

}

void four() {

digitalWrite (ledb,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (ledf,HIGH);
digitalWrite (ledc,HIGH);
 
}

void three() {

digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (lede,HIGH);

  
}

void two() {
digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledg,HIGH);
digitalWrite (lede,HIGH);
digitalWrite (ledd,HIGH);
 
}

void one() {
digitalWrite (ledb,HIGH);
digitalWrite (ledc,HIGH);

}

void zero() {
digitalWrite (leda,HIGH);
digitalWrite (ledb,HIGH);
digitalWrite (ledc,HIGH);
digitalWrite (ledd,HIGH);
digitalWrite (lede,HIGH);
digitalWrite (ledf,HIGH);

}

void alloff() {
digitalWrite (leda, LOW);
digitalWrite (ledb,LOW);
digitalWrite (ledc,LOW);
digitalWrite (ledd,LOW);
digitalWrite (lede,LOW);
digitalWrite (ledf,LOW);
digitalWrite (ledg,LOW);

  
}

