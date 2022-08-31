#include <mega32a.h>
#include <delay.h>
#include <stdlib.h>
#include <stdio.h>

#define F_CPU 11059200UL        /* Define frequency here its 8MHz */
#define USART_BAUDRATE 9600
#define BAUD_PRESCALE 24   //(((F_CPU / (USART_BAUDRATE * 16UL))) - 1)    

#define LED PORTD.3

#define ON  1
#define OFF 0


void UART_init()
{
    UCSRB |= (1 << RXEN) | (1 << TXEN);    /* Turn on transmission and reception */
    UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1);/* Use 8-bit char size */
    UBRRL = BAUD_PRESCALE;            /* Load lower 8-bits of the baud rate */
    UBRRH = (BAUD_PRESCALE >> 8);        /* Load upper 8-bits*/
}

unsigned char UART_RxChar()
{
    while ((UCSRA & (1 << RXC)) == 0);/* Wait till data is received */
    return(UDR);            /* Return the byte*/
}

void UART_TxChar(char ch)
{
    while (! (UCSRA & (1<<UDRE)));    /* Wait for empty transmit buffer*/
    UDR = ch ;
}

void UART_SendString(char *str)
{
    unsigned char j=0;
    
    while (str[j]!=0)        /* Send string till null */
    {
        UART_TxChar(str[j]);    
        j++;
    }
}

void main()
{
    char c[2];
    UART_init();
    DDRD = 0xff;
    PORTD = 0x00;
       LED = ON;
    delay_ms(1000);
    LED = OFF;
    UART_SendString("a");
    UART_TxChar('b');    
    while(1)
    {   
        UART_init();
        c[0] = UART_RxChar();
        UART_TxChar(c[0]);
        
        if(c[0]== '1'){
          LED = ON;        
        }
        else if(c[0]== '2'){
          LED = OFF;        
        }
        else if(c[0]== 'a'){
          LED = ON;
          delay_ms(100);
          LED = OFF;        
        }
        
        UART_init();
        UART_SendString("4");
        UART_init();
        puts("5");
        
        //UART_SendString("0");
        //UART_SendString("0");
        //UART_SendString("7");
        //UART_SendString(c);
        //UART_SendString("\r \n");
        //delay_ms(1000);

    }    
}