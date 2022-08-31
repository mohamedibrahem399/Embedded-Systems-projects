int led=5;
int i=0;


void setup() {
pinMode (led,OUTPUT);


}

void loop() {
for (i=0 ; i<=255 ; i=i+5 ) {
  delay (30);
  analogWrite (led ,i);
  
  
}
for (i=255 ; i >=0 ; i=i-5){
  
 
   analogWrite (led ,i);
   delay (30);
}
 
}
