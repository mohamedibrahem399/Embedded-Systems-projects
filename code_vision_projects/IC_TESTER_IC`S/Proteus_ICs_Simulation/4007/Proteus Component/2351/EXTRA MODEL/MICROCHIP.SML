SPICE LIBRARY  ,  2          MCP601              `  oNZC@?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ?  .SUBCKT MCP601 1 2 3 4 5
*              | | | | |
*              | | | | OUTPUT
*              | | | NEGATIVE SUPPLY
*              | | POSITIVE SUPPLY
*              | INVERTING INPUT
*              NON-INVERTING INPUT
*
********************************************************************************
* SOFTWARE LICENSE AGREEMENT                                                   *
*                                                                              *
* THE SOFTWARE SUPPLIED HEREWITH BY MICROCHIP TECHNOLOGY INCORPORATED (THE     *
* "COMPANY") IS INTENDED AND SUPPLIED TO YOU, THE COMPANY'S CUSTOMER, FOR USE  *
* SOLEY AND EXCLUSIVELY ON MICROCHIP PRODUCTS.                                 *
*                                                                              *
* THE SOFTWARE IS OWNED BY THE COMPANY AND/OR ITS SUPPLIER, AND IS PROTECTED   *
* UNDER APPLICABLE COPYRIGHT LAWS. ALL RIGHTS ARE RESERVED. ANY USE IN         *
* VIOLATION OF THE FOREGOING RESTRICTIONS MAY SUBJECT THE USER TO CRIMINAL     *
* SANCTIONS UNDER APPLICABLE LAWS, AS WELL AS TO CIVIL LIABILITY FOR THE       *
* BREACH OF THE TERMS AND CONDITIONS OF THIS LICENSE.                          *
*                                                                              *
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES, WHETHER    *
* EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED        *
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO  *
* THIS SOFTWARE. THE COMPANY SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR    *
* SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.     *
********************************************************************************
*
* MACROMODEL FOR THE MCP601/2/3/4 OP AMP FAMILY:
*   MCP601 (SINGLE)
*   MCP602 (DUAL)
*   MCP603 (SINGLE W/ CS; CHIP SELECT IS NOT MODELED)
*   MCP604 (QUAD)
*
* REVISION HISTORY:
*   REV A: 30-JUN-99, BCB (CREATED MODEL)
*   REV B: 10-JUL-99, BCB (CORRECTED DC IQ)
*   REV C: 30-NOV-99, BCB (".SUBCKT" ON FIRST LINE, MOVED L, W TO MODEL)
*   REV D: 17-JUL-02, KEB (IMPROVED MODEL)
*
* RECOMMENDATIONS:
*   USE PSPICE (OR SPICE 2G6; OTHER SIMULATORS MAY REQUIRE TRANSLATION)
*   FOR A QUICK, EFFECTIVE DESIGN, USE A COMBINATION OF: DATA SHEET
*     SPECS, BENCH TESTING, AND SIMULATIONS WITH THIS MACROMODEL
*   FOR HIGH IMPEDANCE CIRCUITS, SET GMIN=100F IN THE .OPTIONS
*     STATEMENT
*
* SUPPORTED:
*   TYPICAL PERFORMANCE AT ROOM TEMPERATURE (25 DEGREES C)
*   DC, AC, TRANSIENT, AND NOISE ANALYSES.
*   MOST SPECS, INCLUDING: OFFSETS, DC PSRR, DC CMRR, INPUT IMPEDANCE,
*     OPEN LOOP GAIN, VOLTAGE RANGES, SUPPLY CURRENT, ... , ETC.
*
* NOT SUPPORTED:
*   CHIP SELECT (MCP603)
*   VARIATION IN SPECS VS. POWER SUPPLY VOLTAGE
*   DISTORTION (DETAILED NON-LINEAR BEHAVIOR)
*   TEMPERATURE ANALYSIS
*   PROCESS VARIATION
*   BEHAVIOR OUTSIDE NORMAL OPERATING REGION
*
* INPUT STAGE
V10  3 10 1.20
R10 10 11 4.55K
R11 10 12 4.55K
C11 11 12 3.67P
C12  1  0 6.00P
E12  1 14 POLY(4) 20 0 21 0 26 0 27 0   1.00M 24.3 24.3 1 1
I12 14  0 1.50P
M12 11 14 15 15 NMI L=2.00U W=42.0U
C13 14  2 3.00P
M14 12  2 15 15 NMI L=2.00U W=42.0U
I14  2  0 500E-15
C14  2  0 6.00P
I15 15  4 115U
V16 16  4 300M
D16 16 15 DL
V13  3 13 1.55
D13 14 13 DL
*
* NOISE, PSRR, AND CMRR
I20 21 20 423U
D20 20  0 DN1
D21  0 21 DN1
G26  0 26 POLY(1) 3 4   -220U 40.0U
R26 26  0 1
G27  0 27 POLY(2) 1 3 2 4   -176U 32.0U 32.0U
R27 27  0 1
*
* OPEN LOOP GAIN, SLEW RATE
G30  0 30 POLY(1) 12 11   0 1.00K
R30 30  0 1
E31 31  0 POLY(1) 3 4   104 3.89
D31 30 31 DL
E32  0 32 POLY(1) 3 4   104 6.81
D32 32 30 DL
G33  0 33 POLY(1) 30 0   0 333
R33 33  0 1
C33 33  0 18.1M
G34  0 34 POLY(1) 33 0   0 1.00
R34 34  0 1.00
C34 34  0 33.4N
G35  0 35 POLY(2) 34 0 33 34   0 1.00 2.00
R35 35  0 1.00
*
* OUTPUT STAGE
G50  0 50 POLY(1) 57 5   0 5.00
D51 50 51 DL
R51 51  0 1K
D52 52 50 DL
R52 52  0 1K
G53  3  0 POLY(1) 51 0   115U  1M
G54  0  4 POLY(1) 52 0   115U  -1M
E55 55  0 POLY(2) 3 0 51 0   -10M 1 -22.0M
D55 57 55 DLS
E56 56  0 POLY(2) 4 0 52 0    10M 1 -21.0M
D56 56 57 DLS
G57  0 57 POLY(3) 3 0 4 0 35 0   0 769U 769U 1.54M
R57 57  0 650
R58 57  5 200M
C58  5  0 2.00P
*
* MODELS
.MODEL NMI NMOS
.MODEL DL  D   N=1   IS=1F
.MODEL DLS D   N=10M IS=1F
.MODEL DN1 D   IS=1F KF=135E-18 AF=1
*
.ENDS MCP601
 