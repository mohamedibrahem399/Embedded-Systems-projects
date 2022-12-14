/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
? Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : TEST_IC_4008
Version : 
Date    : 12/28/2021
Author  : 
Company : 
Comments: 


Chip type               : ATmega32A
Program type            : Application
AVR Core Clock frequency: 11.059200 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 512
*******************************************************/

#include <mega32a.h>

#include <delay.h>

 // PINS USED WITH THIS IC :- A0 - A6 & C7- C1
 // C0 & A7 NOT USED

 // NUMBER OF PINS = 16
 //CONNECTION 
                   //PINS IN THE CD4008 IC    // IN OR OUT
 #define A4    PORTA.0  //PIN 1                    //  IN A4
 #define B3    PORTA.1  //PIN 2                    //  IN B3
 #define A3    PORTA.2  //PIN 3                    //  IN A3
 #define B2    PORTA.3  //PIN 4                    //  IN B2
 #define A2    PORTA.4  //PIN 5                    //  IN A2
 #define B1    PORTA.5  //PIN 6                    //  IN B1
 #define A1    PORTA.6  //PIN 7                    //  IN A1
             //PORTA.7  //PIN 8                    //  GND
 #define CI    PORTC.7  //PIN 9                    //  IN CI
 #define S1    PINC.6   //PIN 10                   //  OUT S1
 #define S2    PINC.5   //PIN 11                   //  OUT S2
 #define S3    PINC.4   //PIN 12                   //  OUT S3
 #define S4    PINC.3   //PIN 13                   //  OUT S4
 #define CO    PINC.2   //PIN 14                   //  OUT CO
 #define B4    PORTC.1  //PIN 15                   //  IN B4
            //PORTC.0   //PIN 16                   //  VCC       
  
 
 //INPUT  PORTS IN OUR IC :- C6-C2            //DDR  = 0 // PORT.0 =   1
 //OUTPUT PORTS IN OUR IC :- A6-A0 & C7 & C1  //DDR  = 1 // PORT.1 =   0
              
 #define ON  1
 #define OFF 0
 
 #define LED_GREEN PORTD.2
 #define LED_RED PORTD.3
 
 
 char test = 1;
 char flag = 1;
 char temp =0;
 char i1,i2;
 char a,b; 
 char arr1[4] = {0,0,0,0};
 char arr2[4] = {0,0,0,0};
 char arr3[5] = {0,0,0,0,0};
 
void main(void)
{
    DDRA    = 0xff ; // 1111 1111
    PORTA   = 0x00 ; // 0000 0000
    
    DDRC    = 0x83 ; // 1000 0011
    PORTC   = 0x7C ; // 0111 1100
    
    DDRD    = 0xff ;
    PORTD   = 0x00 ;
        
while (1)
      {
      if  (flag == 1){ 
           for(CI=0 ; CI<2;CI++){
               for (a=0;a<16;a++){
                   delay_ms(10);
                   i1= a;
                   for (i2=0; i2 < 4; i2++){
                        arr1[i2] =   i1%2 ;
                        i1 = i1/2;
                   }
                   
                   delay_ms(10);
                   i1 = arr1[0];
                   arr1[0] = arr1[3];
                   arr1[3] = i1;
                   
                   delay_ms(10);
                   i1 = arr1[1];
                   arr1[1] = arr1[2];
                   arr1[2] = i1;
                   
                   delay_ms(10);
                   A1 = arr1[3];
                   A2 = arr1[2];
                   A3 = arr1[1];
                   A4 = arr1[0];
                   
                   delay_ms(10); 
                   for (b = a%3 ; b < 16 ; b = b+3){
                         i1= b ;
                        for (i2=0; i2 < 4; i2++){//0011
                             arr2[i2] =   i1%2;
                             i1 = i1/2;
                        }
                        
                        delay_ms(10);
                        i1 = arr2[0];
                        arr2[0] = arr2[3];
                        arr2[3] = i1;
                        
                        delay_ms(10);
                        i1 = arr2[1];
                        arr2[1] = arr2[2];
                        arr2[2] = i1;
                        
                        delay_ms(10);
                        B1 = arr2[3];
                        B2 = arr2[2];
                        B3 = arr2[1];
                        B4 = arr2[0];
                        
                        delay_ms(10);
                        
                        temp = a + b + CI;
                        
                        for (i2=0; i2 < 5; i2++){
                             arr3[i2] =   temp%2;
                             temp = temp/2;
                        }
                        
                        delay_ms(10);
                        i1 = arr3[0];
                        arr3[0] = arr3[4];
                        arr3[4] = i1;
                        
                        delay_ms(10);
                        i1 = arr3[1];
                        arr3[1] = arr3[3];
                        arr3[3] = i1;
                        
                        delay_ms(10);
                        if(S1 == arr3[4] && S2 == arr3[3] && S3==arr3[2] && S4==arr3[1]){
                            LED_GREEN = ON;
                            delay_ms(50);
                            LED_GREEN = OFF;
                            test = ON;
                        }
                        else if(S1!=arr3[4] || S2!=arr3[3] || S3!=arr3[2] || S4!=arr3[1]) {
                            LED_RED = ON;
                            delay_ms(50);
                            LED_RED = OFF;
                            test = OFF;
                            //break;
                        }
                   }           
                   
               } 
           }          
           flag = 0;

      }
      else if( flag == 0){
      
        if(test == 1){
              LED_RED = OFF;
              LED_GREEN = ON;
        }
        else if(test == 0){
            LED_GREEN = OFF;
            LED_RED = ON;
        }
      }
}
}
