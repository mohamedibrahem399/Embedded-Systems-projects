
;CodeVisionAVR C Compiler V3.14 Advanced
;(C) Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Build configuration    : Debug
;Chip type              : ATmega32A
;Program type           : Application
;Clock frequency        : 11.059200 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External RAM size      : 0
;Data Stack size        : 512 byte(s)
;Heap size              : 0 byte(s)
;Promote 'char' to 'int': Yes
;'char' is unsigned     : Yes
;8 bit enums            : Yes
;Global 'const' stored in FLASH: Yes
;Enhanced function parameter passing: Yes
;Enhanced core instructions: On
;Automatic register allocation for global variables: On
;Smart register allocation: On

	#define _MODEL_SMALL_

	#pragma AVRPART ADMIN PART_NAME ATmega32A
	#pragma AVRPART MEMORY PROG_FLASH 32768
	#pragma AVRPART MEMORY EEPROM 1024
	#pragma AVRPART MEMORY INT_SRAM SIZE 2048
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x085F
	.EQU __DSTACK_SIZE=0x0200
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	PUSH R26
	PUSH R27
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	POP  R27
	POP  R26
	ICALL
	.ENDM

	.MACRO __CALL2EX
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	CALL __EEPROMRDD
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1STACK
	IN   R30,SPL
	IN   R31,SPH
	ADIW R30,@0+1
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z
	MOVW R30,R0
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _test=R5
	.DEF _flag=R4
	.DEF _counter=R7

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_tbl10_G100:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G100:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x1,0x1,0x0,0x0

_0x0:
	.DB  0x34,0x30,0x30,0x36,0x0,0x66,0x75,0x63
	.DB  0x6B,0x0

__GLOBAL_INI_TBL:
	.DW  0x04
	.DW  0x04
	.DW  __REG_VARS*2

	.DW  0x05
	.DW  _0x61
	.DW  _0x0*2

	.DW  0x05
	.DW  _0x61+5
	.DW  _0x0*2+5

_0xFFFFFFFF:
	.DW  0

#define __GLOBAL_INI_TBL_PRESENT 1

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  MCUCR,R31
	OUT  MCUCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x260

	.CSEG
;/*******************************************************
;This program was created by the
;CodeWizardAVR V3.14 Advanced
;Automatic Program Generator
;� Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project : TEST_IC_CD4002
;Version :
;Date    : 12/27/2021
;Author  :
;Company :
;Comments:
;
;
;Chip type               : ATmega32A
;Program type            : Application
;AVR Core Clock frequency: 11.059200 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 512
;*******************************************************/
;
;#include <mega32a.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <delay.h>
;#include <stdio.h>
;
; // PINS USED WITH THIS IC :- A0 - A4 & C5- C1
; // C6 & C0 & A6 - A5 NOT USED
;
; // NUMBER OF PINS = 14
; //CONNECTION
;                  //PINS IN THE CD4002 IC    // IN OR OUT
; #define D1    PORTA.0   //PIN 1                    //  IN D1
;             //PORTA.1  //PIN 2                    //  NOT USED
; #define CLK   PORTA.2  //PIN 3                    //  CLK
; #define D2    PORTA.3  //PIN 4                    //  IN D2
; #define D3    PORTA.4  //PIN 5                    //  IN D3
; #define D4    PORTA.5  //PIN 6                    //  IN D4
;            // PORTA.6  //PIN 7                    //  GND
; #define D4_P4 PINC.6   //PIN 8                    //  OUT D4+4
; #define D4_P5 PINC.5   //PIN 9                    //  OUT D4+5
; #define D3_P4 PINC.4   //PIN 10                   //  OUT D3+4
; #define D2_P4 PINC.3   //PIN 11                   //  OUT D2+4
; #define D2_P5 PINC.2   //PIN 12                   //  OUT D2+5
; #define D1_P4 PINC.1   //PIN 13                   //  OUT D1+4
;            //PORTC.0   //PIN 14                   //  VCC
;
;
; //INPUT  PORTS IN OUR IC :- C6-C1        //DDR  = 0 // PORT.0 =   1
; //OUTPUT PORTS IN OUR IC :- A6-A1        //DDR  = 1 // PORT.1 =   0
;
; #define ON  1
; #define OFF 0
;
; #define LED_GREEN PORTD.3
; #define LED_RED PORTD.2
;
;
; char test = 1;
; char flag = 1;
; char counter =0;
;
;
;void main(void)
; 0000 0042 {

	.CSEG
_main:
; .FSTART _main
; 0000 0043     DDRA    = 0xff ; // 1111 1110
	LDI  R30,LOW(255)
	OUT  0x1A,R30
; 0000 0044     PORTA   = 0x00 ; // 0000 0001
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 0045 
; 0000 0046     DDRC    = 0x00 ; // 1111 1101
	OUT  0x14,R30
; 0000 0047     PORTC   = 0xff ; // 0000 0010
	LDI  R30,LOW(255)
	OUT  0x15,R30
; 0000 0048 
; 0000 0049     DDRD    = 0xff ;
	OUT  0x11,R30
; 0000 004A     PORTD   = 0x00 ;
	LDI  R30,LOW(0)
	OUT  0x12,R30
; 0000 004B     PORTA.6=OFF;
	CBI  0x1B,6
; 0000 004C     CLK =   ON;
	SBI  0x1B,2
; 0000 004D 
; 0000 004E     /*uart config*/
; 0000 004F     UCSRA = (0<<RXC)|(0<<TXC)|(0<<UDRE)|(0<<FE)|(0<<DOR)|(0<<UPE)|(0<<U2X)|(0<<MPCM);
	OUT  0xB,R30
; 0000 0050     UCSRB = (0<<RXCIE)|(0<<TXCIE)|(0<<UDRIE)|(1<<RXEN)|(1<<TXEN)|(0<<UCSZ2)|(0<<RXB8)|(0<<TXB8);
	LDI  R30,LOW(24)
	OUT  0xA,R30
; 0000 0051     UCSRC = (1<<URSEL)|(0<<UMSEL)|(0<<UPM1)|(0<<UPM0)|(0<<USBS)|(1<<UCSZ1)|(1<<UCSZ0)|(0<<UCPOL);
	LDI  R30,LOW(134)
	OUT  0x20,R30
; 0000 0052     UBRRH=0x00;
	LDI  R30,LOW(0)
	OUT  0x20,R30
; 0000 0053     UBRRL=0x33;
	LDI  R30,LOW(51)
	OUT  0x9,R30
; 0000 0054 
; 0000 0055 
; 0000 0056 
; 0000 0057 
; 0000 0058 
; 0000 0059 while (1)
_0x7:
; 0000 005A       {
; 0000 005B       if  (flag == 1){
	LDI  R30,LOW(1)
	CP   R30,R4
	BREQ PC+2
	RJMP _0xA
; 0000 005C 
; 0000 005D         counter = 0;
	CLR  R7
; 0000 005E             while (counter < 4 ){
_0xB:
	LDI  R30,LOW(4)
	CP   R7,R30
	BRSH _0xD
; 0000 005F                 D1 = counter%2 && 0x01 ; // 1 1 1 1
	MOV  R26,R7
	CLR  R27
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	CALL __MODW21
	SBIW R30,0
	BREQ _0xE
	LDI  R30,LOW(1)
	CPI  R30,0
	BREQ _0xE
	LDI  R30,1
	RJMP _0xF
_0xE:
	LDI  R30,0
_0xF:
	CPI  R30,0
	BRNE _0x10
	CBI  0x1B,0
	RJMP _0x11
_0x10:
	SBI  0x1B,0
_0x11:
; 0000 0060                 D2 = (!D1 & 0x01);       // 1 0 1 0
	LDI  R26,0
	SBIS 0x1B,0
	LDI  R26,1
	LDI  R30,LOW(1)
	AND  R30,R26
	BRNE _0x12
	CBI  0x1B,3
	RJMP _0x13
_0x12:
	SBI  0x1B,3
_0x13:
; 0000 0061                 D3 = ON;                 // 1 1 1 1
	SBI  0x1B,4
; 0000 0062                 D4 = OFF ;               // 0 0 0 0
	CBI  0x1B,5
; 0000 0063 
; 0000 0064                 delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0065                 CLK = OFF ;
	CBI  0x1B,2
; 0000 0066                 delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0067                 CLK = ON;
	SBI  0x1B,2
; 0000 0068                 delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0069                 counter++;
	INC  R7
; 0000 006A             }
	RJMP _0xB
_0xD:
; 0000 006B             counter = 0;
	CLR  R7
; 0000 006C             while (counter < 4 ){
_0x1C:
	LDI  R30,LOW(4)
	CP   R7,R30
	BRLO PC+2
	RJMP _0x1E
; 0000 006D 
; 0000 006E                if(counter ==  0){
	TST  R7
	BRNE _0x1F
; 0000 006F                 if( D1_P4 == 1 && D2_P4 ==0  && D3_P4 == 0 && D4_P4 == 0 ){
	SBIS 0x13,1
	RJMP _0x21
	SBIC 0x13,3
	RJMP _0x21
	SBIC 0x13,4
	RJMP _0x21
	SBIS 0x13,6
	RJMP _0x22
_0x21:
	RJMP _0x20
_0x22:
; 0000 0070                    LED_GREEN = ON;
	SBI  0x12,3
; 0000 0071                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0072                    LED_GREEN = OFF;
	CBI  0x12,3
; 0000 0073                    test = ON;
	LDI  R30,LOW(1)
	MOV  R5,R30
; 0000 0074                 }
; 0000 0075                 else {
	RJMP _0x27
_0x20:
; 0000 0076                    LED_RED = ON;
	SBI  0x12,2
; 0000 0077                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0078                    LED_RED = OFF;
	CBI  0x12,2
; 0000 0079                    test = OFF;
	CLR  R5
; 0000 007A                    //break;
; 0000 007B                 }
_0x27:
; 0000 007C                }
; 0000 007D 
; 0000 007E                else if (counter == 1){
	RJMP _0x2C
_0x1F:
	LDI  R30,LOW(1)
	CP   R30,R7
	BRNE _0x2D
; 0000 007F                  if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 0 && D4_P4 == 0 ){
	SBIS 0x13,1
	RJMP _0x2F
	SBIC 0x13,3
	RJMP _0x2F
	SBIC 0x13,4
	RJMP _0x2F
	SBIS 0x13,6
	RJMP _0x30
_0x2F:
	RJMP _0x2E
_0x30:
; 0000 0080                    LED_GREEN = ON;
	SBI  0x12,3
; 0000 0081                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0082                    LED_GREEN = OFF;
	CBI  0x12,3
; 0000 0083                    test = ON;
	LDI  R30,LOW(1)
	MOV  R5,R30
; 0000 0084                 }
; 0000 0085                 else {
	RJMP _0x35
_0x2E:
; 0000 0086                    LED_RED = ON;
	SBI  0x12,2
; 0000 0087                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0088                    LED_RED = OFF;
	CBI  0x12,2
; 0000 0089                    test = OFF;
	CLR  R5
; 0000 008A                    //break;
; 0000 008B                 }
_0x35:
; 0000 008C                }
; 0000 008D 
; 0000 008E                else if (counter == 2){
	RJMP _0x3A
_0x2D:
	LDI  R30,LOW(2)
	CP   R30,R7
	BRNE _0x3B
; 0000 008F                  if( D1_P4 == 0  && D2_P4 == 0 && D3_P4 == 0 && D4_P4 == 0  ){
	SBIC 0x13,1
	RJMP _0x3D
	SBIC 0x13,3
	RJMP _0x3D
	SBIC 0x13,4
	RJMP _0x3D
	SBIS 0x13,6
	RJMP _0x3E
_0x3D:
	RJMP _0x3C
_0x3E:
; 0000 0090                    LED_GREEN = ON;
	SBI  0x12,3
; 0000 0091                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0092                    LED_GREEN = OFF;
	CBI  0x12,3
; 0000 0093                    test = ON;
	LDI  R30,LOW(1)
	MOV  R5,R30
; 0000 0094                 }
; 0000 0095                 else {
	RJMP _0x43
_0x3C:
; 0000 0096                    LED_RED = ON;
	SBI  0x12,2
; 0000 0097                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 0098                    LED_RED = OFF;
	CBI  0x12,2
; 0000 0099                    test = OFF;
	CLR  R5
; 0000 009A                    //break;
; 0000 009B                 }
_0x43:
; 0000 009C                }
; 0000 009D                else if (counter == 3){
	RJMP _0x48
_0x3B:
	LDI  R30,LOW(3)
	CP   R30,R7
	BRNE _0x49
; 0000 009E                  if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 0 && D4_P4 == 0 ){
	SBIS 0x13,1
	RJMP _0x4B
	SBIC 0x13,3
	RJMP _0x4B
	SBIC 0x13,4
	RJMP _0x4B
	SBIS 0x13,6
	RJMP _0x4C
_0x4B:
	RJMP _0x4A
_0x4C:
; 0000 009F                    LED_GREEN = ON;
	SBI  0x12,3
; 0000 00A0                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 00A1                    LED_GREEN = OFF;
	CBI  0x12,3
; 0000 00A2                    test = ON;
	LDI  R30,LOW(1)
	MOV  R5,R30
; 0000 00A3                 }
; 0000 00A4                 else {
	RJMP _0x51
_0x4A:
; 0000 00A5                    LED_RED = ON;
	SBI  0x12,2
; 0000 00A6                    delay_ms(100);
	CALL SUBOPT_0x0
; 0000 00A7                    LED_RED = OFF;
	CBI  0x12,2
; 0000 00A8                    test = OFF;
	CLR  R5
; 0000 00A9                    //break;
; 0000 00AA                 }
_0x51:
; 0000 00AB                }
; 0000 00AC                delay_ms(100);
_0x49:
_0x48:
_0x3A:
_0x2C:
	CALL SUBOPT_0x0
; 0000 00AD                CLK = OFF;
	CBI  0x1B,2
; 0000 00AE                delay_ms(100);
	CALL SUBOPT_0x0
; 0000 00AF                CLK = ON;
	SBI  0x1B,2
; 0000 00B0                counter ++;
	INC  R7
; 0000 00B1                delay_ms(100);
	CALL SUBOPT_0x0
; 0000 00B2             }
	RJMP _0x1C
_0x1E:
; 0000 00B3            flag = 0;
	CLR  R4
; 0000 00B4 
; 0000 00B5       }
; 0000 00B6       else if( flag == 0){
	RJMP _0x5A
_0xA:
	TST  R4
	BRNE _0x5B
; 0000 00B7 
; 0000 00B8         if(test == 1){
	LDI  R30,LOW(1)
	CP   R30,R5
	BRNE _0x5C
; 0000 00B9               LED_RED = OFF;
	CBI  0x12,2
; 0000 00BA               LED_GREEN = ON;
	SBI  0x12,3
; 0000 00BB               puts("4006");
	__POINTW2MN _0x61,0
	RJMP _0x69
; 0000 00BC         }
; 0000 00BD         else if(test == 0){
_0x5C:
	TST  R5
	BRNE _0x63
; 0000 00BE             LED_GREEN = OFF;
	CBI  0x12,3
; 0000 00BF             LED_RED = ON;
	SBI  0x12,2
; 0000 00C0             puts("fuck");
	__POINTW2MN _0x61,5
_0x69:
	CALL _puts
; 0000 00C1         }
; 0000 00C2       }
_0x63:
; 0000 00C3 }
_0x5B:
_0x5A:
	RJMP _0x7
; 0000 00C4 }
_0x68:
	RJMP _0x68
; .FEND

	.DSEG
_0x61:
	.BYTE 0xA
;
;
;
;
;
;/*
;
;void main(void)
;{
;    DDRA    = 0xff ; // 1111 1110
;    PORTA   = 0x00 ; // 0000 0001
;
;    DDRC    = 0x00 ; // 1111 1101
;    PORTC   = 0xff ; // 0000 0010
;
;    DDRD    = 0xff ;
;    PORTD   = 0x00 ;
;    CLK =   ON;
;
;while (1)
;      {
;      if  (flag == 1){
;
;        counter = 0;
;            while (counter < 4 ){
;                D1 = counter%2 && 0x01 ; // 0 1 0 1
;                D2 = (!D1 & 0x01);       // 1 0 1 0
;                D3 = ON;                 // 1 1 1 1
;                D4 = OFF ;               // 0 0 0 0
;
;                delay_ms(100);
;                CLK = OFF ;
;                delay_ms(100);
;                CLK = ON;
;                delay_ms(100);
;                counter++;
;            }
;            counter = 0;
;            while (counter < 4 ){
;
;               if(counter ==  0){
;                if( D1_P4 == 0 && D2_P4 == 1 && D3_P4 == 1 && D4_P4 == 0 ){
;                   LED_GREEN = ON;
;                   delay_ms(100);
;                   LED_GREEN = OFF;
;                   test = ON;
;                }
;                else {
;                   LED_RED = ON;
;                   delay_ms(100);
;                   LED_RED = OFF;
;                   test = OFF;
;                   //break;
;                }
;               }
;
;               else if (counter == 1){
;                 if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 1 && D4_P4 == 0 ){
;                   LED_GREEN = ON;
;                   delay_ms(100);
;                   LED_GREEN = OFF;
;                   test = ON;
;                }
;                else {
;                   LED_RED = ON;
;                   delay_ms(100);
;                   LED_RED = OFF;
;                   test = OFF;
;                   //break;
;                }
;               }
;
;               else if (counter == 2){
;                 if( D1_P4 == 0 && D2_P4 == 1 && D3_P4 == 1 && D4_P4 == 0 ){
;                   LED_GREEN = ON;
;                   delay_ms(100);
;                   LED_GREEN = OFF;
;                   test = ON;
;                }
;                else {
;                   LED_RED = ON;
;                   delay_ms(100);
;                   LED_RED = OFF;
;                   test = OFF;
;                   //break;
;                }
;               }
;               else if (counter == 3){
;                 if( D1_P4 == 1  && D2_P4 == 0 && D3_P4 == 1 && D4_P4 == 0){
;                   LED_GREEN = ON;
;                   delay_ms(100);
;                   LED_GREEN = OFF;
;                   test = ON;
;                }
;                else {
;                   LED_RED = ON;
;                   delay_ms(100);
;                   LED_RED = OFF;
;                   test = OFF;
;                   //break;
;                }
;               }
;               delay_ms(100);
;               CLK = OFF;
;               delay_ms(100);
;               CLK = ON;
;               counter ++;
;               delay_ms(100);
;            }
;           flag = 0;
;
;      }
;      else if( flag == 0){
;
;        if(test == 1){
;              LED_RED = OFF;
;              LED_GREEN = ON;
;        }
;        else if(test == 0){
;            LED_GREEN = OFF;
;            LED_RED = ON;
;        }
;      }
;}
;}
; */
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG
_putchar:
; .FSTART _putchar
	ST   -Y,R26
putchar0:
     sbis usr,udre
     rjmp putchar0
     ld   r30,y
     out  udr,r30
	ADIW R28,1
	RET
; .FEND
_puts:
; .FSTART _puts
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
_0x2000003:
	LDD  R26,Y+1
	LDD  R27,Y+1+1
	LD   R30,X+
	STD  Y+1,R26
	STD  Y+1+1,R27
	MOV  R17,R30
	CPI  R30,0
	BREQ _0x2000005
	MOV  R26,R17
	RCALL _putchar
	RJMP _0x2000003
_0x2000005:
	LDI  R26,LOW(10)
	RCALL _putchar
	LDD  R17,Y+0
	ADIW R28,3
	RET
; .FEND

	.CSEG

	.CSEG

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 14 TIMES, CODE SIZE REDUCTION:23 WORDS
SUBOPT_0x0:
	LDI  R26,LOW(100)
	LDI  R27,0
	JMP  _delay_ms


	.CSEG
_delay_ms:
	adiw r26,0
	breq __delay_ms1
__delay_ms0:
	wdr
	__DELAY_USW 0xACD
	sbiw r26,1
	brne __delay_ms0
__delay_ms1:
	ret

__ANEGW1:
	NEG  R31
	NEG  R30
	SBCI R31,0
	RET

__DIVW21U:
	CLR  R0
	CLR  R1
	LDI  R25,16
__DIVW21U1:
	LSL  R26
	ROL  R27
	ROL  R0
	ROL  R1
	SUB  R0,R30
	SBC  R1,R31
	BRCC __DIVW21U2
	ADD  R0,R30
	ADC  R1,R31
	RJMP __DIVW21U3
__DIVW21U2:
	SBR  R26,1
__DIVW21U3:
	DEC  R25
	BRNE __DIVW21U1
	MOVW R30,R26
	MOVW R26,R0
	RET

__MODW21:
	CLT
	SBRS R27,7
	RJMP __MODW211
	COM  R26
	COM  R27
	ADIW R26,1
	SET
__MODW211:
	SBRC R31,7
	RCALL __ANEGW1
	RCALL __DIVW21U
	MOVW R30,R26
	BRTC __MODW212
	RCALL __ANEGW1
__MODW212:
	RET

;END OF CODE MARKER
__END_OF_CODE:
