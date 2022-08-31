int led=5;
int i=0;
int v=255;
void setup() {
 pinMode (5,OUTPUT);
 Serial.begin(9600);
}

void loop() {

if (i=255){
  v=v-5;
 delay (50); 
 Serial.println (i);
} 

else if (i<=255) {
i=i+5;
analogWrite (led , i);
delay (100);

Serial.print (i);
}


if ((i=255)&&(v=0)){
  i=v;
Serial.println (i);
}

}
