
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
	.DEF _counter1=R5
	.DEF _password_count=R4
	.DEF _test=R7
	.DEF _temp=R6
	.DEF _i=R9

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

;GLOBAL REGISTER VARIABLES INITIALIZATION
__REG_VARS:
	.DB  0x6,0x0,0x0,0x1
	.DB  0x0,0x0

_0x3:
	.DB  0x1,0x1,0x1

__GLOBAL_INI_TBL:
	.DW  0x06
	.DW  0x04
	.DW  __REG_VARS*2

	.DW  0x03
	.DW  _password
	.DW  _0x3*2

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
;? Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project : Password_Module_Trail_0
;Version : 0
;Date    : 11/15/2021
;Author  : Mohamed Ibrahem
;Company : Home
;Comments:
;NO COMMENT
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
;
;#include <delay.h>
;#define LED_GREEN PORTB.0
;#define LED_RED   PORTB.1
;
;#define BUTTON1 PINA.0
;#define BUTTON2 PINA.1
;#define BUTTON3 PINA.2
;
;#define ON  1
;#define OFF 0
;
;char counter1 = 0;
;char password_count = 6;
;char password [password_count]  = {1,1,1,0,0,0} ;

	.DSEG
;char entered [password_count]   = {0,0,0,0,0,0} ;
;
;//char new_pasword [password_count]   = {0,0,0,0,0,0} ;
;
;char test=1;
;char temp=0;
;
;char i=0;
;
;#define SET_BIT(VAR,BIT) VAR |= (1<<BIT)
;#define CLR_BIT(VAR,BIT) VAR &= (~(1<<BIT))
;#define TOG_BIT(VAR,BIT) VAR ^= (1<<BIT)
;#define GET_BIT(VAR,BIT) ((VAR>>BIT)&1)
;
;
;void EEPRom_Write(short address , char data){
; 0000 0038 void EEPRom_Write(short address , char data){

	.CSEG
_EEPRom_Write:
; .FSTART _EEPRom_Write
; 0000 0039     EEARL = (char) address;
	ST   -Y,R26
;	address -> Y+1
;	data -> Y+0
	LDD  R30,Y+1
	OUT  0x1E,R30
; 0000 003A     EEARH = (char) address >> 8;
	LDD  R26,Y+1
	LDI  R30,LOW(8)
	CALL __LSRB12
	OUT  0x1F,R30
; 0000 003B     EEDR = data;
	LD   R30,Y
	OUT  0x1D,R30
; 0000 003C     SET_BIT (EECR , EEMWE);
	SBI  0x1C,2
; 0000 003D     SET_BIT (EECR , EEWE);
	SBI  0x1C,1
; 0000 003E     while (GET_BIT(EECR,EEWE) == 1);
_0x4:
	IN   R30,0x1C
	LDI  R31,0
	ASR  R31
	ROR  R30
	ANDI R30,LOW(0x1)
	CPI  R30,LOW(0x1)
	BREQ _0x4
; 0000 003F }
	ADIW R28,3
	RET
; .FEND
;
;char EEPROM_READ ( short address){
; 0000 0041 char EEPROM_READ ( short address){
_EEPROM_READ:
; .FSTART _EEPROM_READ
; 0000 0042     EEARL = (char) address;
	ST   -Y,R27
	ST   -Y,R26
;	address -> Y+0
	LD   R30,Y
	OUT  0x1E,R30
; 0000 0043     EEARH = (char) address >> 8;
	LD   R26,Y
	LDI  R30,LOW(8)
	CALL __LSRB12
	OUT  0x1F,R30
; 0000 0044     SET_BIT(EECR,EERE);
	SBI  0x1C,0
; 0000 0045     return EEDR;
	IN   R30,0x1D
	ADIW R28,2
	RET
; 0000 0046 }
; .FEND
;
;
;void main(void)
; 0000 004A {
_main:
; .FSTART _main
; 0000 004B 
; 0000 004C DDRB    = 0xff ;
	LDI  R30,LOW(255)
	OUT  0x17,R30
; 0000 004D PORTB   = 0x00 ;
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 004E 
; 0000 004F DDRA    = 0xf0 ;
	LDI  R30,LOW(240)
	OUT  0x1A,R30
; 0000 0050 PORTA   = 0x00 ;
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 0051 PORTA.0 = 1    ;
	SBI  0x1B,0
; 0000 0052 PORTA.1 = 1    ;
	SBI  0x1B,1
; 0000 0053 PORTA.2 = 1    ;
	SBI  0x1B,2
; 0000 0054 
; 0000 0055 if( EEPROM_READ(80) != 0xff ){
	LDI  R26,LOW(80)
	LDI  R27,0
	RCALL _EEPROM_READ
	CPI  R30,LOW(0xFF)
	BREQ _0xD
; 0000 0056     password_count = EEPROM_READ(80);
	LDI  R26,LOW(80)
	LDI  R27,0
	RCALL _EEPROM_READ
	MOV  R4,R30
; 0000 0057     delay_ms(100);
	RCALL SUBOPT_0x0
; 0000 0058 
; 0000 0059 for(i= 0 ; i< password_count  ;i++){
	CLR  R9
_0xF:
	CP   R9,R4
	BRSH _0x10
; 0000 005A     if( EEPROM_READ(i + i  * 8 ) != 0xff ){
	RCALL SUBOPT_0x1
	CPI  R30,LOW(0xFF)
	BREQ _0x11
; 0000 005B     password [i] =   EEPROM_READ(i + i  * 8 );
	RCALL SUBOPT_0x2
	PUSH R31
	PUSH R30
	RCALL SUBOPT_0x1
	POP  R26
	POP  R27
	ST   X,R30
; 0000 005C     entered  [i] = 0;
	MOV  R30,R9
	RCALL SUBOPT_0x3
; 0000 005D     delay_ms(100);
	RCALL SUBOPT_0x0
; 0000 005E     }
; 0000 005F   }
_0x11:
	INC  R9
	RJMP _0xF
_0x10:
; 0000 0060 }
; 0000 0061 
; 0000 0062 while (1)
_0xD:
_0x12:
; 0000 0063       {
; 0000 0064       if(counter1 == password_count){
	CP   R4,R5
	BRNE _0x15
; 0000 0065               if (password_count == 0){
	TST  R4
	BRNE _0x16
; 0000 0066                     password_count = 6;
	LDI  R30,LOW(6)
	MOV  R4,R30
; 0000 0067                     EEPRom_Write( 80  , password_count );
	RCALL SUBOPT_0x4
; 0000 0068                     for(i=0;i<password_count;i++){
	CLR  R9
_0x18:
	CP   R9,R4
	BRSH _0x19
; 0000 0069                     EEPRom_Write( i + i  * 8  , password[i] );
	RCALL SUBOPT_0x5
	LD   R26,Z
	RCALL _EEPRom_Write
; 0000 006A                     password [i]  = 1;
	RCALL SUBOPT_0x2
	LDI  R26,LOW(1)
	STD  Z+0,R26
; 0000 006B                     delay_ms(100);
	RCALL SUBOPT_0x0
; 0000 006C                     }
	INC  R9
	RJMP _0x18
_0x19:
; 0000 006D               }
; 0000 006E               while(temp<password_count){
_0x16:
_0x1A:
	CP   R6,R4
	BRSH _0x1C
; 0000 006F                    if(entered[temp] ==  password[temp]){
	RCALL SUBOPT_0x6
	BRNE _0x1D
; 0000 0070                       test =1;
	LDI  R30,LOW(1)
	MOV  R7,R30
; 0000 0071                      }
; 0000 0072                    else if ( entered[temp] !=  password[temp]){
	RJMP _0x1E
_0x1D:
	RCALL SUBOPT_0x6
	BREQ _0x1F
; 0000 0073                       test =0;
	CLR  R7
; 0000 0074                       break;
	RJMP _0x1C
; 0000 0075                     }
; 0000 0076                    temp++;
_0x1F:
_0x1E:
	INC  R6
; 0000 0077                   }
	RJMP _0x1A
_0x1C:
; 0000 0078               temp=0;
	CLR  R6
; 0000 0079               if( test == 1 ){
	LDI  R30,LOW(1)
	CP   R30,R7
	BRNE _0x20
; 0000 007A                     LED_GREEN = ON;
	SBI  0x18,0
; 0000 007B                     delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 007C                     LED_GREEN = OFF;
	CBI  0x18,0
; 0000 007D                     counter1=0;
	CLR  R5
; 0000 007E                     }
; 0000 007F               else if (test == 0){
	RJMP _0x25
_0x20:
	TST  R7
	BRNE _0x26
; 0000 0080                     LED_RED = ON;
	SBI  0x18,1
; 0000 0081                     delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 0082                     LED_RED = OFF;
	CBI  0x18,1
; 0000 0083                     counter1=0;
	CLR  R5
; 0000 0084                     test = 1;
	LDI  R30,LOW(1)
	MOV  R7,R30
; 0000 0085                     }
; 0000 0086                 }
_0x26:
_0x25:
; 0000 0087       else if( BUTTON1 == 1){
	RJMP _0x2B
_0x15:
	SBIS 0x19,0
	RJMP _0x2C
; 0000 0088         delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 0089         entered[counter1] = 1;
	MOV  R30,R5
	LDI  R31,0
	SUBI R30,LOW(-_entered)
	SBCI R31,HIGH(-_entered)
	LDI  R26,LOW(1)
	STD  Z+0,R26
; 0000 008A         counter1++;
	INC  R5
; 0000 008B         }
; 0000 008C       else if( BUTTON2 == 1){
	RJMP _0x2D
_0x2C:
	SBIS 0x19,1
	RJMP _0x2E
; 0000 008D         delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 008E        entered[counter1] = 0;
	MOV  R30,R5
	RCALL SUBOPT_0x3
; 0000 008F         counter1++;
	INC  R5
; 0000 0090         }
; 0000 0091 
; 0000 0092       else if( BUTTON3 == 1){
	RJMP _0x2F
_0x2E:
	SBIS 0x19,2
	RJMP _0x30
; 0000 0093             password_count=0;
	CLR  R4
; 0000 0094             LED_GREEN= ON;
	SBI  0x18,0
; 0000 0095             LED_RED  = ON;
	SBI  0x18,1
; 0000 0096             while (BUTTON3 == 1){
_0x35:
	SBIS 0x19,2
	RJMP _0x37
; 0000 0097                    if( BUTTON1 == 1){
	SBIS 0x19,0
	RJMP _0x38
; 0000 0098                         LED_RED   = OFF;
	CBI  0x18,1
; 0000 0099                         delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 009A                         LED_RED   = ON;
	SBI  0x18,1
; 0000 009B                         password [password_count] = 1 ;
	MOV  R30,R4
	LDI  R31,0
	SUBI R30,LOW(-_password)
	SBCI R31,HIGH(-_password)
	LDI  R26,LOW(1)
	RJMP _0x5E
; 0000 009C                         entered  [password_count] = 0 ;
; 0000 009D                         password_count++;
; 0000 009E                         }
; 0000 009F                    else if( BUTTON2 == 1){
_0x38:
	SBIS 0x19,1
	RJMP _0x3E
; 0000 00A0                         LED_RED   = OFF;
	CBI  0x18,1
; 0000 00A1                         delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 00A2                         LED_RED   = ON;
	SBI  0x18,1
; 0000 00A3                         password [password_count] = 0 ;
	MOV  R30,R4
	LDI  R31,0
	SUBI R30,LOW(-_password)
	SBCI R31,HIGH(-_password)
	LDI  R26,LOW(0)
_0x5E:
	STD  Z+0,R26
; 0000 00A4                         entered  [password_count] = 0 ;
	MOV  R30,R4
	RCALL SUBOPT_0x3
; 0000 00A5                         password_count++;
	INC  R4
; 0000 00A6                         }
; 0000 00A7                    if(BUTTON3 == 0){
_0x3E:
	SBIC 0x19,2
	RJMP _0x43
; 0000 00A8                    delay_ms(200);
	RCALL SUBOPT_0x7
; 0000 00A9                     if(BUTTON3 == 0){
	SBIS 0x19,2
; 0000 00AA                         break;}
	RJMP _0x37
; 0000 00AB                    }
; 0000 00AC             }
_0x43:
	RJMP _0x35
_0x37:
; 0000 00AD             EEPRom_Write( 80 , password_count );
	RCALL SUBOPT_0x4
; 0000 00AE             LED_GREEN= OFF;
	CBI  0x18,0
; 0000 00AF             delay_ms(150);
	LDI  R26,LOW(150)
	LDI  R27,0
	CALL _delay_ms
; 0000 00B0             LED_GREEN= ON;
	SBI  0x18,0
; 0000 00B1             for(i=0 ; i < password_count ; i++){
	CLR  R9
_0x4A:
	CP   R9,R4
	BRSH _0x4B
; 0000 00B2                 EEPRom_Write( i + i  * 8  , password[i] );
	RCALL SUBOPT_0x5
	LD   R26,Z
	RCALL _EEPRom_Write
; 0000 00B3                 LED_GREEN= OFF;
	CBI  0x18,0
; 0000 00B4                 LED_RED  = OFF;
	CBI  0x18,1
; 0000 00B5                 delay_ms(150);
	LDI  R26,LOW(150)
	LDI  R27,0
	CALL _delay_ms
; 0000 00B6                 LED_GREEN= ON;
	SBI  0x18,0
; 0000 00B7                 LED_RED  = ON;
	SBI  0x18,1
; 0000 00B8             }
	INC  R9
	RJMP _0x4A
_0x4B:
; 0000 00B9             counter1=0;
	CLR  R5
; 0000 00BA             LED_RED   = OFF;
	CBI  0x18,1
; 0000 00BB             LED_GREEN= OFF;
	CBI  0x18,0
; 0000 00BC 
; 0000 00BD         }
; 0000 00BE       else{
	RJMP _0x58
_0x30:
; 0000 00BF         LED_GREEN = OFF;
	CBI  0x18,0
; 0000 00C0         LED_RED   = OFF;
	CBI  0x18,1
; 0000 00C1         }
_0x58:
_0x2F:
_0x2D:
_0x2B:
; 0000 00C2 
; 0000 00C3       }
	RJMP _0x12
; 0000 00C4 }
_0x5D:
	RJMP _0x5D
; .FEND

	.DSEG
_password:
	.BYTE 0x6
_entered:
	.BYTE 0x6

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x0:
	LDI  R26,LOW(100)
	LDI  R27,0
	JMP  _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x1:
	MOV  R22,R9
	CLR  R23
	MOV  R26,R9
	LDI  R30,LOW(8)
	MUL  R30,R26
	MOVW R30,R0
	MOVW R26,R22
	ADD  R26,R30
	ADC  R27,R31
	RJMP _EEPROM_READ

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x2:
	MOV  R30,R9
	LDI  R31,0
	SUBI R30,LOW(-_password)
	SBCI R31,HIGH(-_password)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x3:
	LDI  R31,0
	SUBI R30,LOW(-_entered)
	SBCI R31,HIGH(-_entered)
	LDI  R26,LOW(0)
	STD  Z+0,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x4:
	LDI  R30,LOW(80)
	LDI  R31,HIGH(80)
	ST   -Y,R31
	ST   -Y,R30
	MOV  R26,R4
	RJMP _EEPRom_Write

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x5:
	MOV  R22,R9
	CLR  R23
	MOV  R26,R9
	LDI  R30,LOW(8)
	MUL  R30,R26
	MOVW R30,R0
	ADD  R30,R22
	ADC  R31,R23
	ST   -Y,R31
	ST   -Y,R30
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x6:
	MOV  R30,R6
	LDI  R31,0
	SUBI R30,LOW(-_entered)
	SBCI R31,HIGH(-_entered)
	LD   R26,Z
	MOV  R30,R6
	LDI  R31,0
	SUBI R30,LOW(-_password)
	SBCI R31,HIGH(-_password)
	LD   R30,Z
	CP   R30,R26
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x7:
	LDI  R26,LOW(200)
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

__LSRB12:
	TST  R30
	MOV  R0,R30
	MOV  R30,R26
	BREQ __LSRB12R
__LSRB12L:
	LSR  R30
	DEC  R0
	BRNE __LSRB12L
__LSRB12R:
	RET

;END OF CODE MARKER
__END_OF_CODE:
