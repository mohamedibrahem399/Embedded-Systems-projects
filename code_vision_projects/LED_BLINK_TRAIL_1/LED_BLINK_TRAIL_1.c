/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : LED_BLINK_TRAIL_1
Version : 1
Date    : 11/14/2021
Author  : Mohamed Ibrahem
Company : Engineer
Comments: 


Chip type               : ATmega32
Program type            : Application
AVR Core Clock frequency: 11.059200 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 512
*******************************************************/
#include <mega32a.h>
#include <delay.h>

#define LED PORTA.0

#define ON  1
#define OFF 0


void main(void)
{
DDRA  = 0xff ;
PORTA = 0x00 ;

while (1)
      {
      LED = ON;
      delay_ms(1000);
      LED = OFF;
      delay_ms(1000);
      }
}
