int red=5;
int green=6;
int yellow=7;
int blue=8;
int i=0;
int button1=12;

void setup() {
  // put your setup code here, to run once:
pinMode(red,OUTPUT);
  pinMode(green,OUTPUT);
  pinMode(yellow,OUTPUT);
  pinMode(blue,OUTPUT);
pinMode(button1,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
if (digitalRead(button1)==HIGH){
i++;

if(i=1)
{digitalWrite(red,HIGH);}
else if (i=2)
{digitalWrite(green,HIGH);}
else if (i=3)
{digitalWrite(yellow,HIGH);}
else if (i=4)
{digitalWrite(blue,HIGH);}

else if (i=5)
{digitalWrite(red,LOW);
  digitalWrite(green,LOW);
  digitalWrite(yellow,LOW);
  digitalWrite(blue,LOW);
i=0;
}
}
delay(200);
}
