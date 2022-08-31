/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator

Project : LED_CONTROL_WITH_BUTTON
Version : 1
Date    : 11/15/2021
Author  : Mohamed Ibrahem
Company : Home
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
#define LED PORTA.0
#define BUTTON PINA.4
#define ON  1
#define OFF 0

void main(void)
{
DDRA    = 0x0f ;
PORTA   = 0x00 ;
PORTA.4 = 1    ;

while (1)
      {
      if( BUTTON == 1){ 
        LED = ON;
        delay_ms(50);
        LED = OFF;
        delay_ms(50);
        LED = ON;
        delay_ms(50);
        LED = OFF;
        delay_ms(50);
        LED = ON;
        delay_ms(50);
        LED = OFF;
        delay_ms(50);
        }
      else{
        LED = OFF;
        }
      }
}
