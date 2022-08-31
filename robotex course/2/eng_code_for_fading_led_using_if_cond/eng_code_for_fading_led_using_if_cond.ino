int led =9;
int brightness=0;
int fadeamount=10;

void setup() {
pinMode (led,OUTPUT);

}

void loop() {
analogWrite (led , brightness);
brightness += fadeamount ;
delay(50);
if (brightness <=0 || brightness >= 255 ){
  fadeamount= -fadeamount ;
  
}
delay(30);
}
