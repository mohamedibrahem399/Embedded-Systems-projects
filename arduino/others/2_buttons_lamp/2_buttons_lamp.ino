int button1=3,led=6;

void setup() {
  // put your setup code here, to run once:
pinMode(button1,INPUT);

pinMode(led,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

digitalWrite(led,LOW);

if (digitalRead(button1)==HIGH)
{digitalWrite(led,LOW);
delay (1000);
}

}
