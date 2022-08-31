///////////////////////////////////////////////////
//////////////// author : mohamed gad ////////////
///////////////  SWC    : UART        ////////////
///////////////  date   : 12/11/2021 ////////////
////////////////////////////////////////////////

#include "STD_TYPES.h"
#include "BITMATH.h"

#include "UART_interface.h"
#include "UART_private.h"
#include "UART_config.h"


void UART_voidInit(void)
{
	u8 Local_u8UCSRCTemp = 0b10000000 ;
	u16 Local_u16UBRRvalue = 51;
	//enable RX
	SET_BIT(UART_u8_UCSRB_REG , 4);
	//enable TX
	SET_BIT(UART_u8_UCSRB_REG , 3);
	///////////////////////////////////////////////////
	 // select asynch mode
	CLR_BIT(Local_u8UCSRCTemp ,6);
	// select odd parity bit
	CLR_BIT(Local_u8UCSRCTemp , 5);
	CLR_BIT(Local_u8UCSRCTemp , 4);
	// 2 stop bits
	SET_BIT(Local_u8UCSRCTemp , 3);
	// character size = 8 bits
	CLR_BIT(UART_u8_UCSRB_REG , 2);
	SET_BIT(Local_u8UCSRCTemp , 2);
	SET_BIT(Local_u8UCSRCTemp , 1);
	// UPDATE UCSRC
	UART_u8_UCSRC_REG = Local_u8UCSRCTemp;
	// setting baud rate
	UART_u8_UBRRL_REG = (u8)Local_u16UBRRvalue ;
	UART_u8_UBRRH_REG = (u8)(Local_u16UBRRvalue>>8) ;

}

void UART_voidSendByte(u8 Copy_u8ByteSent)
{
// wait the flag for buffer is empty
	while(!GET_BIT(UART_u8_UCSRA_REG,5));
	// write data on tx buffer
	UART_u8_UDR_REG = Copy_u8ByteSent;


}
void  UART_u8RecByte(u8 *Copy_u8Rec)
{
// wait for the flag unread recieved data
	while(!GET_BIT(UART_u8_UCSRA_REG,7));
	*Copy_u8Rec = UART_u8_UDR_REG ;


}

