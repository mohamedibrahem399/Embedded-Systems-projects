int num[4];
int but1=2;
int but2=3;
int but3=4;
int but4=5;
int but5=6;
int counter;
int ledgreen=8;
int ledred=9;

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

if (digitalRead(but1)==1){num[0]=1;}
else if (digitalRead(but2)==1){num[0]=2;}
else if (digitalRead(but3)==1){num[0]=3;}
else if (digitalRead(but4)==1){num[0]=4;}
else if (digitalRead(but5)==1){num[0]=5;}
else {counter-=1;}
}

Serial.println( num[0]);
while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;


while (counter<2){
counter+=1;
if (digitalRead(but1)==1){num[1]=1;}
else if (digitalRead(but2)==1){num[1]=2;}
else if (digitalRead(but3)==1){num[1]=3;}
else if (digitalRead(but4)==1){num[1]=4;}
else if (digitalRead(but5)==1){num[1]=5;}
else {counter-=1;}
}

Serial.println(num[1]);
while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;


while (counter<3){
counter+=1;
if (digitalRead(but1)==1){num[2]=1;}
else if (digitalRead(but2)==1){num[2]=2;}
else if (digitalRead(but3)==1){num[2]=3;}
else if (digitalRead(but4)==1){num[2]=4;}
else if (digitalRead(but5)==1){num[2]=5;}
else {counter-=1;}
}


Serial.println( num[2]);
while (digitalRead (but1)!=0 or digitalRead (but2)!=0 or digitalRead (but3)!=0 or digitalRead (but4)!=0 or digitalRead (but5)!=0 ) ;


while (counter<4){
counter+=1;
if (digitalRead(but1)==1){num[3]=1;}
else if (digitalRead(but2)==1){num[3]=2;}
else if (digitalRead(but3)==1){num[3]=3;}
else if (digitalRead(but4)==1){num[3]=4;}
else if (digitalRead(but5)==1){num[3]=5;}
else {counter-=1;}
}

Serial.println( num[3]);


if (num[0]==2 & num[1]==4 & num[2]==1 & num[3]==5) {
digitalWrite (ledgreen,HIGH);
delay (1000);
}
else {digitalWrite (ledred,HIGH);
delay (1000);
}

}
