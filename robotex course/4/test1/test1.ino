
int but1=2;
int but2=3;
int but3=4;
int but4=5;
int but5=6;

void setup() {
  // put your setup code here, to run once:
pinMode (but1,INPUT);
pinMode (but2,INPUT);
pinMode (but3,INPUT);
pinMode (but4,INPUT);
pinMode (but5,INPUT);

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

Serial.println(digitalRead(but1));

}
