int button1 = 2; 
int button2 = 3;
int led = 9;
int ledbrightness = 128;

void setup() {
  // put your setup code here, to run once:
pinMode (button1,INPUT);
pinMode (button2,INPUT);
pinMode(led,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
if (digitalRead(button1)==HIGH)
{ledbrightness++;
}
else if (digitalRead(button2)==HIGH)
{ledbrightness--;}
ledbrightness = constrain (ledbrightness,0,255);
analogWrite (led, ledbrightness);
delay (20);
}
