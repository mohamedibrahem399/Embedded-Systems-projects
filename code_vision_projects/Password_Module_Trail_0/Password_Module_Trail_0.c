/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : Password_Module_Trail_0
Version : 0
Date    : 11/15/2021
Author  : Mohamed Ibrahem
Company : Home
Comments: 
NO COMMENT


Chip type               : ATmega32A
Program type            : Application
AVR Core Clock frequency: 11.059200 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 512
*******************************************************/

#include <mega32a.h>

#include <delay.h>
#define LED_GREEN PORTB.0
#define LED_RED   PORTB.1

#define BUTTON1 PINA.0
//#define BUTTON2 PINA.1
#define BUTTON3 PINA.2

#define ON  1
#define OFF 0

char counter1 = 0;
char password_count = 2;
char password [password_count]  = {1,0} ;
char entered [password_count]   = {0,0} ;
char test=1;
char temp=0;
char timer1=0;

void main(void)
{

DDRB    = 0xff ;
PORTB   = 0x00 ;

DDRA    = 0xf0 ;
PORTA   = 0x00 ;
PORTA.0 = 1    ;
PORTA.1 = 1    ;
PORTA.2 = 1    ;


while (1)
      {
      if(counter1 == password_count){
              while(temp<password_count){
                   if(entered[temp] ==  password[temp]){
                      test =1;
                     }
                   else if ( entered[temp] !=  password[temp]){
                      test =0;
                      break;
                    }
                   temp++;
                  }
              temp=0;
              if( test == 1 ){
                    LED_GREEN = ON;
                    delay_ms(200);
                    LED_GREEN = OFF;
                    counter1=0;           
                    }
              else if (test == 0){
                    LED_RED = ON;
                    delay_ms(200);
                    LED_RED = OFF;
                    counter1=0;
                    test = 1;           
                    }
                }
      else if( BUTTON1 == 1){
        //delay_ms(200);
        while (BUTTON1 == 1){
              delay_ms(150);
              timer1++;    
            }
        if( timer1<= 7){
                entered[counter1] = 0;
                counter1++;
                LED_RED   = ON;
                delay_ms(200);
                LED_RED   = OFF;
                LED_GREEN   = ON;
                delay_ms(200);
                LED_GREEN   = OFF;     
              }
        else if(timer1 > 7){
                entered[counter1] = 1;
                counter1++;
                LED_GREEN   = ON;
                delay_ms(200);
                LED_GREEN   = OFF;
                LED_RED   = ON;
                delay_ms(200);
                LED_RED   = OFF;
                    
              }
        timer1=0;
        }
        
      /*
      else if( BUTTON2 == 1){
        delay_ms(20);
       entered[counter1] = 0;
        counter1++;
        }*/
      
      else if( BUTTON3 == 1){
            password_count=0;
            LED_GREEN= ON;
            LED_RED  = ON;
            timer1=0;
            while (BUTTON3 == 1){
            delay_ms(20);
                   if( BUTTON1 == 1){
                        while (BUTTON1 == 1){
                        delay_ms(200);
                        timer1++;    
                            }
                        if( timer1<= 7){
                            LED_RED   = OFF;
                            delay_ms(200);
                            LED_RED   = ON;
                            password [password_count] = 0 ;
                            entered  [password_count] = 0 ;
                            password_count++;          
                                }
                        else if(timer1 > 7){
                            LED_RED   = OFF;
                            delay_ms(200);
                            LED_RED   = ON;                        
                            password [password_count] = 1 ;
                            entered  [password_count] = 0 ;
                            password_count++;   
                               }
                        timer1=0;
                        }
                   if(BUTTON3 == 0){
                   delay_ms(200);
                    if(BUTTON3 == 0){
                        break;}
                   }
            }
            counter1=0;
            LED_RED   = OFF;
            LED_GREEN= OFF;

        } 
      else{
        LED_GREEN = OFF;
        LED_RED   = OFF;
        }
        
      }
}