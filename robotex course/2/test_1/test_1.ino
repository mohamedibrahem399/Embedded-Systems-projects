int i ;
int led=5;


void setup() {
 pinMode (led,OUTPUT);
}

void loop() {


analogWrite (led ,i);
i=0 ;
if (i<255) {
i=i+10;
delay (50);
}

if (i=255) {
  i=i-10 ;
  delay (50);
}



}
