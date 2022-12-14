/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
? Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : Button_led_control
Version : 1
Date    : 11/21/2021
Author  : Mohamed Ibrahem
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

#define BUTTON PINA.4
#define LED PORTA.0

#define ON  1
#define OFF 0


void main(void)
{
DDRA = 0x0f;
PORTA= 0x00;
PORTA.4 = 1;


while (1)
      {
      if (BUTTON == 1){
      LED = ON;
      delay_ms(50);
      LED= OFF;
      delay_ms(50);
      
      LED = ON;
      delay_ms(50);
      LED= OFF;
      delay_ms(50);
      
      LED = ON;
      delay_ms(50);
      LED= OFF;
      delay_ms(50);
      
      }
      else {
      LED = OFF;
      }

      }
}
