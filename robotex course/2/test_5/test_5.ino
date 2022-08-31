int ldr1=3;
int ldr2=A0;
int ldr3=6;
int ldr4=9;

int i;
int o;
int p;
int l;

void setup() {

pinMode (ldr1,INPUT );
pinMode (ldr2,INPUT );
pinMode (ldr3,INPUT );
pinMode (ldr4,INPUT );

Serial.begin (9600);

}


void loop() {

i= analogRead (ldr1);

o= analogRead (ldr2);

p= analogRead (ldr3);

l= analogRead (ldr4);


if (i<o && i<p && i<l ) {
  Serial.println ("move up ");
  
}
else if (o<i && o< p && o<l ){
  Serial.println ("move right ");
  
}

else if (p<o && p<i && p< l) {
  Serial.println ("move down ");
  
}
else if ( l<i && l<o && l<p ){
  Serial.println ("move left " );
}
 
 }
