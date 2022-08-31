int red=3;
int green=5;
int blue=6;
int r;
int g;
int b;
int rg;
int rb;
int gb;
int rgb;

void setup() {
pinMode (red,OUTPUT);
pinMode (green,OUTPUT);
pinMode (blue,OUTPUT);

}

void loop() {

for (r=0;r<=255;r=r+5) {

Rgb (r,0,0);
delay (50);
}
r=0;
delay (10);

for (rb=0;rb<=255;rb=rb+5){
  Rgb (rb,0,rb);
  delay (50);
}


for (b=0;b<=255;b=b+5) {
    Rgb (0,0,b);
    delay (50);
}
b=0;
delay (10);



for (gb=0;gb<=255;gb=gb+5){
  Rgb (0,gb,gb);
  delay (50);
}
gb=0;
delay (50);


for (g=0;g<=255;g=g+5) {
  Rgb (0,0,g);
  delay (50);
}
g=0;
delay (10);

for (rg=0;rg<=255;rg=rg+5){
  Rgb (rg,rg,0);
  delay (50);
}


for (rgb=0;rgb<=255;rgb=rgb+5){
  Rgb (rgb,rgb,rgb);

 delay (50);
}

}

void Rgb(int redvalue,int greenvalue,int bluevalue){

  analogWrite (red,redvalue);
analogWrite (green,greenvalue);
analogWrite (blue,bluevalue);

}

