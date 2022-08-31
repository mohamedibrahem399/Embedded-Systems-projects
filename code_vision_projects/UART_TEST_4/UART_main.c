/*
 * UART_main.c
 *
 *  Created on: Nov 13, 2021
 *      Author: moham
 */


#define CPU_F 8000000UL
#include <avr/delay.h>

#include "STD_TYPES.h"
#include "BITMATH.h"

#include "DIO_interface.h"
#include "UART_interface.h"


int main()
{
u8 local_u8Butt;
DIO_u8INIT();
UART_voidInit();

while (1)
{
	//local_u8Butt = UART_u8RecByte();
	UART_u8RecByte(&local_u8Butt);

	if (local_u8Butt == 'a')
	{
		DIO_u8SetPinValue(DIO_u8_PORTC , DIO_u8_PIN7 ,DIO_u8_HIGH);
		DIO_u8SetPinValue(DIO_u8_PORTC , DIO_u8_PIN6 ,DIO_u8_LOW);
	}
	else if (local_u8Butt == 'b')
	{
		DIO_u8SetPinValue(DIO_u8_PORTC , DIO_u8_PIN7 ,DIO_u8_LOW);
		DIO_u8SetPinValue(DIO_u8_PORTC , DIO_u8_PIN6 ,DIO_u8_HIGH);
	}

}



	return 0;
}

