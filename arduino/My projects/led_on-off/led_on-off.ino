int SW=2;
int LED=3;
int ButtonState;

void setup() {
  // put your setup code here, to run once:
pinMode(LED,OUTPUT);
pinMode(SW,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

ButtonState=digitalRead(SW);

if (ButtonState==HIGH)
{digitalWrite(LED,HIGH);
}
else
{digitalWrite(LED,LOW);
}
}
