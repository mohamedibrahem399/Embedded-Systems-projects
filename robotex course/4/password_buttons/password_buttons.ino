int num1;
int num2;
int num3;
int num4;
int but1=2;
int but2=3;
int but3=4;
int but4=5;
int but5=6;
int counter;
int ledgreen=7;
int ledred=8;

void setup() {
pinMode (but1,INPUT);
pinMode (but2,INPUT);
pinMode (but3,INPUT);
pinMode (but4,INPUT);
pinMode (but5,INPUT);
pinMode (ledgreen,OUTPUT);
pinMode (ledred,OUTPUT);
Serial.begin(9600);

}

void loop() {
counter=0;
digitalWrite(ledgreen,LOW);
digitalWrite(ledred,LOW);
while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;
while (counter<1){
counter+=1;
delay(200);
if (digitalRead(but1)==1){num1=1;}
else if (digitalRead(but2)==1){num1=2;}
else if (digitalRead(but3)==1){num1=3;}
else if (digitalRead(but4)==1){num1=4;}
else if (digitalRead(but5)==1){num1=5;}
else {counter-=1;}
}

Serial.println( num1);

while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;

while (counter<2){
counter+=1;
delay(200);
if (digitalRead(but1)==1){num2=1;}
else if (digitalRead(but2)==1){num2=2;}
else if (digitalRead(but3)==1){num2=3;}
else if (digitalRead(but4)==1){num2=4;}
else if (digitalRead(but5)==1){num2=5;}
else {counter-=1;}
}

Serial.println(num2);

while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;

while (counter<3){
counter+=1;
delay (200);
if (digitalRead(but1)==1){num3=1;}
else if (digitalRead(but2)==1){num3=2;}
else if (digitalRead(but3)==1){num3=3;}
else if (digitalRead(but4)==1){num3=4;}
else if (digitalRead(but5)==1){num3=5;}
else {counter-=1;}
}


Serial.println( num3);

while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;

while (counter<4){
counter+=1;
delay (200);
if (digitalRead(but1)==1){num4=1;}
else if (digitalRead(but2)==1){num4=2;}
else if (digitalRead(but3)==1){num4=3;}
else if (digitalRead(but4)==1){num4=4;}
else if (digitalRead(but5)==1){num4=5;}
else {counter-=1;}
}

Serial.println( num4);


if (num1==2 & num2==4 & num3==1 & num4==5) {
digitalWrite (ledgreen,HIGH);
delay (1000);
}
else {digitalWrite (ledred,HIGH);
delay (1000);
}

}
