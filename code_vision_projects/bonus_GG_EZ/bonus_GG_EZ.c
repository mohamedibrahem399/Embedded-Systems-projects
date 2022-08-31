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

char ctr_10=0;
char counter1 = 0;
char password_count = 6;
char password [password_count]  = {1,1,1,0,0,0} ;
char entered [password_count]   = {0,0,0,0,0,0} ;

//char new_pasword [password_count]   = {0,0,0,0,0,0} ;

char test=1;
char temp=0;

char i=0;

#define SET_BIT(VAR,BIT) VAR |= (1<<BIT)
#define CLR_BIT(VAR,BIT) VAR &= (~(1<<BIT))
#define TOG_BIT(VAR,BIT) VAR ^= (1<<BIT)
#define GET_BIT(VAR,BIT) ((VAR>>BIT)&1)


void EEPRom_Write(short address , char data){
    EEARL = (char) address;
    EEARH = (char) address >> 8;
    EEDR = data;
    SET_BIT (EECR , EEMWE);
    SET_BIT (EECR , EEWE);
    while (GET_BIT(EECR,EEWE) == 1);
}

char EEPROM_READ ( short address){
    EEARL = (char) address;
    EEARH = (char) address >> 8;
    SET_BIT(EECR,EERE);
    return EEDR;
} 


void main(void)
{

DDRB    = 0xff ;
PORTB   = 0x00 ;

DDRA    = 0xf0 ;
PORTA   = 0x00 ;
PORTA.0 = 1    ;
PORTA.1 = 1    ;
PORTA.2 = 1    ;

if( EEPROM_READ(80) != 0xff ){
    password_count = EEPROM_READ(80);
    delay_ms(100);
    
for(i= 0 ; i< password_count  ;i++){
    if( EEPROM_READ(i + i  * 8 ) != 0xff ){                    
    password [i] =   EEPROM_READ(i + i  * 8 );
    entered  [i] = 0;
    delay_ms(100);
    }
  } 
}

while (1)
      {
      if(counter1 == password_count){
              if (password_count == 0){
                    password_count = 6;
                    EEPRom_Write( 80  , password_count );
                    for(i=0;i<password_count;i++){ 
                    EEPRom_Write( i + i  * 8  , password[i] );
                    password [i]  = 1;
                    delay_ms(100);                    
                    }
              }
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
              LED_GREEN = ON;
              LED_RED = ON; 
              delay_ms(200);
              LED_GREEN = OFF;
              LED_RED = OFF;
                    
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
      else if( BUTTON1 == 1)
      {
      while(BUTTON1==1)
      {
        ctr_10++ ;
        delay_ms(30); 
      }              
      if (ctr_10 <20){
        entered[counter1] = 0;
        LED_RED = ON ;
        delay_ms(100);
        LED_RED=OFF ; 
        LED_GREEN= ON ;
        counter1++;
        delay_ms(100);      
        LED_GREEN= OFF ;    
        }  
      else if (ctr_10 >=20)
        {
        entered[counter1] = 1;
        LED_GREEN= ON ;
        delay_ms(100);
        LED_RED=ON ; 
        LED_GREEN= OFF ;
        counter1++;
        delay_ms(100);
        LED_RED = OFF ;
        }
         ctr_10=0;    
      }
      else if( BUTTON3 == 1){
            password_count=0;
            LED_GREEN= ON;
            LED_RED  = ON;
            while (BUTTON3 == 1){
            
                    if( BUTTON1 == 1)
                    {
                        while(BUTTON1==1)
                        {
                            ctr_10++ ;
                            delay_ms(30); 
                        }              
                        if (ctr_10 <20){
                            LED_RED   = OFF;
                            delay_ms(200);
                            LED_RED   = ON;
                            password [password_count] = 0 ;
                            entered  [password_count] = 0 ;
                            password_count++;      
                        }  
                        else if (ctr_10 >=20)
                        {
                            LED_RED   = OFF;
                            delay_ms(200);
                            LED_RED   = ON;
                            password [password_count] = 1 ;
                            entered  [password_count] = 0 ;
                            password_count++;
                        }
                        ctr_10=0;    
                    }
                   if(BUTTON3 == 0){
                   delay_ms(200);
                    if(BUTTON3 == 0){
                        break;}
                   }
            }
            EEPRom_Write( 80 , password_count );
            LED_GREEN= OFF;
            delay_ms(150);
            LED_GREEN= ON;
            for(i=0 ; i < password_count ; i++){   
                EEPRom_Write( i + i  * 8  , password[i] );
                LED_GREEN= OFF;
                LED_RED  = OFF;
                delay_ms(150);
                LED_GREEN= ON;
                LED_RED  = ON;
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