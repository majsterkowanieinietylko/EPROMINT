EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Address bus driver for 8-bit CPU"
Date "2025-06-23"
Rev "2"
Comp "MINT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 681F95E4
P 800 1050
F 0 "J1" H 908 1431 50  0000 C CNN
F 1 "POWER" H 908 1340 50  0000 C CNN
F 2 "" H 800 1050 50  0001 C CNN
F 3 "~" H 800 1050 50  0001 C CNN
	1    800  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 850  1000 950 
Connection ~ 1000 950 
Wire Wire Line
	1000 950  1000 1050
Wire Wire Line
	1000 1150 1000 1250
Connection ~ 1000 1250
Wire Wire Line
	1000 1250 1000 1350
$Comp
L power:GND #PWR02
U 1 1 681FA5BB
P 1000 1350
F 0 "#PWR02" H 1000 1100 50  0001 C CNN
F 1 "GND" H 1005 1177 50  0000 C CNN
F 2 "" H 1000 1350 50  0001 C CNN
F 3 "" H 1000 1350 50  0001 C CNN
	1    1000 1350
	1    0    0    -1  
$EndComp
Connection ~ 1000 1350
$Comp
L Device:CP_Small C1
U 1 1 681FABD0
P 1775 1100
F 0 "C1" H 1863 1146 50  0000 L CNN
F 1 "47u" H 1863 1055 50  0000 L CNN
F 2 "" H 1775 1100 50  0001 C CNN
F 3 "~" H 1775 1100 50  0001 C CNN
	1    1775 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 950  1225 950 
Wire Wire Line
	1775 950  1775 1000
Wire Wire Line
	1000 1250 1225 1250
Wire Wire Line
	1775 1250 1775 1200
$Comp
L Device:C_Small C2
U 1 1 681FB501
P 2150 1100
F 0 "C2" H 2242 1146 50  0000 L CNN
F 1 "1uF" H 2242 1055 50  0000 L CNN
F 2 "" H 2150 1100 50  0001 C CNN
F 3 "~" H 2150 1100 50  0001 C CNN
	1    2150 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1775 950  2150 950 
Wire Wire Line
	2150 950  2150 1000
Connection ~ 1775 950 
Wire Wire Line
	1775 1250 2150 1250
Wire Wire Line
	2150 1250 2150 1200
Connection ~ 1775 1250
Text GLabel 2425 950  2    50   Output ~ 10
5V
Wire Wire Line
	2150 950  2425 950 
Connection ~ 2150 950 
$Comp
L Connector:Conn_01x28_Female J2
U 1 1 682000FB
P 1150 3325
F 0 "J2" H 1042 4810 50  0000 C CNN
F 1 "From control board" H 1200 4725 50  0000 C CNN
F 2 "" H 1150 3325 50  0001 C CNN
F 3 "~" H 1150 3325 50  0001 C CNN
	1    1150 3325
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 68206DB6
P 1675 1775
F 0 "#PWR03" H 1675 1525 50  0001 C CNN
F 1 "GND" H 1680 1602 50  0000 C CNN
F 2 "" H 1675 1775 50  0001 C CNN
F 3 "" H 1675 1775 50  0001 C CNN
	1    1675 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2025 1500 2025
Wire Wire Line
	1500 2025 1500 1700
Wire Wire Line
	1500 1700 1675 1700
Wire Wire Line
	1675 1700 1675 1775
$Comp
L Diode:1N5819 D1
U 1 1 68208250
P 1225 1100
F 0 "D1" V 1179 1180 50  0000 L CNN
F 1 "1N5819" V 1270 1180 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1225 925 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 1225 1100 50  0001 C CNN
	1    1225 1100
	0    1    1    0   
$EndComp
Connection ~ 1225 950 
Wire Wire Line
	1225 950  1775 950 
Connection ~ 1225 1250
Wire Wire Line
	1225 1250 1775 1250
Text GLabel 1350 2125 2    50   3State ~ 0
D7
Text GLabel 1350 2225 2    50   3State ~ 0
D6
Text GLabel 1350 2325 2    50   3State ~ 0
D5
Text GLabel 1350 2425 2    50   3State ~ 0
D4
Text GLabel 1350 2525 2    50   3State ~ 0
D3
Text GLabel 1350 2625 2    50   3State ~ 0
D2
Text GLabel 1350 2725 2    50   3State ~ 0
D1
Text GLabel 1350 2825 2    50   3State ~ 0
D0
Text GLabel 1350 3025 2    50   Output ~ 0
WR_ADDR_L
Text GLabel 1350 3125 2    50   Output ~ 0
#RD_ADDR_H
Text GLabel 1350 3225 2    50   Output ~ 0
#RD_ADDR_L
Text GLabel 1350 3325 2    50   Output ~ 0
#WR_M
Text GLabel 1350 3425 2    50   Output ~ 0
#RD_M
Text GLabel 1350 3525 2    50   Output ~ 0
#RST
Text GLabel 1350 3625 2    50   Input ~ 0
INT
Text GLabel 1350 3725 2    50   Output ~ 0
#INTA
Text GLabel 1350 3825 2    50   Output ~ 0
ADDR_OP1
Text GLabel 1350 3925 2    50   Output ~ 0
ADDR_OP0
Text GLabel 1350 4025 2    50   Output ~ 0
WR_PC
Text GLabel 1350 4125 2    50   Output ~ 0
WR_SP
Text GLabel 1350 4225 2    50   Output ~ 0
WR_DP
Text GLabel 1350 4325 2    50   Output ~ 0
#OUT_PC
Text GLabel 1350 4425 2    50   Output ~ 0
#OUT_SP
Text GLabel 1350 4525 2    50   Output ~ 0
#OUT_DP
Text GLabel 1350 4625 2    50   Output ~ 0
#OUT_DIR
Text GLabel 1350 4725 2    50   Output ~ 0
ST_ADDR
$Comp
L Device:R_Small R1
U 1 1 6820B4A7
P 950 2925
F 0 "R1" V 900 2925 20  0000 C CNN
F 1 "10k" V 950 2925 20  0000 C CNN
F 2 "" H 950 2925 50  0001 C CNN
F 3 "~" H 950 2925 50  0001 C CNN
	1    950  2925
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 6820C81F
P 950 3025
F 0 "R2" V 900 3025 20  0000 C CNN
F 1 "10k" V 950 3025 20  0000 C CNN
F 2 "" H 950 3025 50  0001 C CNN
F 3 "~" H 950 3025 50  0001 C CNN
	1    950  3025
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6820CA1C
P 950 3125
F 0 "R3" V 900 3125 20  0000 C CNN
F 1 "10k" V 950 3125 20  0000 C CNN
F 2 "" H 950 3125 50  0001 C CNN
F 3 "~" H 950 3125 50  0001 C CNN
	1    950  3125
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6820D564
P 950 3225
F 0 "R4" V 900 3225 20  0000 C CNN
F 1 "10k" V 950 3225 20  0000 C CNN
F 2 "" H 950 3225 50  0001 C CNN
F 3 "~" H 950 3225 50  0001 C CNN
	1    950  3225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6820D70C
P 950 3525
F 0 "R5" V 900 3525 20  0000 C CNN
F 1 "10k" V 950 3525 20  0000 C CNN
F 2 "" H 950 3525 50  0001 C CNN
F 3 "~" H 950 3525 50  0001 C CNN
	1    950  3525
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 6820DBE6
P 950 3825
F 0 "R6" V 900 3825 20  0000 C CNN
F 1 "10k" V 950 3825 20  0000 C CNN
F 2 "" H 950 3825 50  0001 C CNN
F 3 "~" H 950 3825 50  0001 C CNN
	1    950  3825
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 6820E068
P 950 3925
F 0 "R7" V 900 3925 20  0000 C CNN
F 1 "10k" V 950 3925 20  0000 C CNN
F 2 "" H 950 3925 50  0001 C CNN
F 3 "~" H 950 3925 50  0001 C CNN
	1    950  3925
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 6820E210
P 950 4025
F 0 "R8" V 900 4025 20  0000 C CNN
F 1 "10k" V 950 4025 20  0000 C CNN
F 2 "" H 950 4025 50  0001 C CNN
F 3 "~" H 950 4025 50  0001 C CNN
	1    950  4025
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 6820E591
P 950 4125
F 0 "R9" V 900 4125 20  0000 C CNN
F 1 "10k" V 950 4125 20  0000 C CNN
F 2 "" H 950 4125 50  0001 C CNN
F 3 "~" H 950 4125 50  0001 C CNN
	1    950  4125
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 6820E865
P 950 4225
F 0 "R10" V 900 4225 20  0000 C CNN
F 1 "10k" V 950 4225 20  0000 C CNN
F 2 "" H 950 4225 50  0001 C CNN
F 3 "~" H 950 4225 50  0001 C CNN
	1    950  4225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 6820EBA7
P 950 4325
F 0 "R11" V 900 4325 20  0000 C CNN
F 1 "10k" V 950 4325 20  0000 C CNN
F 2 "" H 950 4325 50  0001 C CNN
F 3 "~" H 950 4325 50  0001 C CNN
	1    950  4325
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 6820EDBB
P 950 4425
F 0 "R12" V 900 4425 20  0000 C CNN
F 1 "10k" V 950 4425 20  0000 C CNN
F 2 "" H 950 4425 50  0001 C CNN
F 3 "~" H 950 4425 50  0001 C CNN
	1    950  4425
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 6820F054
P 950 4525
F 0 "R13" V 900 4525 20  0000 C CNN
F 1 "10k" V 950 4525 20  0000 C CNN
F 2 "" H 950 4525 50  0001 C CNN
F 3 "~" H 950 4525 50  0001 C CNN
	1    950  4525
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 6820F2B8
P 950 4625
F 0 "R14" V 900 4625 20  0000 C CNN
F 1 "10k" V 950 4625 20  0000 C CNN
F 2 "" H 950 4625 50  0001 C CNN
F 3 "~" H 950 4625 50  0001 C CNN
	1    950  4625
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 6820F59B
P 950 4725
F 0 "R15" V 900 4725 20  0000 C CNN
F 1 "10k" V 950 4725 20  0000 C CNN
F 2 "" H 950 4725 50  0001 C CNN
F 3 "~" H 950 4725 50  0001 C CNN
	1    950  4725
	0    1    1    0   
$EndComp
Text GLabel 1350 2925 2    50   Output ~ 0
WR_ADDR_H
Wire Wire Line
	1050 2925 1350 2925
Wire Wire Line
	1350 3025 1050 3025
Wire Wire Line
	1050 3125 1350 3125
Wire Wire Line
	1350 3225 1050 3225
Wire Wire Line
	1350 3525 1050 3525
Wire Wire Line
	1050 3825 1350 3825
Wire Wire Line
	1350 3925 1050 3925
Wire Wire Line
	1050 4025 1350 4025
Wire Wire Line
	1050 4125 1350 4125
Wire Wire Line
	1350 4225 1050 4225
Wire Wire Line
	1050 4325 1350 4325
Wire Wire Line
	1350 4425 1050 4425
Wire Wire Line
	1050 4525 1350 4525
Wire Wire Line
	1350 4625 1050 4625
Wire Wire Line
	1050 4725 1350 4725
Wire Wire Line
	850  4625 800  4625
Wire Wire Line
	800  4625 800  4525
Wire Wire Line
	800  4325 850  4325
Wire Wire Line
	850  4525 800  4525
Connection ~ 800  4525
Wire Wire Line
	800  4525 800  4425
Wire Wire Line
	850  4425 800  4425
Connection ~ 800  4425
Wire Wire Line
	800  4425 800  4325
Wire Wire Line
	850  4225 750  4225
Wire Wire Line
	750  4225 750  4725
Wire Wire Line
	750  4725 850  4725
Wire Wire Line
	750  4225 750  4125
Wire Wire Line
	750  3825 850  3825
Connection ~ 750  4225
Wire Wire Line
	850  3925 750  3925
Connection ~ 750  3925
Wire Wire Line
	750  3925 750  3825
Wire Wire Line
	850  4025 750  4025
Connection ~ 750  4025
Wire Wire Line
	750  4025 750  3925
Wire Wire Line
	850  4125 750  4125
Connection ~ 750  4125
Wire Wire Line
	750  4125 750  4025
Wire Wire Line
	850  3525 800  3525
Wire Wire Line
	800  3525 800  4325
Connection ~ 800  4325
Wire Wire Line
	850  3125 800  3125
Wire Wire Line
	800  3125 800  3225
Connection ~ 800  3525
Wire Wire Line
	850  3225 800  3225
Connection ~ 800  3225
Wire Wire Line
	800  3225 800  3525
Wire Wire Line
	850  3025 750  3025
Wire Wire Line
	750  3025 750  3825
Connection ~ 750  3825
Wire Wire Line
	850  2925 750  2925
Wire Wire Line
	750  2925 750  3025
Connection ~ 750  3025
$Comp
L power:GND #PWR01
U 1 1 68225427
P 750 4800
F 0 "#PWR01" H 750 4550 50  0001 C CNN
F 1 "GND" H 755 4627 50  0000 C CNN
F 2 "" H 750 4800 50  0001 C CNN
F 3 "" H 750 4800 50  0001 C CNN
	1    750  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  4725 750  4800
Connection ~ 750  4725
Text GLabel 675  3125 0    50   Input ~ 10
5V
Wire Wire Line
	675  3125 800  3125
Connection ~ 800  3125
$Comp
L 74xx:74HC273 U1
U 1 1 68230E44
P 3550 2200
F 0 "U1" H 3550 1975 50  0000 C CNN
F 1 "74HCT273" H 3550 1875 50  0000 C CNN
F 2 "" H 3550 2200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT273.pdf" H 3550 2200 50  0001 C CNN
	1    3550 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC273 U2
U 1 1 682316D0
P 3550 4600
F 0 "U2" H 3550 4375 50  0000 C CNN
F 1 "74HCT273" H 3550 4275 50  0000 C CNN
F 2 "" H 3550 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT273.pdf" H 3550 4600 50  0001 C CNN
	1    3550 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68232B63
P 3550 3000
F 0 "#PWR04" H 3550 2750 50  0001 C CNN
F 1 "GND" H 3555 2827 50  0000 C CNN
F 2 "" H 3550 3000 50  0001 C CNN
F 3 "" H 3550 3000 50  0001 C CNN
	1    3550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 682330A0
P 3550 5400
F 0 "#PWR05" H 3550 5150 50  0001 C CNN
F 1 "GND" H 3555 5227 50  0000 C CNN
F 2 "" H 3550 5400 50  0001 C CNN
F 3 "" H 3550 5400 50  0001 C CNN
	1    3550 5400
	1    0    0    -1  
$EndComp
Text GLabel 3050 2600 0    50   Input ~ 0
WR_ADDR_H
Text GLabel 3050 5000 0    50   Input ~ 0
WR_ADDR_L
Wire Wire Line
	3050 2700 2725 2700
Wire Wire Line
	2725 5100 3050 5100
Text GLabel 2600 5100 0    50   Input ~ 0
#RST
Text GLabel 3425 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C3
U 1 1 682375C3
P 3750 1200
F 0 "C3" H 3842 1246 50  0000 L CNN
F 1 "100n" H 3842 1155 50  0000 L CNN
F 2 "" H 3750 1200 50  0001 C CNN
F 3 "~" H 3750 1200 50  0001 C CNN
	1    3750 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 68237B00
P 3750 1300
F 0 "#PWR07" H 3750 1050 50  0001 C CNN
F 1 "GND" H 3755 1127 50  0000 C CNN
F 2 "" H 3750 1300 50  0001 C CNN
F 3 "" H 3750 1300 50  0001 C CNN
	1    3750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 950  3550 950 
Wire Wire Line
	3750 950  3750 1100
Wire Wire Line
	3550 950  3550 1400
Connection ~ 3550 950 
Wire Wire Line
	3550 950  3750 950 
Text GLabel 3425 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C4
U 1 1 6823EF93
P 3750 3600
F 0 "C4" H 3842 3646 50  0000 L CNN
F 1 "100n" H 3842 3555 50  0000 L CNN
F 2 "" H 3750 3600 50  0001 C CNN
F 3 "~" H 3750 3600 50  0001 C CNN
	1    3750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 6823EF99
P 3750 3700
F 0 "#PWR08" H 3750 3450 50  0001 C CNN
F 1 "GND" H 3755 3527 50  0000 C CNN
F 2 "" H 3750 3700 50  0001 C CNN
F 3 "" H 3750 3700 50  0001 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 3350 3550 3350
Wire Wire Line
	3750 3350 3750 3500
Wire Wire Line
	3550 3350 3550 3800
Connection ~ 3550 3350
Wire Wire Line
	3550 3350 3750 3350
Text GLabel 3050 2400 0    50   Input ~ 0
D7
Text GLabel 3050 1700 0    50   Input ~ 0
D6
Text GLabel 3050 2300 0    50   Input ~ 0
D5
Text GLabel 3050 1800 0    50   Input ~ 0
D4
Text GLabel 3050 2200 0    50   Input ~ 0
D3
Text GLabel 3050 1900 0    50   Input ~ 0
D2
Text GLabel 3050 2100 0    50   Input ~ 0
D1
Text GLabel 3050 2000 0    50   Input ~ 0
D0
Text GLabel 3050 4800 0    50   Input ~ 0
D7
Text GLabel 3050 4100 0    50   Input ~ 0
D6
Text GLabel 3050 4700 0    50   Input ~ 0
D5
Text GLabel 3050 4200 0    50   Input ~ 0
D4
Text GLabel 3050 4600 0    50   Input ~ 0
D3
Text GLabel 3050 4300 0    50   Input ~ 0
D2
Text GLabel 3050 4500 0    50   Input ~ 0
D1
Text GLabel 3050 4400 0    50   Input ~ 0
D0
$Comp
L 74xx:74HC245 U4
U 1 1 6824D2D2
P 5650 2200
F 0 "U4" H 5650 2000 50  0000 C CNN
F 1 "74HCT245" H 5650 1900 50  0000 C CNN
F 2 "" H 5650 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5650 2200 50  0001 C CNN
	1    5650 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 6824EB6B
P 5650 3000
F 0 "#PWR010" H 5650 2750 50  0001 C CNN
F 1 "GND" H 5655 2827 50  0000 C CNN
F 2 "" H 5650 3000 50  0001 C CNN
F 3 "" H 5650 3000 50  0001 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
Text GLabel 5150 2600 0    50   Input ~ 10
5V
Text GLabel 5525 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C6
U 1 1 6824FBEF
P 5850 1200
F 0 "C6" H 5942 1246 50  0000 L CNN
F 1 "100n" H 5942 1155 50  0000 L CNN
F 2 "" H 5850 1200 50  0001 C CNN
F 3 "~" H 5850 1200 50  0001 C CNN
	1    5850 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 6824FBF5
P 5850 1300
F 0 "#PWR013" H 5850 1050 50  0001 C CNN
F 1 "GND" H 5855 1127 50  0000 C CNN
F 2 "" H 5850 1300 50  0001 C CNN
F 3 "" H 5850 1300 50  0001 C CNN
	1    5850 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 950  5650 950 
Wire Wire Line
	5850 950  5850 1100
Wire Wire Line
	5650 950  5650 1400
Connection ~ 5650 950 
Wire Wire Line
	5650 950  5850 950 
$Comp
L 74xx:74HC245 U5
U 1 1 68274E47
P 5650 4600
F 0 "U5" H 5650 4400 50  0000 C CNN
F 1 "74HCT245" H 5650 4300 50  0000 C CNN
F 2 "" H 5650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5650 4600 50  0001 C CNN
	1    5650 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 68274E4D
P 5650 5400
F 0 "#PWR011" H 5650 5150 50  0001 C CNN
F 1 "GND" H 5655 5227 50  0000 C CNN
F 2 "" H 5650 5400 50  0001 C CNN
F 3 "" H 5650 5400 50  0001 C CNN
	1    5650 5400
	1    0    0    -1  
$EndComp
Text GLabel 5150 5000 0    50   Input ~ 10
5V
Text GLabel 5525 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C7
U 1 1 68274E55
P 5850 3600
F 0 "C7" H 5942 3646 50  0000 L CNN
F 1 "100n" H 5942 3555 50  0000 L CNN
F 2 "" H 5850 3600 50  0001 C CNN
F 3 "~" H 5850 3600 50  0001 C CNN
	1    5850 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 68274E5B
P 5850 3700
F 0 "#PWR014" H 5850 3450 50  0001 C CNN
F 1 "GND" H 5855 3527 50  0000 C CNN
F 2 "" H 5850 3700 50  0001 C CNN
F 3 "" H 5850 3700 50  0001 C CNN
	1    5850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 3350 5650 3350
Wire Wire Line
	5850 3350 5850 3500
Wire Wire Line
	5650 3350 5650 3800
Connection ~ 5650 3350
Wire Wire Line
	5650 3350 5850 3350
Wire Wire Line
	5150 2700 4925 2700
Wire Wire Line
	4925 2700 4925 5100
Wire Wire Line
	4925 5100 5150 5100
Wire Wire Line
	2725 2700 2725 5100
Wire Wire Line
	2600 5100 2725 5100
Connection ~ 2725 5100
Text GLabel 4800 5100 0    50   Input ~ 0
#OUT_DIR
Wire Wire Line
	4800 5100 4925 5100
Connection ~ 4925 5100
Text GLabel 4050 4400 2    50   Output ~ 0
Q0
Text GLabel 4050 4500 2    50   Output ~ 0
Q1
Text GLabel 4050 4600 2    50   Output ~ 0
Q3
Text GLabel 4050 4700 2    50   Output ~ 0
Q5
Text GLabel 4050 4200 2    50   Output ~ 0
Q4
Text GLabel 4050 4300 2    50   Output ~ 0
Q2
Text GLabel 4050 4100 2    50   Output ~ 0
Q6
Text GLabel 4050 4800 2    50   Output ~ 0
Q7
Text GLabel 4050 2000 2    50   Output ~ 0
Q8
Text GLabel 4050 2100 2    50   Output ~ 0
Q9
Text GLabel 4050 2200 2    50   Output ~ 0
Q11
Text GLabel 4050 2300 2    50   Output ~ 0
Q13
Text GLabel 4050 1800 2    50   Output ~ 0
Q12
Text GLabel 4050 1900 2    50   Output ~ 0
Q10
Text GLabel 4050 1700 2    50   Output ~ 0
Q14
Text GLabel 4050 2400 2    50   Output ~ 0
Q15
Text GLabel 5150 4800 0    50   Input ~ 0
Q0
Text GLabel 5150 4700 0    50   Input ~ 0
Q1
Text GLabel 5150 4600 0    50   Input ~ 0
Q2
Text GLabel 5150 4500 0    50   Input ~ 0
Q3
Text GLabel 5150 4400 0    50   Input ~ 0
Q4
Text GLabel 5150 4300 0    50   Input ~ 0
Q5
Text GLabel 5150 4200 0    50   Input ~ 0
Q6
Text GLabel 5150 4100 0    50   Input ~ 0
Q7
Text GLabel 5150 2400 0    50   Input ~ 0
Q8
Text GLabel 5150 2300 0    50   Input ~ 0
Q9
Text GLabel 5150 2200 0    50   Input ~ 0
Q10
Text GLabel 5150 2100 0    50   Input ~ 0
Q11
Text GLabel 5150 2000 0    50   Input ~ 0
Q12
Text GLabel 5150 1900 0    50   Input ~ 0
Q13
Text GLabel 5150 1800 0    50   Input ~ 0
Q14
Text GLabel 5150 1700 0    50   Input ~ 0
Q15
Text GLabel 6150 4400 2    50   Output ~ 0
A4
Text GLabel 6150 4500 2    50   Output ~ 0
A3
Text GLabel 6150 4600 2    50   Output ~ 0
A2
Text GLabel 6150 4700 2    50   Output ~ 0
A1
Text GLabel 6150 4200 2    50   Output ~ 0
A6
Text GLabel 6150 4300 2    50   Output ~ 0
A5
Text GLabel 6150 4100 2    50   Output ~ 0
A7
Text GLabel 6150 4800 2    50   Output ~ 0
A0
Text GLabel 6150 2000 2    50   Output ~ 0
A12
Text GLabel 6150 2100 2    50   Output ~ 0
A11
Text GLabel 6150 2200 2    50   Output ~ 0
A10
Text GLabel 6150 2300 2    50   Output ~ 0
A9
Text GLabel 6150 1800 2    50   Output ~ 0
A14
Text GLabel 6150 1900 2    50   Output ~ 0
A13
Text GLabel 6150 1700 2    50   Output ~ 0
A15
Text GLabel 6150 2400 2    50   Output ~ 0
A8
Text GLabel 3150 6750 0    50   Input ~ 0
Q2
Text GLabel 3150 6850 0    50   Input ~ 0
Q3
Text GLabel 3150 6950 0    50   Input ~ 0
Q4
Text GLabel 3150 7050 0    50   Input ~ 0
Q5
Text GLabel 3150 7150 0    50   Input ~ 0
Q6
Text GLabel 3150 7250 0    50   Input ~ 0
ADDR_OP0
Text GLabel 3150 7750 0    50   Input ~ 0
ADDR_OP1
Text GLabel 3150 7550 0    50   Input ~ 0
A0
Text GLabel 3150 7650 0    50   Input ~ 0
A1
Text GLabel 3150 7450 0    50   Input ~ 0
A2
Text GLabel 3150 7350 0    50   Input ~ 0
A3
Text GLabel 3150 7850 0    50   Input ~ 0
A4
Text GLabel 3150 7950 0    50   Input ~ 0
A5
Text GLabel 3150 8050 0    50   Input ~ 0
A6
Text GLabel 3150 6650 0    50   Input ~ 0
Q1
Text GLabel 3150 6550 0    50   Input ~ 0
Q0
$Comp
L Memory_EPROM:27C512 U3
U 1 1 681FDF9F
P 3550 7450
F 0 "U3" H 3625 7500 50  0000 C CNN
F 1 "27C512" H 3625 7400 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 3550 7450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 3550 7450 50  0001 C CNN
	1    3550 7450
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:27C010 U6
U 1 1 681FD013
P 5650 7550
F 0 "U6" H 5725 7600 50  0000 C CNN
F 1 "27C1001" H 5750 7500 50  0000 C CNN
F 2 "" H 5650 7550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0321.pdf" H 5650 7550 50  0001 C CNN
	1    5650 7550
	1    0    0    -1  
$EndComp
Text GLabel 5525 5900 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C8
U 1 1 682F7252
P 5850 6100
F 0 "C8" H 5942 6146 50  0000 L CNN
F 1 "100n" H 5942 6055 50  0000 L CNN
F 2 "" H 5850 6100 50  0001 C CNN
F 3 "~" H 5850 6100 50  0001 C CNN
	1    5850 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 682F7258
P 5850 6200
F 0 "#PWR015" H 5850 5950 50  0001 C CNN
F 1 "GND" H 5855 6027 50  0000 C CNN
F 2 "" H 5850 6200 50  0001 C CNN
F 3 "" H 5850 6200 50  0001 C CNN
	1    5850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 5900 5650 5900
Wire Wire Line
	5850 5900 5850 6000
Wire Wire Line
	5650 5900 5650 6350
Connection ~ 5650 5900
Wire Wire Line
	5650 5900 5850 5900
Text GLabel 3425 5900 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C5
U 1 1 6830EE72
P 3750 6100
F 0 "C5" H 3842 6146 50  0000 L CNN
F 1 "100n" H 3842 6055 50  0000 L CNN
F 2 "" H 3750 6100 50  0001 C CNN
F 3 "~" H 3750 6100 50  0001 C CNN
	1    3750 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 6830EE78
P 3750 6200
F 0 "#PWR09" H 3750 5950 50  0001 C CNN
F 1 "GND" H 3755 6027 50  0000 C CNN
F 2 "" H 3750 6200 50  0001 C CNN
F 3 "" H 3750 6200 50  0001 C CNN
	1    3750 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 5900 3550 5900
Wire Wire Line
	3750 5900 3750 6000
Wire Wire Line
	3550 5900 3550 6350
Connection ~ 3550 5900
Wire Wire Line
	3550 5900 3750 5900
$Comp
L power:GND #PWR06
U 1 1 6831199F
P 3550 8550
F 0 "#PWR06" H 3550 8300 50  0001 C CNN
F 1 "GND" H 3555 8377 50  0000 C CNN
F 2 "" H 3550 8550 50  0001 C CNN
F 3 "" H 3550 8550 50  0001 C CNN
	1    3550 8550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 68311E05
P 5650 8850
F 0 "#PWR012" H 5650 8600 50  0001 C CNN
F 1 "GND" H 5655 8677 50  0000 C CNN
F 2 "" H 5650 8850 50  0001 C CNN
F 3 "" H 5650 8850 50  0001 C CNN
	1    5650 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 8250 3150 8350
Wire Wire Line
	3150 8550 3550 8550
Connection ~ 3150 8350
Wire Wire Line
	3150 8350 3150 8550
Connection ~ 3550 8550
Wire Wire Line
	5250 8550 5250 8650
Wire Wire Line
	5250 8850 5650 8850
Connection ~ 5250 8650
Wire Wire Line
	5250 8650 5250 8850
Connection ~ 5650 8850
Wire Wire Line
	5250 8450 5250 8550
Connection ~ 5250 8550
Text GLabel 5175 8350 0    50   Input ~ 10
5V
Wire Wire Line
	5175 8350 5250 8350
Wire Wire Line
	3950 7250 4450 7250
Wire Wire Line
	4450 7250 4450 7550
Wire Wire Line
	4450 7550 5250 7550
NoConn ~ 6050 7250
Text GLabel 5250 6750 0    50   Input ~ 0
Q9
Text GLabel 5250 6850 0    50   Input ~ 0
Q10
Text GLabel 5250 6950 0    50   Input ~ 0
Q11
Text GLabel 5250 7050 0    50   Input ~ 0
Q12
Text GLabel 5250 7150 0    50   Input ~ 0
Q13
Text GLabel 5250 6650 0    50   Input ~ 0
Q8
Text GLabel 5250 6550 0    50   Input ~ 0
Q7
Text GLabel 5250 7650 0    50   Input ~ 0
A7
Text GLabel 5250 7450 0    50   Input ~ 0
A8
Text GLabel 5250 7350 0    50   Input ~ 0
A9
Text GLabel 5250 7850 0    50   Input ~ 0
A10
Text GLabel 5250 8050 0    50   Input ~ 0
A11
Text GLabel 5250 7950 0    50   Input ~ 0
A12
Text GLabel 5250 8150 0    50   Input ~ 0
A13
Text GLabel 5250 7250 0    50   Input ~ 0
ADDR_OP0
Text GLabel 5250 7750 0    50   Input ~ 0
ADDR_OP1
Text GLabel 3950 7150 2    50   Output ~ 0
ALU6
Text GLabel 3950 7050 2    50   Output ~ 0
ALU5
Text GLabel 3950 6950 2    50   Output ~ 0
ALU4
Text GLabel 3950 6850 2    50   Output ~ 0
ALU3
Text GLabel 3950 6750 2    50   Output ~ 0
ALU0
Text GLabel 3950 6650 2    50   Output ~ 0
ALU1
Text GLabel 3950 6550 2    50   Output ~ 0
ALU2
Text GLabel 6050 7150 2    50   Output ~ 0
ALU13
Text GLabel 6050 7050 2    50   Output ~ 0
ALU12
Text GLabel 6050 6950 2    50   Output ~ 0
ALU11
Text GLabel 6050 6850 2    50   Output ~ 0
ALU10
Text GLabel 6050 6750 2    50   Output ~ 0
ALU7
Text GLabel 6050 6650 2    50   Output ~ 0
ALU8
Text GLabel 6050 6550 2    50   Output ~ 0
ALU9
$Comp
L 74xx:74LS153 U8
U 1 1 683358C9
P 7650 7250
F 0 "U8" H 7700 6950 50  0000 C CNN
F 1 "74HCT153" H 7700 6850 50  0000 C CNN
F 2 "" H 7650 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS153" H 7650 7250 50  0001 C CNN
	1    7650 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6550 7150 6650
Connection ~ 7150 6650
Wire Wire Line
	7150 6650 7150 6750
Wire Wire Line
	7150 7250 7150 7350
Connection ~ 7150 7350
Wire Wire Line
	7150 7350 7150 7450
Wire Wire Line
	7150 7050 7050 7050
Wire Wire Line
	7050 7050 7050 7750
Wire Wire Line
	7050 7750 7150 7750
Wire Wire Line
	7050 7750 7050 8350
Wire Wire Line
	7050 8350 7650 8350
Connection ~ 7050 7750
$Comp
L power:GND #PWR017
U 1 1 68343D91
P 7650 8350
F 0 "#PWR017" H 7650 8100 50  0001 C CNN
F 1 "GND" H 7655 8177 50  0000 C CNN
F 2 "" H 7650 8350 50  0001 C CNN
F 3 "" H 7650 8350 50  0001 C CNN
	1    7650 8350
	1    0    0    -1  
$EndComp
Connection ~ 7650 8350
Text GLabel 7525 5800 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C10
U 1 1 68352767
P 7850 6000
F 0 "C10" H 7942 6046 50  0000 L CNN
F 1 "100n" H 7942 5955 50  0000 L CNN
F 2 "" H 7850 6000 50  0001 C CNN
F 3 "~" H 7850 6000 50  0001 C CNN
	1    7850 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 6835276D
P 7850 6100
F 0 "#PWR020" H 7850 5850 50  0001 C CNN
F 1 "GND" H 7855 5927 50  0000 C CNN
F 2 "" H 7850 6100 50  0001 C CNN
F 3 "" H 7850 6100 50  0001 C CNN
	1    7850 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7525 5800 7650 5800
Wire Wire Line
	7850 5800 7850 5900
Wire Wire Line
	7650 5800 7650 6250
Connection ~ 7650 5800
Wire Wire Line
	7650 5800 7850 5800
Text GLabel 6975 8050 0    50   Input ~ 0
ADDR_OP0
Text GLabel 6975 7950 0    50   Input ~ 0
ADDR_OP1
Wire Wire Line
	6975 7950 7150 7950
Wire Wire Line
	6975 8050 7150 8050
Text GLabel 6975 7550 0    50   Input ~ 0
Q15
Text GLabel 6975 6850 0    50   Input ~ 0
Q14
Wire Wire Line
	6975 7550 7150 7550
Wire Wire Line
	6975 6850 7150 6850
Text GLabel 6975 6650 0    50   Input ~ 0
A14
Wire Wire Line
	6975 6650 7150 6650
Text GLabel 6975 7350 0    50   Input ~ 0
A15
Wire Wire Line
	6975 7350 7150 7350
Text GLabel 8150 6550 2    50   Output ~ 0
ALU14
Text GLabel 8150 7250 2    50   Output ~ 0
ALU15
$Comp
L 74xx:74LS574 U9
U 1 1 68372400
P 7675 2200
F 0 "U9" H 7675 1975 50  0000 C CNN
F 1 "74HCT574" H 7675 1875 50  0000 C CNN
F 2 "" H 7675 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7675 2200 50  0001 C CNN
	1    7675 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 683751E0
P 7675 3000
F 0 "#PWR018" H 7675 2750 50  0001 C CNN
F 1 "GND" H 7680 2827 50  0000 C CNN
F 2 "" H 7675 3000 50  0001 C CNN
F 3 "" H 7675 3000 50  0001 C CNN
	1    7675 3000
	1    0    0    -1  
$EndComp
Text GLabel 7550 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C11
U 1 1 68376E25
P 7875 1200
F 0 "C11" H 7967 1246 50  0000 L CNN
F 1 "100n" H 7967 1155 50  0000 L CNN
F 2 "" H 7875 1200 50  0001 C CNN
F 3 "~" H 7875 1200 50  0001 C CNN
	1    7875 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 68376E2B
P 7875 1300
F 0 "#PWR021" H 7875 1050 50  0001 C CNN
F 1 "GND" H 7880 1127 50  0000 C CNN
F 2 "" H 7875 1300 50  0001 C CNN
F 3 "" H 7875 1300 50  0001 C CNN
	1    7875 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 950  7675 950 
Wire Wire Line
	7875 950  7875 1100
Wire Wire Line
	7675 950  7675 1400
Connection ~ 7675 950 
Wire Wire Line
	7675 950  7875 950 
$Comp
L 74xx:74LS574 U7
U 1 1 6837D04E
P 7650 4600
F 0 "U7" H 7650 4375 50  0000 C CNN
F 1 "74HCT574" H 7650 4275 50  0000 C CNN
F 2 "" H 7650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7650 4600 50  0001 C CNN
	1    7650 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 6837D054
P 7650 5400
F 0 "#PWR016" H 7650 5150 50  0001 C CNN
F 1 "GND" H 7655 5227 50  0000 C CNN
F 2 "" H 7650 5400 50  0001 C CNN
F 3 "" H 7650 5400 50  0001 C CNN
	1    7650 5400
	1    0    0    -1  
$EndComp
Text GLabel 7525 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C9
U 1 1 6837D05B
P 7850 3600
F 0 "C9" H 7942 3646 50  0000 L CNN
F 1 "100n" H 7942 3555 50  0000 L CNN
F 2 "" H 7850 3600 50  0001 C CNN
F 3 "~" H 7850 3600 50  0001 C CNN
	1    7850 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 6837D061
P 7850 3700
F 0 "#PWR019" H 7850 3450 50  0001 C CNN
F 1 "GND" H 7855 3527 50  0000 C CNN
F 2 "" H 7850 3700 50  0001 C CNN
F 3 "" H 7850 3700 50  0001 C CNN
	1    7850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7525 3350 7650 3350
Wire Wire Line
	7850 3350 7850 3500
Wire Wire Line
	7650 3350 7650 3800
Connection ~ 7650 3350
Wire Wire Line
	7650 3350 7850 3350
Text GLabel 7150 4800 0    50   Input ~ 0
ALU0
Text GLabel 7150 4700 0    50   Input ~ 0
ALU1
Text GLabel 7150 4600 0    50   Input ~ 0
ALU2
Text GLabel 7150 4500 0    50   Input ~ 0
ALU3
Text GLabel 7150 4400 0    50   Input ~ 0
ALU4
Text GLabel 7150 4300 0    50   Input ~ 0
ALU5
Text GLabel 7150 4200 0    50   Input ~ 0
ALU6
Text GLabel 7150 4100 0    50   Input ~ 0
ALU7
Text GLabel 7175 2400 0    50   Input ~ 0
ALU8
Text GLabel 7175 2300 0    50   Input ~ 0
ALU9
Text GLabel 7175 2200 0    50   Input ~ 0
ALU10
Text GLabel 7175 2100 0    50   Input ~ 0
ALU11
Text GLabel 7175 2000 0    50   Input ~ 0
ALU12
Text GLabel 7175 1900 0    50   Input ~ 0
ALU13
Text GLabel 7175 1800 0    50   Input ~ 0
ALU14
Text GLabel 7175 1700 0    50   Input ~ 0
ALU15
Wire Wire Line
	7175 2700 6825 2700
Wire Wire Line
	6825 2700 6825 5100
Wire Wire Line
	6825 5100 7150 5100
Wire Wire Line
	7175 2600 6725 2600
Wire Wire Line
	6725 2600 6725 5000
Wire Wire Line
	6725 5000 7150 5000
Text GLabel 8175 2000 2    50   Output ~ 0
A12
Text GLabel 8175 2100 2    50   Output ~ 0
A11
Text GLabel 8175 2200 2    50   Output ~ 0
A10
Text GLabel 8175 2300 2    50   Output ~ 0
A9
Text GLabel 8175 1800 2    50   Output ~ 0
A14
Text GLabel 8175 1900 2    50   Output ~ 0
A13
Text GLabel 8175 1700 2    50   Output ~ 0
A15
Text GLabel 8175 2400 2    50   Output ~ 0
A8
Text GLabel 8150 4400 2    50   Output ~ 0
A4
Text GLabel 8150 4500 2    50   Output ~ 0
A3
Text GLabel 8150 4600 2    50   Output ~ 0
A2
Text GLabel 8150 4700 2    50   Output ~ 0
A1
Text GLabel 8150 4200 2    50   Output ~ 0
A6
Text GLabel 8150 4300 2    50   Output ~ 0
A5
Text GLabel 8150 4100 2    50   Output ~ 0
A7
Text GLabel 8150 4800 2    50   Output ~ 0
A0
$Comp
L 74xx:74LS574 U11
U 1 1 6839F3D1
P 9700 2200
F 0 "U11" H 9700 1975 50  0000 C CNN
F 1 "74HCT574" H 9700 1875 50  0000 C CNN
F 2 "" H 9700 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9700 2200 50  0001 C CNN
	1    9700 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 6839F3D7
P 9700 3000
F 0 "#PWR023" H 9700 2750 50  0001 C CNN
F 1 "GND" H 9705 2827 50  0000 C CNN
F 2 "" H 9700 3000 50  0001 C CNN
F 3 "" H 9700 3000 50  0001 C CNN
	1    9700 3000
	1    0    0    -1  
$EndComp
Text GLabel 9575 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C13
U 1 1 6839F3DE
P 9900 1200
F 0 "C13" H 9992 1246 50  0000 L CNN
F 1 "100n" H 9992 1155 50  0000 L CNN
F 2 "" H 9900 1200 50  0001 C CNN
F 3 "~" H 9900 1200 50  0001 C CNN
	1    9900 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 6839F3E4
P 9900 1300
F 0 "#PWR025" H 9900 1050 50  0001 C CNN
F 1 "GND" H 9905 1127 50  0000 C CNN
F 2 "" H 9900 1300 50  0001 C CNN
F 3 "" H 9900 1300 50  0001 C CNN
	1    9900 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9575 950  9700 950 
Wire Wire Line
	9900 950  9900 1100
Wire Wire Line
	9700 950  9700 1400
Connection ~ 9700 950 
Wire Wire Line
	9700 950  9900 950 
$Comp
L 74xx:74LS574 U10
U 1 1 6839F3EF
P 9675 4600
F 0 "U10" H 9675 4375 50  0000 C CNN
F 1 "74HCT574" H 9675 4275 50  0000 C CNN
F 2 "" H 9675 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9675 4600 50  0001 C CNN
	1    9675 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6839F3F5
P 9675 5400
F 0 "#PWR022" H 9675 5150 50  0001 C CNN
F 1 "GND" H 9680 5227 50  0000 C CNN
F 2 "" H 9675 5400 50  0001 C CNN
F 3 "" H 9675 5400 50  0001 C CNN
	1    9675 5400
	1    0    0    -1  
$EndComp
Text GLabel 9550 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C12
U 1 1 6839F3FC
P 9875 3600
F 0 "C12" H 9967 3646 50  0000 L CNN
F 1 "100n" H 9967 3555 50  0000 L CNN
F 2 "" H 9875 3600 50  0001 C CNN
F 3 "~" H 9875 3600 50  0001 C CNN
	1    9875 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 6839F402
P 9875 3700
F 0 "#PWR024" H 9875 3450 50  0001 C CNN
F 1 "GND" H 9880 3527 50  0000 C CNN
F 2 "" H 9875 3700 50  0001 C CNN
F 3 "" H 9875 3700 50  0001 C CNN
	1    9875 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3350 9675 3350
Wire Wire Line
	9875 3350 9875 3500
Wire Wire Line
	9675 3350 9675 3800
Connection ~ 9675 3350
Wire Wire Line
	9675 3350 9875 3350
Text GLabel 9175 4800 0    50   Input ~ 0
ALU0
Text GLabel 9175 4700 0    50   Input ~ 0
ALU1
Text GLabel 9175 4600 0    50   Input ~ 0
ALU2
Text GLabel 9175 4500 0    50   Input ~ 0
ALU3
Text GLabel 9175 4400 0    50   Input ~ 0
ALU4
Text GLabel 9175 4300 0    50   Input ~ 0
ALU5
Text GLabel 9175 4200 0    50   Input ~ 0
ALU6
Text GLabel 9175 4100 0    50   Input ~ 0
ALU7
Text GLabel 9200 2400 0    50   Input ~ 0
ALU8
Text GLabel 9200 2300 0    50   Input ~ 0
ALU9
Text GLabel 9200 2200 0    50   Input ~ 0
ALU10
Text GLabel 9200 2100 0    50   Input ~ 0
ALU11
Text GLabel 9200 2000 0    50   Input ~ 0
ALU12
Text GLabel 9200 1900 0    50   Input ~ 0
ALU13
Text GLabel 9200 1800 0    50   Input ~ 0
ALU14
Text GLabel 9200 1700 0    50   Input ~ 0
ALU15
Wire Wire Line
	9200 2700 8850 2700
Wire Wire Line
	8850 2700 8850 5100
Wire Wire Line
	9200 2600 8750 2600
Wire Wire Line
	8750 2600 8750 5000
Wire Wire Line
	8750 5000 9175 5000
Text GLabel 10200 2000 2    50   Output ~ 0
A12
Text GLabel 10200 2100 2    50   Output ~ 0
A11
Text GLabel 10200 2200 2    50   Output ~ 0
A10
Text GLabel 10200 2300 2    50   Output ~ 0
A9
Text GLabel 10200 1800 2    50   Output ~ 0
A14
Text GLabel 10200 1900 2    50   Output ~ 0
A13
Text GLabel 10200 1700 2    50   Output ~ 0
A15
Text GLabel 10200 2400 2    50   Output ~ 0
A8
Text GLabel 10175 4400 2    50   Output ~ 0
A4
Text GLabel 10175 4500 2    50   Output ~ 0
A3
Text GLabel 10175 4600 2    50   Output ~ 0
A2
Text GLabel 10175 4700 2    50   Output ~ 0
A1
Text GLabel 10175 4200 2    50   Output ~ 0
A6
Text GLabel 10175 4300 2    50   Output ~ 0
A5
Text GLabel 10175 4100 2    50   Output ~ 0
A7
Text GLabel 10175 4800 2    50   Output ~ 0
A0
$Comp
L 74xx:74LS574 U13
U 1 1 683A8324
P 11750 2200
F 0 "U13" H 11750 1975 50  0000 C CNN
F 1 "74HCT574" H 11750 1875 50  0000 C CNN
F 2 "" H 11750 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 11750 2200 50  0001 C CNN
	1    11750 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 683A832A
P 11750 3000
F 0 "#PWR027" H 11750 2750 50  0001 C CNN
F 1 "GND" H 11755 2827 50  0000 C CNN
F 2 "" H 11750 3000 50  0001 C CNN
F 3 "" H 11750 3000 50  0001 C CNN
	1    11750 3000
	1    0    0    -1  
$EndComp
Text GLabel 11625 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C15
U 1 1 683A8331
P 11950 1200
F 0 "C15" H 12042 1246 50  0000 L CNN
F 1 "100n" H 12042 1155 50  0000 L CNN
F 2 "" H 11950 1200 50  0001 C CNN
F 3 "~" H 11950 1200 50  0001 C CNN
	1    11950 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 683A8337
P 11950 1300
F 0 "#PWR029" H 11950 1050 50  0001 C CNN
F 1 "GND" H 11955 1127 50  0000 C CNN
F 2 "" H 11950 1300 50  0001 C CNN
F 3 "" H 11950 1300 50  0001 C CNN
	1    11950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11625 950  11750 950 
Wire Wire Line
	11950 950  11950 1100
Wire Wire Line
	11750 950  11750 1400
Connection ~ 11750 950 
Wire Wire Line
	11750 950  11950 950 
$Comp
L 74xx:74LS574 U12
U 1 1 683A8342
P 11725 4600
F 0 "U12" H 11725 4375 50  0000 C CNN
F 1 "74HCT574" H 11725 4275 50  0000 C CNN
F 2 "" H 11725 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 11725 4600 50  0001 C CNN
	1    11725 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 683A8348
P 11725 5400
F 0 "#PWR026" H 11725 5150 50  0001 C CNN
F 1 "GND" H 11730 5227 50  0000 C CNN
F 2 "" H 11725 5400 50  0001 C CNN
F 3 "" H 11725 5400 50  0001 C CNN
	1    11725 5400
	1    0    0    -1  
$EndComp
Text GLabel 11600 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C14
U 1 1 683A834F
P 11925 3600
F 0 "C14" H 12017 3646 50  0000 L CNN
F 1 "100n" H 12017 3555 50  0000 L CNN
F 2 "" H 11925 3600 50  0001 C CNN
F 3 "~" H 11925 3600 50  0001 C CNN
	1    11925 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 683A8355
P 11925 3700
F 0 "#PWR028" H 11925 3450 50  0001 C CNN
F 1 "GND" H 11930 3527 50  0000 C CNN
F 2 "" H 11925 3700 50  0001 C CNN
F 3 "" H 11925 3700 50  0001 C CNN
	1    11925 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11600 3350 11725 3350
Wire Wire Line
	11925 3350 11925 3500
Wire Wire Line
	11725 3350 11725 3800
Connection ~ 11725 3350
Wire Wire Line
	11725 3350 11925 3350
Text GLabel 11225 4800 0    50   Input ~ 0
ALU0
Text GLabel 11225 4700 0    50   Input ~ 0
ALU1
Text GLabel 11225 4600 0    50   Input ~ 0
ALU2
Text GLabel 11225 4500 0    50   Input ~ 0
ALU3
Text GLabel 11225 4400 0    50   Input ~ 0
ALU4
Text GLabel 11225 4300 0    50   Input ~ 0
ALU5
Text GLabel 11225 4200 0    50   Input ~ 0
ALU6
Text GLabel 11225 4100 0    50   Input ~ 0
ALU7
Text GLabel 11250 2400 0    50   Input ~ 0
ALU8
Text GLabel 11250 2300 0    50   Input ~ 0
ALU9
Text GLabel 11250 2200 0    50   Input ~ 0
ALU10
Text GLabel 11250 2100 0    50   Input ~ 0
ALU11
Text GLabel 11250 2000 0    50   Input ~ 0
ALU12
Text GLabel 11250 1900 0    50   Input ~ 0
ALU13
Text GLabel 11250 1800 0    50   Input ~ 0
ALU14
Text GLabel 11250 1700 0    50   Input ~ 0
ALU15
Wire Wire Line
	11250 2700 10900 2700
Wire Wire Line
	10900 2700 10900 5100
Wire Wire Line
	11250 2600 10800 2600
Wire Wire Line
	10800 2600 10800 5000
Wire Wire Line
	10800 5000 11225 5000
Text GLabel 12250 2000 2    50   Output ~ 0
A12
Text GLabel 12250 2100 2    50   Output ~ 0
A11
Text GLabel 12250 2200 2    50   Output ~ 0
A10
Text GLabel 12250 2300 2    50   Output ~ 0
A9
Text GLabel 12250 1800 2    50   Output ~ 0
A14
Text GLabel 12250 1900 2    50   Output ~ 0
A13
Text GLabel 12250 1700 2    50   Output ~ 0
A15
Text GLabel 12250 2400 2    50   Output ~ 0
A8
Text GLabel 12225 4400 2    50   Output ~ 0
A4
Text GLabel 12225 4500 2    50   Output ~ 0
A3
Text GLabel 12225 4600 2    50   Output ~ 0
A2
Text GLabel 12225 4700 2    50   Output ~ 0
A1
Text GLabel 12225 4200 2    50   Output ~ 0
A6
Text GLabel 12225 4300 2    50   Output ~ 0
A5
Text GLabel 12225 4100 2    50   Output ~ 0
A7
Text GLabel 12225 4800 2    50   Output ~ 0
A0
Text GLabel 6625 5100 0    50   Input ~ 0
#OUT_PC
Wire Wire Line
	6625 5100 6825 5100
Connection ~ 6825 5100
Text GLabel 8650 5100 0    50   Input ~ 0
#OUT_SP
Wire Wire Line
	8650 5100 8850 5100
Connection ~ 8850 5100
Wire Wire Line
	8850 5100 9175 5100
Text GLabel 10700 5100 0    50   Input ~ 0
#OUT_DP
Wire Wire Line
	10700 5100 10900 5100
Connection ~ 10900 5100
Wire Wire Line
	10900 5100 11225 5100
Text GLabel 6625 5000 0    50   Input ~ 0
WR_PC
Wire Wire Line
	6625 5000 6725 5000
Connection ~ 6725 5000
Text GLabel 8650 5000 0    50   Input ~ 0
WR_SP
Wire Wire Line
	8650 5000 8750 5000
Connection ~ 8750 5000
Text GLabel 10700 5000 0    50   Input ~ 0
WR_DP
Wire Wire Line
	10700 5000 10800 5000
Connection ~ 10800 5000
$Comp
L 74xx:74LS573 U14
U 1 1 683FCD6A
P 13825 2200
F 0 "U14" H 13825 2000 50  0000 C CNN
F 1 "74HCT573" H 13825 1900 50  0000 C CNN
F 2 "" H 13825 2200 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 13825 2200 50  0001 C CNN
	1    13825 2200
	1    0    0    -1  
$EndComp
Text GLabel 13700 950  0    50   Input ~ 10
5V
$Comp
L Device:C_Small C16
U 1 1 683FEBF4
P 14025 1200
F 0 "C16" H 14117 1246 50  0000 L CNN
F 1 "100n" H 14117 1155 50  0000 L CNN
F 2 "" H 14025 1200 50  0001 C CNN
F 3 "~" H 14025 1200 50  0001 C CNN
	1    14025 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 683FEBFA
P 14025 1300
F 0 "#PWR032" H 14025 1050 50  0001 C CNN
F 1 "GND" H 14030 1127 50  0000 C CNN
F 2 "" H 14025 1300 50  0001 C CNN
F 3 "" H 14025 1300 50  0001 C CNN
	1    14025 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	13700 950  13825 950 
Wire Wire Line
	14025 950  14025 1100
Wire Wire Line
	13825 950  13825 1400
Connection ~ 13825 950 
Wire Wire Line
	13825 950  14025 950 
$Comp
L power:GND #PWR030
U 1 1 68405B00
P 13825 3000
F 0 "#PWR030" H 13825 2750 50  0001 C CNN
F 1 "GND" H 13830 2827 50  0000 C CNN
F 2 "" H 13825 3000 50  0001 C CNN
F 3 "" H 13825 3000 50  0001 C CNN
	1    13825 3000
	1    0    0    -1  
$EndComp
Text GLabel 13325 2400 0    50   Input ~ 0
A8
Text GLabel 13325 2300 0    50   Input ~ 0
A9
Text GLabel 13325 2200 0    50   Input ~ 0
A10
Text GLabel 13325 2000 0    50   Input ~ 0
A11
Text GLabel 13325 2100 0    50   Input ~ 0
A12
Text GLabel 13325 1900 0    50   Input ~ 0
A13
Text GLabel 13325 1800 0    50   Input ~ 0
A14
Text GLabel 13325 1700 0    50   Input ~ 0
A15
Text GLabel 14325 1700 2    50   Output ~ 0
D7
Text GLabel 14325 1800 2    50   Output ~ 0
D6
Text GLabel 14325 1900 2    50   Output ~ 0
D5
Text GLabel 14325 2000 2    50   Output ~ 0
D4
Text GLabel 14325 2100 2    50   Output ~ 0
D3
Text GLabel 14325 2200 2    50   Output ~ 0
D2
Text GLabel 14325 2300 2    50   Output ~ 0
D1
Text GLabel 14325 2400 2    50   Output ~ 0
D0
$Comp
L 74xx:74LS573 U15
U 1 1 68428E3A
P 13825 4600
F 0 "U15" H 13825 4400 50  0000 C CNN
F 1 "74HCT573" H 13825 4300 50  0000 C CNN
F 2 "" H 13825 4600 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 13825 4600 50  0001 C CNN
	1    13825 4600
	1    0    0    -1  
$EndComp
Text GLabel 13700 3350 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C17
U 1 1 68428E41
P 14025 3600
F 0 "C17" H 14117 3646 50  0000 L CNN
F 1 "100n" H 14117 3555 50  0000 L CNN
F 2 "" H 14025 3600 50  0001 C CNN
F 3 "~" H 14025 3600 50  0001 C CNN
	1    14025 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 68428E47
P 14025 3700
F 0 "#PWR033" H 14025 3450 50  0001 C CNN
F 1 "GND" H 14030 3527 50  0000 C CNN
F 2 "" H 14025 3700 50  0001 C CNN
F 3 "" H 14025 3700 50  0001 C CNN
	1    14025 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13700 3350 13825 3350
Wire Wire Line
	14025 3350 14025 3500
Wire Wire Line
	13825 3350 13825 3800
Connection ~ 13825 3350
Wire Wire Line
	13825 3350 14025 3350
$Comp
L power:GND #PWR031
U 1 1 68428E52
P 13825 5400
F 0 "#PWR031" H 13825 5150 50  0001 C CNN
F 1 "GND" H 13830 5227 50  0000 C CNN
F 2 "" H 13825 5400 50  0001 C CNN
F 3 "" H 13825 5400 50  0001 C CNN
	1    13825 5400
	1    0    0    -1  
$EndComp
Text GLabel 13325 4800 0    50   Input ~ 0
A0
Text GLabel 13325 4700 0    50   Input ~ 0
A1
Text GLabel 13325 4600 0    50   Input ~ 0
A2
Text GLabel 13325 4400 0    50   Input ~ 0
A4
Text GLabel 13325 4500 0    50   Input ~ 0
A3
Text GLabel 13325 4300 0    50   Input ~ 0
A5
Text GLabel 13325 4200 0    50   Input ~ 0
A6
Text GLabel 13325 4100 0    50   Input ~ 0
A7
Text GLabel 14325 4100 2    50   Output ~ 0
D7
Text GLabel 14325 4200 2    50   Output ~ 0
D6
Text GLabel 14325 4300 2    50   Output ~ 0
D5
Text GLabel 14325 4400 2    50   Output ~ 0
D4
Text GLabel 14325 4500 2    50   Output ~ 0
D3
Text GLabel 14325 4600 2    50   Output ~ 0
D2
Text GLabel 14325 4700 2    50   Output ~ 0
D1
Text GLabel 14325 4800 2    50   Output ~ 0
D0
Wire Wire Line
	13325 2600 12950 2600
Wire Wire Line
	12950 2600 12950 5000
Text GLabel 12850 5000 0    50   Input ~ 0
ST_ADDR
Text GLabel 13325 5100 0    50   Input ~ 0
#RD_ADDR_L
Text GLabel 13325 2700 0    50   Input ~ 0
#RD_ADDR_H
Wire Wire Line
	12950 5000 13325 5000
Wire Wire Line
	12850 5000 12950 5000
Connection ~ 12950 5000
$Comp
L Connector:Conn_01x34_Female J3
U 1 1 68451659
P 15625 3100
F 0 "J3" H 15550 4975 50  0000 L CNN
F 1 "To I/O board" H 15375 4875 50  0000 L CNN
F 2 "" H 15625 3100 50  0001 C CNN
F 3 "~" H 15625 3100 50  0001 C CNN
	1    15625 3100
	1    0    0    -1  
$EndComp
Text GLabel 15425 1700 0    50   3State ~ 0
D7
Text GLabel 15425 1800 0    50   3State ~ 0
D6
Text GLabel 15425 1900 0    50   3State ~ 0
D5
Text GLabel 15425 2000 0    50   3State ~ 0
D4
Text GLabel 15425 2100 0    50   3State ~ 0
D3
Text GLabel 15425 2200 0    50   3State ~ 0
D2
Text GLabel 15425 2300 0    50   3State ~ 0
D1
Text GLabel 15425 2400 0    50   3State ~ 0
D0
Wire Wire Line
	15425 1600 15425 1500
Text GLabel 15300 1500 0    50   Input ~ 10
5V
Wire Wire Line
	15300 1500 15425 1500
Connection ~ 15425 1500
$Comp
L power:GND #PWR034
U 1 1 684973E0
P 15425 4800
F 0 "#PWR034" H 15425 4550 50  0001 C CNN
F 1 "GND" H 15430 4627 50  0000 C CNN
F 2 "" H 15425 4800 50  0001 C CNN
F 3 "" H 15425 4800 50  0001 C CNN
	1    15425 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	15425 4800 15425 4700
Connection ~ 15425 4800
Connection ~ 15425 4700
Wire Wire Line
	15425 4700 15425 4600
Text GLabel 15425 2500 0    50   Input ~ 0
#WR_M
Text GLabel 15425 2600 0    50   Input ~ 0
#RD_M
Text GLabel 15425 2700 0    50   Input ~ 0
#RST
Text GLabel 15425 2800 0    50   Output ~ 0
INT
Text GLabel 15425 2900 0    50   Input ~ 0
#INTA
Text GLabel 15425 3700 0    50   Input ~ 0
A8
Text GLabel 15425 3600 0    50   Input ~ 0
A9
Text GLabel 15425 3500 0    50   Input ~ 0
A10
Text GLabel 15425 3300 0    50   Input ~ 0
A11
Text GLabel 15425 3400 0    50   Input ~ 0
A12
Text GLabel 15425 3200 0    50   Input ~ 0
A13
Text GLabel 15425 3100 0    50   Input ~ 0
A14
Text GLabel 15425 3000 0    50   Input ~ 0
A15
Text GLabel 15425 4500 0    50   Input ~ 0
A0
Text GLabel 15425 4400 0    50   Input ~ 0
A1
Text GLabel 15425 4300 0    50   Input ~ 0
A2
Text GLabel 15425 4100 0    50   Input ~ 0
A4
Text GLabel 15425 4200 0    50   Input ~ 0
A3
Text GLabel 15425 4000 0    50   Input ~ 0
A5
Text GLabel 15425 3900 0    50   Input ~ 0
A6
Text GLabel 15425 3800 0    50   Input ~ 0
A7
Text Notes 3650 2975 0    50   ~ 10
ADDR_WRITE Register
Text Notes 7800 2975 0    50   ~ 10
Program Counter
Text Notes 9825 2975 0    50   ~ 10
Stack Pointer
Text Notes 11900 2975 0    50   ~ 10
Data Pointer
Text Notes 13975 2975 0    50   ~ 10
ADDR_READ Register
Text Notes 4225 9350 0    118  ~ 24
Address ALU
Text Notes 3075 8975 0    79   ~ 16
Lower EPROM
Text Notes 5800 8975 0    79   ~ 16
Upper EPROM
$EndSCHEMATC
