int n=1;
int counter;
int led=6;
void setup() {
pinMode(5,INPUT);
Serial.begin(9600);
pinMode (led,OUTPUT);
for (counter=1;counter<=9;counter=counter+n){
 Serial.println("WORKED!!!!!!!!!!!!!!!! we hacked the systemmmmmmmmmmm");
//if(digitalRead (5)==1){digitalWrite (led,HIGH);
delay(1000);
n+=1;
}
}

void loop() {

}
