EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Memory & I/O board for 8-bit CPU"
Date "2025-06-23"
Rev "2"
Comp "MINT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x34_Female J1
U 1 1 680D2FB9
P 1375 2650
F 0 "J1" H 1275 4450 50  0000 C CNN
F 1 "From address board" H 1275 4375 50  0000 C CNN
F 2 "" H 1375 2650 50  0001 C CNN
F 3 "~" H 1375 2650 50  0001 C CNN
	1    1375 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1575 1050 1575 1100
Wire Wire Line
	1575 4150 1575 4250
Connection ~ 1575 4250
Wire Wire Line
	1575 4250 1575 4350
$Comp
L power:GND #PWR02
U 1 1 680D9AD5
P 1575 4350
F 0 "#PWR02" H 1575 4100 50  0001 C CNN
F 1 "GND" H 1580 4177 50  0000 C CNN
F 2 "" H 1575 4350 50  0001 C CNN
F 3 "" H 1575 4350 50  0001 C CNN
	1    1575 4350
	1    0    0    -1  
$EndComp
Connection ~ 1575 4350
Text GLabel 3150 1100 2    50   Output ~ 10
5V
Connection ~ 1575 1100
Wire Wire Line
	1575 1100 1575 1150
Text GLabel 1575 1250 2    50   3State ~ 0
D7
Text GLabel 1575 1350 2    50   3State ~ 0
D6
Text GLabel 1575 1450 2    50   3State ~ 0
D5
Text GLabel 1575 1550 2    50   3State ~ 0
D4
Text GLabel 1575 1650 2    50   3State ~ 0
D3
Text GLabel 1575 1750 2    50   3State ~ 0
D2
Text GLabel 1575 1850 2    50   3State ~ 0
D1
Text GLabel 1575 1950 2    50   3State ~ 0
D0
Text GLabel 1575 2050 2    50   Output ~ 0
#WR_M
Text GLabel 1575 2150 2    50   Output ~ 0
#RD_M
Text GLabel 1575 2250 2    50   Output ~ 0
#RST
Text GLabel 1575 2350 2    50   Input ~ 0
INT
Text GLabel 1575 2450 2    50   Output ~ 0
#INTA
Text GLabel 1575 2550 2    50   Output ~ 0
A15
Text GLabel 1575 2650 2    50   Output ~ 0
A14
Text GLabel 1575 2750 2    50   Output ~ 0
A13
Text GLabel 1575 2850 2    50   Output ~ 0
A12
Text GLabel 1575 2950 2    50   Output ~ 0
A11
Text GLabel 1575 3150 2    50   Output ~ 0
A9
Text GLabel 1575 3250 2    50   Output ~ 0
A8
Text GLabel 1575 3350 2    50   Output ~ 0
A7
Text GLabel 1575 3450 2    50   Output ~ 0
A6
Text GLabel 1575 3550 2    50   Output ~ 0
A5
Text GLabel 1575 3650 2    50   Output ~ 0
A4
Text GLabel 1575 3750 2    50   Output ~ 0
A3
Text GLabel 1575 3850 2    50   Output ~ 0
A2
Text GLabel 1575 3950 2    50   Output ~ 0
A1
Text GLabel 1575 4050 2    50   Output ~ 0
A0
Text GLabel 1575 3050 2    50   Output ~ 0
A10
$Comp
L 74xx:74HCT02 U2
U 1 1 680DCBAF
P 3075 2850
F 0 "U2" H 3075 3175 50  0000 C CNN
F 1 "74HCT02" H 3075 3084 50  0000 C CNN
F 2 "" H 3075 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 3075 2850 50  0001 C CNN
	1    3075 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U2
U 2 1 680DDC19
P 3075 3425
F 0 "U2" H 3075 3750 50  0000 C CNN
F 1 "74HCT02" H 3075 3659 50  0000 C CNN
F 2 "" H 3075 3425 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 3075 3425 50  0001 C CNN
	2    3075 3425
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U2
U 3 1 680DF0A8
P 3075 4000
F 0 "U2" H 3075 4325 50  0000 C CNN
F 1 "74HCT02" H 3075 4234 50  0000 C CNN
F 2 "" H 3075 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 3075 4000 50  0001 C CNN
	3    3075 4000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U2
U 4 1 680E0CAF
P 3075 4600
F 0 "U2" H 3075 4925 50  0000 C CNN
F 1 "74HCT02" H 3075 4834 50  0000 C CNN
F 2 "" H 3075 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 3075 4600 50  0001 C CNN
	4    3075 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 680E45BE
P 4575 950
F 0 "C3" H 4667 996 50  0000 L CNN
F 1 "100n" H 4667 905 50  0000 L CNN
F 2 "" H 4575 950 50  0001 C CNN
F 3 "~" H 4575 950 50  0001 C CNN
	1    4575 950 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D1
U 1 1 680E5456
P 2025 1300
F 0 "D1" V 1979 1380 50  0000 L CNN
F 1 "1N5819" V 2070 1380 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2025 1125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 2025 1300 50  0001 C CNN
	1    2025 1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 680E6058
P 2025 1450
F 0 "#PWR03" H 2025 1200 50  0001 C CNN
F 1 "GND" H 2030 1277 50  0000 C CNN
F 2 "" H 2025 1450 50  0001 C CNN
F 3 "" H 2025 1450 50  0001 C CNN
	1    2025 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 680E7A0F
P 2575 1350
F 0 "C1" H 2663 1396 50  0000 L CNN
F 1 "47u" H 2663 1305 50  0000 L CNN
F 2 "" H 2575 1350 50  0001 C CNN
F 3 "~" H 2575 1350 50  0001 C CNN
	1    2575 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 680E7F2D
P 2950 1350
F 0 "C2" H 3042 1396 50  0000 L CNN
F 1 "1u" H 3042 1305 50  0000 L CNN
F 2 "" H 2950 1350 50  0001 C CNN
F 3 "~" H 2950 1350 50  0001 C CNN
	1    2950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1575 1100 2025 1100
Wire Wire Line
	2025 1150 2025 1100
Connection ~ 2025 1100
Wire Wire Line
	2025 1100 2575 1100
Wire Wire Line
	2575 1250 2575 1100
Connection ~ 2575 1100
Wire Wire Line
	2575 1100 2950 1100
Wire Wire Line
	2950 1250 2950 1100
Connection ~ 2950 1100
Wire Wire Line
	2950 1100 3150 1100
$Comp
L power:GND #PWR04
U 1 1 680EAD76
P 2575 1450
F 0 "#PWR04" H 2575 1200 50  0001 C CNN
F 1 "GND" H 2580 1277 50  0000 C CNN
F 2 "" H 2575 1450 50  0001 C CNN
F 3 "" H 2575 1450 50  0001 C CNN
	1    2575 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 680EB059
P 2950 1450
F 0 "#PWR05" H 2950 1200 50  0001 C CNN
F 1 "GND" H 2955 1277 50  0000 C CNN
F 2 "" H 2950 1450 50  0001 C CNN
F 3 "" H 2950 1450 50  0001 C CNN
	1    2950 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 680EBC8A
P 4575 1050
F 0 "#PWR07" H 4575 800 50  0001 C CNN
F 1 "GND" H 4580 877 50  0000 C CNN
F 2 "" H 4575 1050 50  0001 C CNN
F 3 "" H 4575 1050 50  0001 C CNN
	1    4575 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4425 1125 4425 775 
Wire Wire Line
	4425 775  4575 775 
Wire Wire Line
	4575 775  4575 850 
Text GLabel 4325 775  0    50   Input ~ 10
5V
Wire Wire Line
	4325 775  4425 775 
Connection ~ 4425 775 
$Comp
L power:GND #PWR06
U 1 1 680EE188
P 4425 2125
F 0 "#PWR06" H 4425 1875 50  0001 C CNN
F 1 "GND" H 4430 1952 50  0000 C CNN
F 2 "" H 4425 2125 50  0001 C CNN
F 3 "" H 4425 2125 50  0001 C CNN
	1    4425 2125
	1    0    0    -1  
$EndComp
Text GLabel 2775 2750 0    50   Input ~ 0
A14
Text GLabel 2775 2950 0    50   Input ~ 0
A13
Text GLabel 2775 3325 0    50   Input ~ 0
A12
Text GLabel 2775 3525 0    50   Input ~ 0
A11
Text GLabel 2775 3900 0    50   Input ~ 0
A10
Text GLabel 2775 4100 0    50   Input ~ 0
A9
Text GLabel 2775 4500 0    50   Input ~ 0
A8
Text GLabel 2775 4700 0    50   Input ~ 0
A7
$Comp
L 74xx:74HCT00 U1
U 1 1 680FEACC
P 3800 3125
F 0 "U1" H 3800 3450 50  0000 C CNN
F 1 "74HCT00" H 3800 3359 50  0000 C CNN
F 2 "" H 3800 3125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct00" H 3800 3125 50  0001 C CNN
	1    3800 3125
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT00 U1
U 2 1 681023A3
P 3800 4300
F 0 "U1" H 3800 4625 50  0000 C CNN
F 1 "74HCT00" H 3800 4534 50  0000 C CNN
F 2 "" H 3800 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct00" H 3800 4300 50  0001 C CNN
	2    3800 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT00 U1
U 3 1 68104DEB
P 6525 4700
F 0 "U1" H 6525 5025 50  0000 C CNN
F 1 "74HCT00" H 6525 4934 50  0000 C CNN
F 2 "" H 6525 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct00" H 6525 4700 50  0001 C CNN
	3    6525 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT00 U1
U 4 1 6810624A
P 3075 2200
F 0 "U1" H 3075 2525 50  0000 C CNN
F 1 "74HCT00" H 3075 2434 50  0000 C CNN
F 2 "" H 3075 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct00" H 3075 2200 50  0001 C CNN
	4    3075 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT00 U1
U 5 1 681071FD
P 5425 1625
F 0 "U1" H 5655 1671 50  0000 L CNN
F 1 "74HCT00" H 5655 1580 50  0000 L CNN
F 2 "" H 5425 1625 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct00" H 5425 1625 50  0001 C CNN
	5    5425 1625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 6810C1DD
P 5425 2125
F 0 "#PWR010" H 5425 1875 50  0001 C CNN
F 1 "GND" H 5430 1952 50  0000 C CNN
F 2 "" H 5425 2125 50  0001 C CNN
F 3 "" H 5425 2125 50  0001 C CNN
	1    5425 2125
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 6810D07C
P 5575 950
F 0 "C5" H 5667 996 50  0000 L CNN
F 1 "100n" H 5667 905 50  0000 L CNN
F 2 "" H 5575 950 50  0001 C CNN
F 3 "~" H 5575 950 50  0001 C CNN
	1    5575 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 6810D082
P 5575 1050
F 0 "#PWR011" H 5575 800 50  0001 C CNN
F 1 "GND" H 5580 877 50  0000 C CNN
F 2 "" H 5575 1050 50  0001 C CNN
F 3 "" H 5575 1050 50  0001 C CNN
	1    5575 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5425 1125 5425 775 
Wire Wire Line
	5425 775  5575 775 
Wire Wire Line
	5575 775  5575 850 
Text GLabel 5325 775  0    50   Input ~ 10
5V
Wire Wire Line
	5325 775  5425 775 
Connection ~ 5425 775 
Wire Wire Line
	3375 2850 3425 2850
Wire Wire Line
	3425 2850 3425 3025
Wire Wire Line
	3425 3025 3500 3025
Wire Wire Line
	3375 3425 3425 3425
Wire Wire Line
	3425 3425 3425 3225
Wire Wire Line
	3425 3225 3500 3225
Wire Wire Line
	3375 4000 3425 4000
Wire Wire Line
	3425 4000 3425 4200
Wire Wire Line
	3425 4200 3500 4200
Wire Wire Line
	3375 4600 3425 4600
Wire Wire Line
	3425 4600 3425 4400
Wire Wire Line
	3425 4400 3500 4400
$Comp
L 74xx:74LS138 U4
U 1 1 68114DCE
P 5225 3700
F 0 "U4" H 5200 3725 50  0000 C CNN
F 1 "74HCT138" H 5175 3625 50  0000 C CNN
F 2 "" H 5225 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5225 3700 50  0001 C CNN
	1    5225 3700
	1    0    0    -1  
$EndComp
Text GLabel 4725 3900 0    50   Input ~ 0
A15
$Comp
L power:GND #PWR08
U 1 1 68127F62
P 5225 4400
F 0 "#PWR08" H 5225 4150 50  0001 C CNN
F 1 "GND" H 5230 4227 50  0000 C CNN
F 2 "" H 5225 4400 50  0001 C CNN
F 3 "" H 5225 4400 50  0001 C CNN
	1    5225 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 68129207
P 5375 2925
F 0 "C4" H 5467 2971 50  0000 L CNN
F 1 "100n" H 5467 2880 50  0000 L CNN
F 2 "" H 5375 2925 50  0001 C CNN
F 3 "~" H 5375 2925 50  0001 C CNN
	1    5375 2925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 6812920D
P 5375 3025
F 0 "#PWR09" H 5375 2775 50  0001 C CNN
F 1 "GND" H 5380 2852 50  0000 C CNN
F 2 "" H 5375 3025 50  0001 C CNN
F 3 "" H 5375 3025 50  0001 C CNN
	1    5375 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	5225 3100 5225 2750
Wire Wire Line
	5225 2750 5375 2750
Wire Wire Line
	5375 2750 5375 2825
Text GLabel 5125 2750 0    50   Input ~ 10
5V
Wire Wire Line
	5125 2750 5225 2750
Connection ~ 5225 2750
Text GLabel 4725 3400 0    50   Input ~ 0
A4
Text GLabel 4725 3500 0    50   Input ~ 0
A5
Text GLabel 4725 3600 0    50   Input ~ 0
A6
Wire Wire Line
	4100 4300 4325 4300
Wire Wire Line
	4325 4300 4325 4100
Wire Wire Line
	4325 4100 4725 4100
Wire Wire Line
	4100 3125 4325 3125
Wire Wire Line
	4325 3125 4325 4000
$Comp
L 74xx:74HCT02 U3
U 1 1 6812C6E4
P 4750 4800
F 0 "U3" H 4750 5125 50  0000 C CNN
F 1 "74HCT02" H 4750 5034 50  0000 C CNN
F 2 "" H 4750 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 4750 4800 50  0001 C CNN
	1    4750 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U3
U 2 1 6812D998
P 5650 4800
F 0 "U3" H 5650 5125 50  0000 C CNN
F 1 "74HCT02" H 5650 5034 50  0000 C CNN
F 2 "" H 5650 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 5650 4800 50  0001 C CNN
	2    5650 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U3
U 3 1 6812F39C
P 5750 5400
F 0 "U3" H 5750 5725 50  0000 C CNN
F 1 "74HCT02" H 5750 5634 50  0000 C CNN
F 2 "" H 5750 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 5750 5400 50  0001 C CNN
	3    5750 5400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U3
U 4 1 681317C0
P 6525 5400
F 0 "U3" H 6525 5725 50  0000 C CNN
F 1 "74HCT02" H 6525 5634 50  0000 C CNN
F 2 "" H 6525 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 6525 5400 50  0001 C CNN
	4    6525 5400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U3
U 5 1 68133AC0
P 6450 1625
F 0 "U3" H 6680 1671 50  0000 L CNN
F 1 "74HCT02" H 6680 1580 50  0000 L CNN
F 2 "" H 6450 1625 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 6450 1625 50  0001 C CNN
	5    6450 1625
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 68137A15
P 6600 950
F 0 "C6" H 6692 996 50  0000 L CNN
F 1 "100n" H 6692 905 50  0000 L CNN
F 2 "" H 6600 950 50  0001 C CNN
F 3 "~" H 6600 950 50  0001 C CNN
	1    6600 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 68137A1B
P 6600 1050
F 0 "#PWR013" H 6600 800 50  0001 C CNN
F 1 "GND" H 6605 877 50  0000 C CNN
F 2 "" H 6600 1050 50  0001 C CNN
F 3 "" H 6600 1050 50  0001 C CNN
	1    6600 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1125 6450 775 
Wire Wire Line
	6450 775  6600 775 
Wire Wire Line
	6600 775  6600 850 
Text GLabel 6350 775  0    50   Input ~ 10
5V
Wire Wire Line
	6350 775  6450 775 
Connection ~ 6450 775 
$Comp
L power:GND #PWR012
U 1 1 681381B0
P 6450 2125
F 0 "#PWR012" H 6450 1875 50  0001 C CNN
F 1 "GND" H 6455 1952 50  0000 C CNN
F 2 "" H 6450 2125 50  0001 C CNN
F 3 "" H 6450 2125 50  0001 C CNN
	1    6450 2125
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U2
U 5 1 680E2319
P 4425 1625
F 0 "U2" H 4655 1671 50  0000 L CNN
F 1 "74HCT02" H 4655 1580 50  0000 L CNN
F 2 "" H 4425 1625 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hct02" H 4425 1625 50  0001 C CNN
	5    4425 1625
	1    0    0    -1  
$EndComp
Text GLabel 5725 4100 2    50   Output ~ 0
#S7
Text GLabel 5725 4000 2    50   Output ~ 0
#S6
Text GLabel 5725 3900 2    50   Output ~ 0
#S5
Text GLabel 5725 3800 2    50   Output ~ 0
#S4
Text GLabel 5725 3700 2    50   Output ~ 0
#S3
Text GLabel 5725 3600 2    50   Output ~ 0
#S2
Text GLabel 5725 3500 2    50   Output ~ 0
#S1
Text GLabel 5725 3400 2    50   Output ~ 0
#S0
Wire Wire Line
	4325 4300 4325 4900
Wire Wire Line
	4325 4900 4450 4900
Connection ~ 4325 4300
Wire Wire Line
	4325 4000 4400 4000
Wire Wire Line
	4450 4700 4400 4700
Wire Wire Line
	4400 4700 4400 4000
Connection ~ 4400 4000
Wire Wire Line
	4400 4000 4725 4000
Wire Wire Line
	5350 4700 5350 4800
Wire Wire Line
	5350 4800 5050 4800
Connection ~ 5350 4800
Wire Wire Line
	5350 4800 5350 4900
Wire Wire Line
	5950 4800 6225 4800
Text GLabel 6225 4600 0    50   Input ~ 0
A15
Text GLabel 6825 4700 2    50   Output ~ 0
#RAM_CS
Wire Wire Line
	2775 2100 2775 2200
Text GLabel 2675 2200 0    50   Input ~ 0
#RST
Wire Wire Line
	2675 2200 2775 2200
Connection ~ 2775 2200
Wire Wire Line
	2775 2200 2775 2300
Text GLabel 3375 2200 2    50   Output ~ 0
RST
Text GLabel 5450 5500 0    50   Input ~ 0
#WR_M
Text GLabel 5450 5300 0    50   Input ~ 0
A15
Wire Wire Line
	6225 5300 6225 5400
Wire Wire Line
	6050 5400 6225 5400
Connection ~ 6225 5400
Wire Wire Line
	6225 5400 6225 5500
Text GLabel 6825 5400 2    50   Output ~ 0
#XMEM_WR
$Comp
L Memory_RAM:CY62256-70PC U5
U 1 1 6816C747
P 8775 2200
F 0 "U5" H 8775 2200 50  0000 C CNN
F 1 "32K RAM" H 8775 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8775 2100 50  0001 C CNN
F 3 "https://ecee.colorado.edu/~mcclurel/Cypress_SRAM_CY62256.pdf" H 8775 2100 50  0001 C CNN
	1    8775 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 68172E76
P 8925 1025
F 0 "C7" H 9017 1071 50  0000 L CNN
F 1 "100n" H 9017 980 50  0000 L CNN
F 2 "" H 8925 1025 50  0001 C CNN
F 3 "~" H 8925 1025 50  0001 C CNN
	1    8925 1025
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 1300 8775 850 
Wire Wire Line
	8775 850  8925 850 
Wire Wire Line
	8925 850  8925 925 
Text GLabel 8675 850  0    50   Input ~ 10
5V
Wire Wire Line
	8675 850  8775 850 
Connection ~ 8775 850 
$Comp
L power:GND #PWR017
U 1 1 68173D2D
P 8925 1125
F 0 "#PWR017" H 8925 875 50  0001 C CNN
F 1 "GND" H 8930 952 50  0000 C CNN
F 2 "" H 8925 1125 50  0001 C CNN
F 3 "" H 8925 1125 50  0001 C CNN
	1    8925 1125
	1    0    0    -1  
$EndComp
Text GLabel 8275 1500 0    50   Input ~ 0
A0
Text GLabel 8275 1600 0    50   Input ~ 0
A1
Text GLabel 8275 1700 0    50   Input ~ 0
A2
Text GLabel 8275 1800 0    50   Input ~ 0
A3
Text GLabel 8275 1900 0    50   Input ~ 0
A4
Text GLabel 8275 2000 0    50   Input ~ 0
A5
Text GLabel 8275 2100 0    50   Input ~ 0
A6
Text GLabel 8275 2200 0    50   Input ~ 0
A7
Text GLabel 8275 2300 0    50   Input ~ 0
A8
Text GLabel 8275 2400 0    50   Input ~ 0
A9
Text GLabel 8275 2500 0    50   Input ~ 0
A10
Text GLabel 8275 2600 0    50   Input ~ 0
A11
Text GLabel 8275 2700 0    50   Input ~ 0
A12
Text GLabel 8275 2800 0    50   Input ~ 0
A13
Text GLabel 8275 2900 0    50   Input ~ 0
A14
$Comp
L power:GND #PWR015
U 1 1 6817C681
P 8775 3100
F 0 "#PWR015" H 8775 2850 50  0001 C CNN
F 1 "GND" H 8780 2927 50  0000 C CNN
F 2 "" H 8775 3100 50  0001 C CNN
F 3 "" H 8775 3100 50  0001 C CNN
	1    8775 3100
	1    0    0    -1  
$EndComp
Text GLabel 9275 2400 2    50   Input ~ 0
#RAM_CS
Text GLabel 8375 6350 0    50   Input ~ 0
#RD_M
Text GLabel 9275 2700 2    50   Input ~ 0
#WR_M
Text GLabel 9275 2200 2    50   3State ~ 0
D7
Text GLabel 9275 2100 2    50   3State ~ 0
D6
Text GLabel 9275 2000 2    50   3State ~ 0
D5
Text GLabel 9275 1900 2    50   3State ~ 0
D4
Text GLabel 9275 1800 2    50   3State ~ 0
D3
Text GLabel 9275 1700 2    50   3State ~ 0
D2
Text GLabel 9275 1600 2    50   3State ~ 0
D1
Text GLabel 9275 1500 2    50   3State ~ 0
D0
$Comp
L Memory_EPROM:27C040 U6
U 1 1 681934DC
P 8775 5250
F 0 "U6" H 8800 5275 50  0000 C CNN
F 1 "32K ROM" H 8850 5175 50  0000 C CNN
F 2 "" H 8775 5250 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/doc0189.pdf" H 8775 5250 50  0001 C CNN
	1    8775 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 681970E5
P 8925 3675
F 0 "C8" H 9017 3721 50  0000 L CNN
F 1 "100n" H 9017 3630 50  0000 L CNN
F 2 "" H 8925 3675 50  0001 C CNN
F 3 "~" H 8925 3675 50  0001 C CNN
	1    8925 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 3950 8775 3500
Wire Wire Line
	8775 3500 8925 3500
Wire Wire Line
	8925 3500 8925 3575
Text GLabel 8675 3500 0    50   Input ~ 10
5V
Wire Wire Line
	8675 3500 8775 3500
Connection ~ 8775 3500
$Comp
L power:GND #PWR018
U 1 1 681970F1
P 8925 3775
F 0 "#PWR018" H 8925 3525 50  0001 C CNN
F 1 "GND" H 8930 3602 50  0000 C CNN
F 2 "" H 8925 3775 50  0001 C CNN
F 3 "" H 8925 3775 50  0001 C CNN
	1    8925 3775
	1    0    0    -1  
$EndComp
Text GLabel 9175 4850 2    50   3State ~ 0
D7
Text GLabel 9175 4750 2    50   3State ~ 0
D6
Text GLabel 9175 4650 2    50   3State ~ 0
D5
Text GLabel 9175 4550 2    50   3State ~ 0
D4
Text GLabel 9175 4450 2    50   3State ~ 0
D3
Text GLabel 9175 4350 2    50   3State ~ 0
D2
Text GLabel 9175 4250 2    50   3State ~ 0
D1
Text GLabel 9175 4150 2    50   3State ~ 0
D0
Text GLabel 8375 4150 0    50   Input ~ 0
A0
Text GLabel 8375 4250 0    50   Input ~ 0
A1
Text GLabel 8375 4350 0    50   Input ~ 0
A2
Text GLabel 8375 4450 0    50   Input ~ 0
A3
Text GLabel 8375 4550 0    50   Input ~ 0
A4
Text GLabel 8375 4650 0    50   Input ~ 0
A5
Text GLabel 8375 4750 0    50   Input ~ 0
A6
Text GLabel 8375 4850 0    50   Input ~ 0
A7
Text GLabel 8375 4950 0    50   Input ~ 0
A8
Text GLabel 8375 5050 0    50   Input ~ 0
A9
Text GLabel 8375 5150 0    50   Input ~ 0
A10
Text GLabel 8375 5250 0    50   Input ~ 0
A11
Text GLabel 8375 5350 0    50   Input ~ 0
A12
Text GLabel 8375 5450 0    50   Input ~ 0
A13
Text GLabel 8375 5550 0    50   Input ~ 0
A14
Wire Wire Line
	8375 5650 8275 5650
Wire Wire Line
	8275 5650 8275 5750
Wire Wire Line
	8275 6150 8375 6150
Wire Wire Line
	8375 5750 8275 5750
Connection ~ 8275 5750
Wire Wire Line
	8275 5750 8275 6150
Wire Wire Line
	8375 5850 8375 5900
$Comp
L power:GND #PWR016
U 1 1 681A39BC
P 8775 6550
F 0 "#PWR016" H 8775 6300 50  0001 C CNN
F 1 "GND" H 8780 6377 50  0000 C CNN
F 2 "" H 8775 6550 50  0001 C CNN
F 3 "" H 8775 6550 50  0001 C CNN
	1    8775 6550
	1    0    0    -1  
$EndComp
Text GLabel 8375 6250 0    50   Input ~ 0
A15
Wire Wire Line
	7925 6200 7925 6150
Wire Wire Line
	7925 6150 8275 6150
Connection ~ 8275 6150
Text GLabel 8150 5900 0    50   Input ~ 10
5V
Wire Wire Line
	8150 5900 8375 5900
Connection ~ 8375 5900
Wire Wire Line
	8375 5900 8375 5950
$Comp
L Interface:8255A U7
U 1 1 681A978B
P 11175 2900
F 0 "U7" H 11175 2900 50  0000 C CNN
F 1 "8255AC-2" H 11175 2800 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 11175 3200 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 11175 3200 50  0001 C CNN
	1    11175 2900
	1    0    0    -1  
$EndComp
Text GLabel 10475 3500 0    50   3State ~ 0
D7
Text GLabel 10475 3400 0    50   3State ~ 0
D6
Text GLabel 10475 3300 0    50   3State ~ 0
D5
Text GLabel 10475 3200 0    50   3State ~ 0
D4
Text GLabel 10475 3100 0    50   3State ~ 0
D3
Text GLabel 10475 3000 0    50   3State ~ 0
D2
Text GLabel 10475 2900 0    50   3State ~ 0
D1
Text GLabel 10475 2800 0    50   3State ~ 0
D0
Text GLabel 10475 2400 0    50   Input ~ 0
A0
Text GLabel 10475 2500 0    50   Input ~ 0
A1
Text GLabel 10475 1600 0    50   Input ~ 0
RST
Text GLabel 10475 1900 0    50   Input ~ 0
#S0
Text GLabel 9275 2600 2    50   Input ~ 0
#RD_M
Text GLabel 10475 2000 0    50   Input ~ 0
#RD_M
Text GLabel 10475 2100 0    50   Input ~ 0
#WR_M
$Comp
L Device:C_Small C11
U 1 1 681B0DC4
P 11700 1025
F 0 "C11" H 11792 1071 50  0000 L CNN
F 1 "100n" H 11792 980 50  0000 L CNN
F 2 "" H 11700 1025 50  0001 C CNN
F 3 "~" H 11700 1025 50  0001 C CNN
	1    11700 1025
	1    0    0    -1  
$EndComp
Wire Wire Line
	11175 1300 11175 850 
Wire Wire Line
	11175 850  11325 850 
Wire Wire Line
	11325 850  11325 925 
Text GLabel 11075 850  0    50   Input ~ 10
5V
Wire Wire Line
	11075 850  11175 850 
Connection ~ 11175 850 
$Comp
L power:GND #PWR021
U 1 1 681B0DD0
P 11325 1125
F 0 "#PWR021" H 11325 875 50  0001 C CNN
F 1 "GND" H 11330 952 50  0000 C CNN
F 2 "" H 11325 1125 50  0001 C CNN
F 3 "" H 11325 1125 50  0001 C CNN
	1    11325 1125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 681B6651
P 11175 4500
F 0 "#PWR019" H 11175 4250 50  0001 C CNN
F 1 "GND" H 11180 4327 50  0000 C CNN
F 2 "" H 11175 4500 50  0001 C CNN
F 3 "" H 11175 4500 50  0001 C CNN
	1    11175 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 681B6D2B
P 11325 1025
F 0 "C9" H 11417 1071 50  0000 L CNN
F 1 "1u" H 11417 980 50  0000 L CNN
F 2 "" H 11325 1025 50  0001 C CNN
F 3 "~" H 11325 1025 50  0001 C CNN
	1    11325 1025
	1    0    0    -1  
$EndComp
Wire Wire Line
	11700 925  11700 850 
Wire Wire Line
	11700 850  11325 850 
Connection ~ 11325 850 
$Comp
L power:GND #PWR023
U 1 1 681B9AEF
P 11700 1125
F 0 "#PWR023" H 11700 875 50  0001 C CNN
F 1 "GND" H 11705 952 50  0000 C CNN
F 2 "" H 11700 1125 50  0001 C CNN
F 3 "" H 11700 1125 50  0001 C CNN
	1    11700 1125
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x09_Female J3
U 1 1 681BB918
P 12075 1900
F 0 "J3" H 12103 1926 50  0000 L CNN
F 1 "PORTA" H 12103 1835 50  0000 L CNN
F 2 "" H 12075 1900 50  0001 C CNN
F 3 "~" H 12075 1900 50  0001 C CNN
	1    12075 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 681BEAF8
P 12050 1250
F 0 "#PWR025" H 12050 1000 50  0001 C CNN
F 1 "GND" H 12055 1077 50  0000 C CNN
F 2 "" H 12050 1250 50  0001 C CNN
F 3 "" H 12050 1250 50  0001 C CNN
	1    12050 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11875 1500 11875 1225
Wire Wire Line
	11875 1225 12050 1225
Wire Wire Line
	12050 1225 12050 1250
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 681C331B
P 12075 2800
F 0 "J4" H 12103 2776 50  0000 L CNN
F 1 "PORTB" H 12103 2685 50  0000 L CNN
F 2 "" H 12075 2800 50  0001 C CNN
F 3 "~" H 12075 2800 50  0001 C CNN
	1    12075 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J5
U 1 1 681C4386
P 12075 3700
F 0 "J5" H 12103 3676 50  0000 L CNN
F 1 "PORTC" H 12103 3585 50  0000 L CNN
F 2 "" H 12075 3700 50  0001 C CNN
F 3 "~" H 12075 3700 50  0001 C CNN
	1    12075 3700
	1    0    0    -1  
$EndComp
Text GLabel 14775 2500 0    50   Input ~ 0
A0
Text GLabel 14775 2400 0    50   Input ~ 0
A1
Text GLabel 14775 2300 0    50   Input ~ 0
A2
Text GLabel 14775 2200 0    50   Input ~ 0
A3
Text GLabel 14775 2100 0    50   Input ~ 0
A4
Text GLabel 14775 2000 0    50   Input ~ 0
A5
Text GLabel 14775 1900 0    50   Input ~ 0
A6
Text GLabel 14775 1800 0    50   Input ~ 0
A7
Text GLabel 14775 1700 0    50   Input ~ 0
A8
Text GLabel 14775 1600 0    50   Input ~ 0
A9
Text GLabel 14775 1500 0    50   Input ~ 0
A10
Text GLabel 14775 1400 0    50   Input ~ 0
A11
Text GLabel 14775 1300 0    50   Input ~ 0
A12
Text GLabel 14775 1200 0    50   Input ~ 0
A13
Text GLabel 14775 1100 0    50   Input ~ 0
A14
$Comp
L Connector:Conn_01x16_Female J9
U 1 1 681CCC4A
P 14975 1700
F 0 "J9" H 15003 1676 50  0000 L CNN
F 1 "XMEM Interface" H 15003 1585 50  0000 L CNN
F 2 "" H 14975 1700 50  0001 C CNN
F 3 "~" H 14975 1700 50  0001 C CNN
	1    14975 1700
	1    0    0    -1  
$EndComp
Text GLabel 14775 1000 0    50   Input ~ 0
#XMEM_WR
$Comp
L Connector:Conn_01x16_Female J10
U 1 1 681D7B37
P 14975 3575
F 0 "J10" H 15003 3551 50  0000 L CNN
F 1 "Data / Control Bus" H 15003 3460 50  0000 L CNN
F 2 "" H 14975 3575 50  0001 C CNN
F 3 "~" H 14975 3575 50  0001 C CNN
	1    14975 3575
	1    0    0    -1  
$EndComp
Text GLabel 14775 2875 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR014
U 1 1 681A1185
P 7925 6200
F 0 "#PWR014" H 7925 5950 50  0001 C CNN
F 1 "GND" H 7930 6027 50  0000 C CNN
F 2 "" H 7925 6200 50  0001 C CNN
F 3 "" H 7925 6200 50  0001 C CNN
	1    7925 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 681DBFDB
P 14775 4375
F 0 "#PWR029" H 14775 4125 50  0001 C CNN
F 1 "GND" H 14780 4202 50  0000 C CNN
F 2 "" H 14775 4375 50  0001 C CNN
F 3 "" H 14775 4375 50  0001 C CNN
	1    14775 4375
	1    0    0    -1  
$EndComp
Text GLabel 14775 4275 0    50   Input ~ 0
A0
Text GLabel 14775 4175 0    50   Input ~ 0
A1
Text GLabel 14775 4075 0    50   Input ~ 0
A2
Text GLabel 14775 3975 0    50   Input ~ 0
A3
Text GLabel 14775 3875 0    50   Input ~ 0
#RD_M
Text GLabel 14775 3775 0    50   Input ~ 0
#WR_M
Text GLabel 14775 2975 0    50   3State ~ 0
D7
Text GLabel 14775 3075 0    50   3State ~ 0
D6
Text GLabel 14775 3175 0    50   3State ~ 0
D5
Text GLabel 14775 3275 0    50   3State ~ 0
D4
Text GLabel 14775 3375 0    50   3State ~ 0
D3
Text GLabel 14775 3475 0    50   3State ~ 0
D2
Text GLabel 14775 3575 0    50   3State ~ 0
D1
Text GLabel 14775 3675 0    50   3State ~ 0
D0
$Comp
L Connector:Conn_01x16_Female J6
U 1 1 681E42EB
P 13525 3575
F 0 "J6" H 13553 3551 50  0000 L CNN
F 1 "Data / Control Bus" H 13553 3460 50  0000 L CNN
F 2 "" H 13525 3575 50  0001 C CNN
F 3 "~" H 13525 3575 50  0001 C CNN
	1    13525 3575
	1    0    0    -1  
$EndComp
Text GLabel 13325 2875 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR027
U 1 1 681E42F2
P 13325 4375
F 0 "#PWR027" H 13325 4125 50  0001 C CNN
F 1 "GND" H 13330 4202 50  0000 C CNN
F 2 "" H 13325 4375 50  0001 C CNN
F 3 "" H 13325 4375 50  0001 C CNN
	1    13325 4375
	1    0    0    -1  
$EndComp
Text GLabel 13325 4275 0    50   Input ~ 0
A0
Text GLabel 13325 4175 0    50   Input ~ 0
A1
Text GLabel 13325 4075 0    50   Input ~ 0
A2
Text GLabel 13325 3975 0    50   Input ~ 0
A3
Text GLabel 13325 3875 0    50   Input ~ 0
#RD_M
Text GLabel 13325 3775 0    50   Input ~ 0
#WR_M
Text GLabel 13325 2975 0    50   3State ~ 0
D7
Text GLabel 13325 3075 0    50   3State ~ 0
D6
Text GLabel 13325 3175 0    50   3State ~ 0
D5
Text GLabel 13325 3275 0    50   3State ~ 0
D4
Text GLabel 13325 3375 0    50   3State ~ 0
D3
Text GLabel 13325 3475 0    50   3State ~ 0
D2
Text GLabel 13325 3575 0    50   3State ~ 0
D1
Text GLabel 13325 3675 0    50   3State ~ 0
D0
$Comp
L Connector:Conn_01x07_Female J7
U 1 1 681F2AB9
P 13550 1900
F 0 "J7" H 13578 1926 50  0000 L CNN
F 1 "Select lines" H 13578 1835 50  0000 L CNN
F 2 "" H 13550 1900 50  0001 C CNN
F 3 "~" H 13550 1900 50  0001 C CNN
	1    13550 1900
	1    0    0    -1  
$EndComp
Text GLabel 13350 2100 0    50   Input ~ 0
#S2
Text GLabel 13350 2000 0    50   Input ~ 0
#S3
Text GLabel 13350 1900 0    50   Input ~ 0
#S4
Text GLabel 13350 1800 0    50   Input ~ 0
#S5
Text GLabel 13350 1700 0    50   Input ~ 0
#S6
Text GLabel 13350 1600 0    50   Input ~ 0
#S7
$Comp
L power:GND #PWR028
U 1 1 681F3978
P 13350 2200
F 0 "#PWR028" H 13350 1950 50  0001 C CNN
F 1 "GND" H 13355 2027 50  0000 C CNN
F 2 "" H 13350 2200 50  0001 C CNN
F 3 "" H 13350 2200 50  0001 C CNN
	1    13350 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J8
U 1 1 681FDFFB
P 14800 5500
F 0 "J8" H 14850 5917 50  0000 C CNN
F 1 "POWER" H 14850 5826 50  0000 C CNN
F 2 "" H 14800 5500 50  0001 C CNN
F 3 "~" H 14800 5500 50  0001 C CNN
	1    14800 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	14600 5500 14600 5400
Wire Wire Line
	14600 5000 15100 5000
Wire Wire Line
	15100 5000 15100 5300
Connection ~ 14600 5300
Wire Wire Line
	14600 5300 14600 5000
Connection ~ 14600 5400
Wire Wire Line
	14600 5400 14600 5300
Connection ~ 15100 5300
Wire Wire Line
	15100 5300 15100 5400
Connection ~ 15100 5400
Wire Wire Line
	15100 5400 15100 5500
Wire Wire Line
	14600 5600 14600 5700
Wire Wire Line
	14600 5925 14850 5925
Wire Wire Line
	15100 5925 15100 5800
Connection ~ 14600 5700
Wire Wire Line
	14600 5700 14600 5800
Connection ~ 14600 5800
Wire Wire Line
	14600 5800 14600 5925
Connection ~ 15100 5700
Wire Wire Line
	15100 5700 15100 5600
Connection ~ 15100 5800
Wire Wire Line
	15100 5800 15100 5700
$Comp
L Device:C_Small C12
U 1 1 68208526
P 15275 5550
F 0 "C12" H 15367 5596 50  0000 L CNN
F 1 "1u" H 15367 5505 50  0000 L CNN
F 2 "" H 15275 5550 50  0001 C CNN
F 3 "~" H 15275 5550 50  0001 C CNN
	1    15275 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	15100 5400 15275 5400
Wire Wire Line
	15275 5400 15275 5450
Wire Wire Line
	15100 5700 15275 5700
Wire Wire Line
	15275 5700 15275 5650
$Comp
L power:GND #PWR030
U 1 1 6820F44E
P 14850 6000
F 0 "#PWR030" H 14850 5750 50  0001 C CNN
F 1 "GND" H 14855 5827 50  0000 C CNN
F 2 "" H 14850 6000 50  0001 C CNN
F 3 "" H 14850 6000 50  0001 C CNN
	1    14850 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	14850 6000 14850 5925
Connection ~ 14850 5925
Wire Wire Line
	14850 5925 15100 5925
Text GLabel 14475 5000 0    50   Input ~ 10
5V
Wire Wire Line
	14475 5000 14600 5000
Connection ~ 14600 5000
$Comp
L Device:R_Small R1
U 1 1 68225BC9
P 1175 2050
F 0 "R1" V 1125 2050 20  0000 C CNN
F 1 "10k" V 1175 2050 20  0000 C CNN
F 2 "" H 1175 2050 50  0001 C CNN
F 3 "~" H 1175 2050 50  0001 C CNN
	1    1175 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 68226CF3
P 1175 2150
F 0 "R2" V 1125 2150 20  0000 C CNN
F 1 "10k" V 1175 2150 20  0000 C CNN
F 2 "" H 1175 2150 50  0001 C CNN
F 3 "~" H 1175 2150 50  0001 C CNN
	1    1175 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 68226E71
P 1175 2250
F 0 "R3" V 1125 2250 20  0000 C CNN
F 1 "10k" V 1175 2250 20  0000 C CNN
F 2 "" H 1175 2250 50  0001 C CNN
F 3 "~" H 1175 2250 50  0001 C CNN
	1    1175 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 68226FEF
P 1175 2450
F 0 "R4" V 1125 2450 20  0000 C CNN
F 1 "10k" V 1175 2450 20  0000 C CNN
F 2 "" H 1175 2450 50  0001 C CNN
F 3 "~" H 1175 2450 50  0001 C CNN
	1    1175 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	1275 2450 1575 2450
Wire Wire Line
	1275 2250 1575 2250
Wire Wire Line
	1275 2150 1575 2150
Wire Wire Line
	1275 2050 1575 2050
Wire Wire Line
	1075 2050 975  2050
Wire Wire Line
	975  2050 975  2150
Wire Wire Line
	975  2450 1075 2450
Wire Wire Line
	1075 2250 975  2250
Connection ~ 975  2250
Wire Wire Line
	975  2250 975  2450
Wire Wire Line
	1075 2150 975  2150
Connection ~ 975  2150
Wire Wire Line
	975  2150 975  2250
Text GLabel 875  2050 0    50   Input ~ 10
5V
Wire Wire Line
	875  2050 975  2050
Connection ~ 975  2050
$Comp
L Device:R_Small R5
U 1 1 68244F8E
P 1175 2550
F 0 "R5" V 1125 2550 20  0000 C CNN
F 1 "10k" V 1175 2550 20  0000 C CNN
F 2 "" H 1175 2550 50  0001 C CNN
F 3 "~" H 1175 2550 50  0001 C CNN
	1    1175 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	1275 2550 1575 2550
$Comp
L power:GND #PWR01
U 1 1 682497C8
P 1025 2575
F 0 "#PWR01" H 1025 2325 50  0001 C CNN
F 1 "GND" H 1030 2402 50  0000 C CNN
F 2 "" H 1025 2575 50  0001 C CNN
F 3 "" H 1025 2575 50  0001 C CNN
	1    1025 2575
	1    0    0    -1  
$EndComp
Wire Wire Line
	1025 2575 1025 2550
Wire Wire Line
	1025 2550 1075 2550
$Comp
L Interface:8259A-2 U8
U 1 1 6824FBDF
P 11175 6425
F 0 "U8" H 11175 6525 50  0000 C CNN
F 1 "8259AC-2" H 11175 6425 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 11175 6425 50  0001 C CIN
F 3 "http://pdos.csail.mit.edu/6.828/2005/readings/hardware/8259A.pdf" H 11175 6425 50  0001 C CNN
	1    11175 6425
	1    0    0    -1  
$EndComp
NoConn ~ 11775 6525
NoConn ~ 11775 6625
NoConn ~ 11775 6725
Wire Wire Line
	11175 5325 11175 4875
Wire Wire Line
	11175 4875 11325 4875
Wire Wire Line
	11325 4875 11325 4950
Text GLabel 11075 4875 0    50   Input ~ 10
5V
Wire Wire Line
	11075 4875 11175 4875
Connection ~ 11175 4875
$Comp
L power:GND #PWR022
U 1 1 6825F450
P 11325 5150
F 0 "#PWR022" H 11325 4900 50  0001 C CNN
F 1 "GND" H 11330 4977 50  0000 C CNN
F 2 "" H 11325 5150 50  0001 C CNN
F 3 "" H 11325 5150 50  0001 C CNN
	1    11325 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 6825F456
P 11325 5050
F 0 "C10" H 11417 5096 50  0000 L CNN
F 1 "100n" H 11417 5005 50  0000 L CNN
F 2 "" H 11325 5050 50  0001 C CNN
F 3 "~" H 11325 5050 50  0001 C CNN
	1    11325 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 68267475
P 11175 7525
F 0 "#PWR020" H 11175 7275 50  0001 C CNN
F 1 "GND" H 11180 7352 50  0000 C CNN
F 2 "" H 11175 7525 50  0001 C CNN
F 3 "" H 11175 7525 50  0001 C CNN
	1    11175 7525
	1    0    0    -1  
$EndComp
Text GLabel 10575 7125 0    50   Output ~ 0
INT
Text GLabel 10575 6525 0    50   Input ~ 0
A0
Text GLabel 10575 6725 0    50   Input ~ 0
#S1
Text GLabel 10575 6925 0    50   Input ~ 0
#RD_M
Text GLabel 10575 6825 0    50   Input ~ 0
#WR_M
Text GLabel 10575 6325 0    50   3State ~ 0
D7
Text GLabel 10575 6225 0    50   3State ~ 0
D6
Text GLabel 10575 6125 0    50   3State ~ 0
D5
Text GLabel 10575 6025 0    50   3State ~ 0
D4
Text GLabel 10575 5925 0    50   3State ~ 0
D3
Text GLabel 10575 5825 0    50   3State ~ 0
D2
Text GLabel 10575 5725 0    50   3State ~ 0
D1
Text GLabel 10575 5625 0    50   3State ~ 0
D0
$Comp
L Connector:Conn_01x09_Female J2
U 1 1 68270E1B
P 11975 5925
F 0 "J2" H 12025 5450 50  0000 L CNN
F 1 "IR inputs" H 11900 5375 50  0000 L CNN
F 2 "" H 11975 5925 50  0001 C CNN
F 3 "~" H 11975 5925 50  0001 C CNN
	1    11975 5925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 68272644
P 11925 5250
F 0 "#PWR024" H 11925 5000 50  0001 C CNN
F 1 "GND" H 11930 5077 50  0000 C CNN
F 2 "" H 11925 5250 50  0001 C CNN
F 3 "" H 11925 5250 50  0001 C CNN
	1    11925 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11775 5525 11750 5525
Wire Wire Line
	11750 5525 11750 5225
Wire Wire Line
	11750 5225 11925 5225
Wire Wire Line
	11925 5225 11925 5250
$Comp
L Device:R_Small R7
U 1 1 68279323
P 12225 5625
F 0 "R7" V 12175 5625 20  0000 C CNN
F 1 "10k" V 12225 5625 20  0000 C CNN
F 2 "" H 12225 5625 50  0001 C CNN
F 3 "~" H 12225 5625 50  0001 C CNN
	1    12225 5625
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 6827B147
P 12225 5725
F 0 "R8" V 12175 5725 20  0000 C CNN
F 1 "10k" V 12225 5725 20  0000 C CNN
F 2 "" H 12225 5725 50  0001 C CNN
F 3 "~" H 12225 5725 50  0001 C CNN
	1    12225 5725
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 6827B366
P 12225 5825
F 0 "R9" V 12175 5825 20  0000 C CNN
F 1 "10k" V 12225 5825 20  0000 C CNN
F 2 "" H 12225 5825 50  0001 C CNN
F 3 "~" H 12225 5825 50  0001 C CNN
	1    12225 5825
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 6827B712
P 12225 5925
F 0 "R10" V 12175 5925 20  0000 C CNN
F 1 "10k" V 12225 5925 20  0000 C CNN
F 2 "" H 12225 5925 50  0001 C CNN
F 3 "~" H 12225 5925 50  0001 C CNN
	1    12225 5925
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 6827B993
P 12225 6025
F 0 "R11" V 12175 6025 20  0000 C CNN
F 1 "10k" V 12225 6025 20  0000 C CNN
F 2 "" H 12225 6025 50  0001 C CNN
F 3 "~" H 12225 6025 50  0001 C CNN
	1    12225 6025
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 6827BC34
P 12225 6125
F 0 "R12" V 12175 6125 20  0000 C CNN
F 1 "10k" V 12225 6125 20  0000 C CNN
F 2 "" H 12225 6125 50  0001 C CNN
F 3 "~" H 12225 6125 50  0001 C CNN
	1    12225 6125
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 6827BEB6
P 12225 6225
F 0 "R13" V 12175 6225 20  0000 C CNN
F 1 "10k" V 12225 6225 20  0000 C CNN
F 2 "" H 12225 6225 50  0001 C CNN
F 3 "~" H 12225 6225 50  0001 C CNN
	1    12225 6225
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 6827C137
P 12225 6325
F 0 "R14" V 12175 6325 20  0000 C CNN
F 1 "10k" V 12225 6325 20  0000 C CNN
F 2 "" H 12225 6325 50  0001 C CNN
F 3 "~" H 12225 6325 50  0001 C CNN
	1    12225 6325
	0    1    1    0   
$EndComp
Wire Wire Line
	12125 5625 11775 5625
Connection ~ 11775 5625
Wire Wire Line
	12125 5725 11775 5725
Connection ~ 11775 5725
Wire Wire Line
	12125 5825 11775 5825
Connection ~ 11775 5825
Wire Wire Line
	12125 5925 11775 5925
Connection ~ 11775 5925
Wire Wire Line
	11775 6025 12125 6025
Connection ~ 11775 6025
Wire Wire Line
	12125 6125 11775 6125
Connection ~ 11775 6125
Wire Wire Line
	12125 6225 11775 6225
Connection ~ 11775 6225
Wire Wire Line
	12125 6325 11775 6325
Connection ~ 11775 6325
Wire Wire Line
	12325 5625 12425 5625
Wire Wire Line
	12425 5625 12425 5725
Wire Wire Line
	12425 6325 12325 6325
Wire Wire Line
	12325 6225 12425 6225
Connection ~ 12425 6225
Wire Wire Line
	12425 6225 12425 6325
Wire Wire Line
	12425 6125 12325 6125
Connection ~ 12425 6125
Wire Wire Line
	12425 6125 12425 6225
Wire Wire Line
	12325 6025 12425 6025
Connection ~ 12425 6025
Wire Wire Line
	12425 6025 12425 6125
Wire Wire Line
	12425 5925 12325 5925
Connection ~ 12425 5925
Wire Wire Line
	12425 5925 12425 6025
Wire Wire Line
	12325 5825 12425 5825
Connection ~ 12425 5825
Wire Wire Line
	12425 5825 12425 5925
Wire Wire Line
	12425 5725 12325 5725
Connection ~ 12425 5725
Wire Wire Line
	12425 5725 12425 5825
$Comp
L power:GND #PWR026
U 1 1 682D0F59
P 12425 6375
F 0 "#PWR026" H 12425 6125 50  0001 C CNN
F 1 "GND" H 12430 6202 50  0000 C CNN
F 2 "" H 12425 6375 50  0001 C CNN
F 3 "" H 12425 6375 50  0001 C CNN
	1    12425 6375
	1    0    0    -1  
$EndComp
Wire Wire Line
	12425 6375 12425 6325
Connection ~ 12425 6325
$Comp
L Device:R_Small R6
U 1 1 682D8C22
P 12000 6925
F 0 "R6" V 11804 6925 50  0000 C CNN
F 1 "1k" V 11895 6925 50  0000 C CNN
F 2 "" H 12000 6925 50  0001 C CNN
F 3 "~" H 12000 6925 50  0001 C CNN
	1    12000 6925
	0    1    1    0   
$EndComp
Wire Wire Line
	11775 6925 11900 6925
Text GLabel 12175 6925 2    50   Input ~ 10
5V
Wire Wire Line
	12100 6925 12175 6925
Text GLabel 10575 7225 0    50   Input ~ 0
#INTA
Text Notes 3175 5425 0    118  ~ 24
Address Decoder
Text Notes 9150 5425 0    79   ~ 16
ROM
Text Notes 8975 3225 0    79   ~ 16
RAM
Text Notes 11825 4425 0    79   ~ 16
I/O
Text Notes 11775 7300 0    79   ~ 16
Interrupt Controller
$EndSCHEMATC
