int button1 = 2; 
int button2 = 3;
int led = 9;
int leddelay = 10;
void setup() {
  // put your setup code here, to run once:
pinMode (button1,INPUT);
pinMode (button2,INPUT);
pinMode(led,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
if (digitalRead(button1)==HIGH)
{leddelay++;
}
else if (digitalRead(button2)==HIGH)
{leddelay--;}
digitalWrite(led,HIGH);
delay (leddelay *2 );
digitalWrite (led, LOW);
delay (leddelay *2);
}
