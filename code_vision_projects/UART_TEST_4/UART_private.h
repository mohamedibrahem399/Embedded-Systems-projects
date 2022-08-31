///////////////////////////////////////////////////
//////////////// author : mohamed gad ////////////
///////////////  SWC    : UART        ////////////
///////////////  date   : 12/11/2021 ////////////
////////////////////////////////////////////////



#define UART_u8_UBRRH_REG     *((volatile u8 *)0x40)
#define UART_u8_UBRRL_REG     *((volatile u8 *)0x29)

#define UART_u8_UCSRC_REG     *((volatile u8 *)0x40)

#define UART_u8_UCSRA_REG     *((volatile u8 *)0x2B)
#define UART_u8_UCSRB_REG     *((volatile u8 *)0x2A)

#define UART_u8_UDR_REG       *((volatile u8 *)0x2C)



