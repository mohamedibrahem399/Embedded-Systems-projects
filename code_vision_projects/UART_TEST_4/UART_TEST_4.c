#include <mega32a.h>
#include <delay.h>

#define CPU_F 11059200UL

#include "STD_TYPES.h"
#include "BITMATH.h"

#include "DIO_interface.h"
#include "UART_interface.h"

#define LED PORTB.0

#define ON  1
#define OFF 0


void main()
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


}

