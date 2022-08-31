int i;
int pass[4];

void setup() {
  Serial.begin(9600);
  

}

void loop() {
 
if (Serial.available()){
  for (i=0;i<4;i=i+1){
    pass[i]=Serial.read()-48;
 delay(100);
  }
  Serial.println(pass[0]);
  Serial.println(pass[1]);
  Serial.println(pass[2]);
  Serial.println(pass[3]);
  
  }


}
