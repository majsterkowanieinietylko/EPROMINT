EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Binary to DEC / HEX decoder"
Date "2025-04-14"
Rev "1"
Comp "MINT"
Comment1 "10-bit unsigned input"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR01
U 1 1 67FD08B0
P 1350 1075
F 0 "#PWR01" H 1350 925 50  0001 C CNN
F 1 "+5V" H 1365 1248 50  0000 C CNN
F 2 "" H 1350 1075 50  0001 C CNN
F 3 "" H 1350 1075 50  0001 C CNN
	1    1350 1075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 67FD0E1D
P 1350 1475
F 0 "#PWR02" H 1350 1225 50  0001 C CNN
F 1 "GND" H 1355 1302 50  0000 C CNN
F 2 "" H 1350 1475 50  0001 C CNN
F 3 "" H 1350 1475 50  0001 C CNN
	1    1350 1475
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D1
U 1 1 67FD13D9
P 1350 1275
F 0 "D1" V 1304 1355 50  0000 L CNN
F 1 "1N5819" V 1395 1355 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1350 1100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 1350 1275 50  0001 C CNN
	1    1350 1275
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 1075 1350 1100
Wire Wire Line
	1350 1425 1350 1450
$Comp
L Device:CP_Small C1
U 1 1 67FD22BF
P 1900 1275
F 0 "C1" H 1988 1321 50  0000 L CNN
F 1 "47u" H 1988 1230 50  0000 L CNN
F 2 "" H 1900 1275 50  0001 C CNN
F 3 "~" H 1900 1275 50  0001 C CNN
	1    1900 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1100 1900 1100
Wire Wire Line
	1900 1100 1900 1175
Connection ~ 1350 1100
Wire Wire Line
	1350 1100 1350 1125
Wire Wire Line
	1350 1450 1900 1450
Wire Wire Line
	1900 1450 1900 1375
Connection ~ 1350 1450
Wire Wire Line
	1350 1450 1350 1475
$Comp
L Device:C_Small C2
U 1 1 67FD2BBA
P 2325 1275
F 0 "C2" H 2417 1321 50  0000 L CNN
F 1 "100n" H 2417 1230 50  0000 L CNN
F 2 "" H 2325 1275 50  0001 C CNN
F 3 "~" H 2325 1275 50  0001 C CNN
	1    2325 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1100 2325 1100
Wire Wire Line
	2325 1100 2325 1175
Connection ~ 1900 1100
Wire Wire Line
	1900 1450 2325 1450
Wire Wire Line
	2325 1450 2325 1375
Connection ~ 1900 1450
Text GLabel 2625 1100 2    50   Output ~ 0
Vcc
Wire Wire Line
	2625 1100 2325 1100
Connection ~ 2325 1100
$Comp
L 74xx:74HC14 U1
U 1 1 67FD3549
P 6050 1150
F 0 "U1" H 6050 1467 50  0000 C CNN
F 1 "74HC14" H 6050 1376 50  0000 C CNN
F 2 "" H 6050 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 6050 1150 50  0001 C CNN
	1    6050 1150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 2 1 67FD3D5F
P 6850 1150
F 0 "U1" H 6850 1467 50  0000 C CNN
F 1 "74HC14" H 6850 1376 50  0000 C CNN
F 2 "" H 6850 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 6850 1150 50  0001 C CNN
	2    6850 1150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 3 1 67FD472E
P 8800 2700
F 0 "U1" V 8846 2520 50  0000 R CNN
F 1 "74HC14" V 8755 2520 50  0000 R CNN
F 2 "" H 8800 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 8800 2700 50  0001 C CNN
	3    8800 2700
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC14 U1
U 4 1 67FD5256
P 9775 2700
F 0 "U1" V 9821 2520 50  0000 R CNN
F 1 "74HC14" V 9730 2520 50  0000 R CNN
F 2 "" H 9775 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 9775 2700 50  0001 C CNN
	4    9775 2700
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC14 U1
U 5 1 67FD5CB1
P 10750 2700
F 0 "U1" V 10796 2520 50  0000 R CNN
F 1 "74HC14" V 10705 2520 50  0000 R CNN
F 2 "" H 10750 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 10750 2700 50  0001 C CNN
	5    10750 2700
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC14 U1
U 6 1 67FD667A
P 5050 1025
F 0 "U1" H 5050 1342 50  0000 C CNN
F 1 "74HC14" H 5050 1251 50  0000 C CNN
F 2 "" H 5050 1025 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 5050 1025 50  0001 C CNN
	6    5050 1025
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 7 1 67FD7292
P 3875 1600
F 0 "U1" H 4105 1646 50  0000 L CNN
F 1 "74HC14" H 4105 1555 50  0000 L CNN
F 2 "" H 3875 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 3875 1600 50  0001 C CNN
	7    3875 1600
	1    0    0    -1  
$EndComp
Text GLabel 3750 725  0    50   Input ~ 0
Vcc
$Comp
L Device:C_Small C3
U 1 1 67FDC94B
P 4075 925
F 0 "C3" H 4167 971 50  0000 L CNN
F 1 "100n" H 4167 880 50  0000 L CNN
F 2 "" H 4075 925 50  0001 C CNN
F 3 "~" H 4075 925 50  0001 C CNN
	1    4075 925 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 67FDD396
P 3875 2100
F 0 "#PWR05" H 3875 1850 50  0001 C CNN
F 1 "GND" H 3880 1927 50  0000 C CNN
F 2 "" H 3875 2100 50  0001 C CNN
F 3 "" H 3875 2100 50  0001 C CNN
	1    3875 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 67FDD6DD
P 4075 1025
F 0 "#PWR07" H 4075 775 50  0001 C CNN
F 1 "GND" H 4080 852 50  0000 C CNN
F 2 "" H 4075 1025 50  0001 C CNN
F 3 "" H 4075 1025 50  0001 C CNN
	1    4075 1025
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 725  3875 725 
Wire Wire Line
	4075 725  4075 825 
Wire Wire Line
	3875 1100 3875 725 
Connection ~ 3875 725 
Wire Wire Line
	3875 725  4075 725 
Text GLabel 4750 1025 0    50   Input ~ 0
Vcc
NoConn ~ 5350 1025
$Comp
L Device:R_Small R22
U 1 1 67FE0CA8
P 6075 1550
F 0 "R22" V 5879 1550 50  0000 C CNN
F 1 "22k" V 5970 1550 50  0000 C CNN
F 2 "" H 6075 1550 50  0001 C CNN
F 3 "~" H 6075 1550 50  0001 C CNN
	1    6075 1550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 67FE1258
P 5700 1725
F 0 "C4" H 5608 1771 50  0000 R CNN
F 1 "100n" H 5608 1680 50  0000 R CNN
F 2 "" H 5700 1725 50  0001 C CNN
F 3 "~" H 5700 1725 50  0001 C CNN
	1    5700 1725
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5750 1150 5700 1150
Wire Wire Line
	5700 1150 5700 1550
Wire Wire Line
	5700 1550 5975 1550
Connection ~ 5700 1550
Wire Wire Line
	5700 1550 5700 1625
Wire Wire Line
	6175 1550 6450 1550
Wire Wire Line
	6450 1550 6450 1150
Wire Wire Line
	6450 1150 6350 1150
$Comp
L power:GND #PWR08
U 1 1 67FE342F
P 5700 1825
F 0 "#PWR08" H 5700 1575 50  0001 C CNN
F 1 "GND" H 5705 1652 50  0000 C CNN
F 2 "" H 5700 1825 50  0001 C CNN
F 3 "" H 5700 1825 50  0001 C CNN
	1    5700 1825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1150 6550 1150
Connection ~ 6450 1150
Text GLabel 7150 1150 2    50   Output ~ 0
CLK
$Comp
L Display_Character:KCSA02-123 U3
U 1 1 67FEBBAF
P 8500 1600
F 0 "U3" H 8500 2267 50  0000 C CNN
F 1 "Green, common anode" H 8500 2176 50  0000 C CNN
F 2 "Display_7Segment:KCSC02-123" H 8500 1000 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/KCSA02-123(Ver.9A).pdf" H 8000 2075 50  0001 L CNN
	1    8500 1600
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:KCSA02-123 U5
U 1 1 67FEC648
P 9475 1600
F 0 "U5" H 9475 2267 50  0000 C CNN
F 1 "Green, common anode" H 9475 2176 50  0000 C CNN
F 2 "Display_7Segment:KCSC02-123" H 9475 1000 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/KCSA02-123(Ver.9A).pdf" H 8975 2075 50  0001 L CNN
	1    9475 1600
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:KCSA02-123 U6
U 1 1 67FECCD7
P 10450 1600
F 0 "U6" H 10450 2267 50  0000 C CNN
F 1 "Green, common anode" H 10450 2176 50  0000 C CNN
F 2 "Display_7Segment:KCSC02-123" H 10450 1000 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/KCSA02-123(Ver.9A).pdf" H 9950 2075 50  0001 L CNN
	1    10450 1600
	1    0    0    -1  
$EndComp
Text GLabel 8200 1300 0    50   Input ~ 0
A
Text GLabel 8200 1400 0    50   Input ~ 0
B
Text GLabel 8200 1500 0    50   Input ~ 0
C
Text GLabel 8200 1600 0    50   Input ~ 0
D
Text GLabel 8200 1700 0    50   Input ~ 0
E
Text GLabel 8200 1800 0    50   Input ~ 0
F
Text GLabel 8200 1900 0    50   Input ~ 0
G
Text GLabel 8200 2000 0    50   Input ~ 0
DP
Wire Wire Line
	8800 1900 8800 2000
Wire Wire Line
	9775 1900 9775 2000
Wire Wire Line
	10750 1900 10750 2000
Text GLabel 9175 1300 0    50   Input ~ 0
A
Text GLabel 9175 1400 0    50   Input ~ 0
B
Text GLabel 9175 1500 0    50   Input ~ 0
C
Text GLabel 9175 1600 0    50   Input ~ 0
D
Text GLabel 9175 1700 0    50   Input ~ 0
E
Text GLabel 9175 1800 0    50   Input ~ 0
F
Text GLabel 9175 1900 0    50   Input ~ 0
G
Text GLabel 9175 2000 0    50   Input ~ 0
DP
Text GLabel 10150 1300 0    50   Input ~ 0
A
Text GLabel 10150 1400 0    50   Input ~ 0
B
Text GLabel 10150 1500 0    50   Input ~ 0
C
Text GLabel 10150 1600 0    50   Input ~ 0
D
Text GLabel 10150 1700 0    50   Input ~ 0
E
Text GLabel 10150 1800 0    50   Input ~ 0
F
Text GLabel 10150 1900 0    50   Input ~ 0
G
Text GLabel 10150 2000 0    50   Input ~ 0
DP
$Comp
L Device:R_Small R23
U 1 1 67FF9381
P 8800 2200
F 0 "R23" H 8741 2154 50  0000 R CNN
F 1 "27R" H 8741 2245 50  0000 R CNN
F 2 "" H 8800 2200 50  0001 C CNN
F 3 "~" H 8800 2200 50  0001 C CNN
	1    8800 2200
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R24
U 1 1 67FF9AD2
P 9775 2200
F 0 "R24" H 9716 2154 50  0000 R CNN
F 1 "27R" H 9716 2245 50  0000 R CNN
F 2 "" H 9775 2200 50  0001 C CNN
F 3 "~" H 9775 2200 50  0001 C CNN
	1    9775 2200
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R25
U 1 1 67FFA1C8
P 10750 2200
F 0 "R25" H 10691 2154 50  0000 R CNN
F 1 "27R" H 10691 2245 50  0000 R CNN
F 2 "" H 10750 2200 50  0001 C CNN
F 3 "~" H 10750 2200 50  0001 C CNN
	1    10750 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 2100 8800 2000
Connection ~ 8800 2000
Wire Wire Line
	8800 2300 8800 2400
Wire Wire Line
	9775 2100 9775 2000
Connection ~ 9775 2000
Wire Wire Line
	9775 2300 9775 2400
Wire Wire Line
	10750 2000 10750 2100
Connection ~ 10750 2000
Wire Wire Line
	10750 2300 10750 2400
Text GLabel 8725 3100 0    50   Input ~ 0
#HIGH
Text GLabel 9700 3100 0    50   Input ~ 0
#MID
Text GLabel 10675 3100 0    50   Input ~ 0
#LOW
Wire Wire Line
	8725 3100 8800 3100
Wire Wire Line
	8800 3100 8800 3000
Wire Wire Line
	9700 3100 9775 3100
Wire Wire Line
	9775 3100 9775 3000
Wire Wire Line
	10675 3100 10750 3100
Wire Wire Line
	10750 3100 10750 3000
$Comp
L Memory_EPROM:27C512 U2
U 1 1 67FFFD14
P 6050 3850
F 0 "U2" H 6125 3650 50  0000 C CNN
F 1 "M27C512" H 6125 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 6050 3850 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 6050 3850 50  0001 C CNN
	1    6050 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 68003365
P 6050 4950
F 0 "#PWR09" H 6050 4700 50  0001 C CNN
F 1 "GND" H 6055 4777 50  0000 C CNN
F 2 "" H 6050 4950 50  0001 C CNN
F 3 "" H 6050 4950 50  0001 C CNN
	1    6050 4950
	1    0    0    -1  
$EndComp
Text GLabel 5925 2300 0    50   Input ~ 0
Vcc
$Comp
L Device:C_Small C5
U 1 1 680052FC
P 6250 2500
F 0 "C5" H 6342 2546 50  0000 L CNN
F 1 "100n" H 6342 2455 50  0000 L CNN
F 2 "" H 6250 2500 50  0001 C CNN
F 3 "~" H 6250 2500 50  0001 C CNN
	1    6250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 68005302
P 6250 2600
F 0 "#PWR010" H 6250 2350 50  0001 C CNN
F 1 "GND" H 6255 2427 50  0000 C CNN
F 2 "" H 6250 2600 50  0001 C CNN
F 3 "" H 6250 2600 50  0001 C CNN
	1    6250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5925 2300 6050 2300
Wire Wire Line
	6250 2300 6250 2400
Connection ~ 6050 2300
Wire Wire Line
	6050 2300 6250 2300
Wire Wire Line
	6050 2300 6050 2750
Wire Wire Line
	5650 4650 5650 4750
Wire Wire Line
	5650 4750 5650 4950
Wire Wire Line
	5650 4950 6050 4950
Connection ~ 5650 4750
Connection ~ 6050 4950
Text GLabel 5650 4050 0    50   Input ~ 0
CLK
Text GLabel 6450 3650 2    50   Output ~ 0
#CLK
Text GLabel 5650 3950 0    50   Input ~ 0
#CLK
Text GLabel 6450 3350 2    50   Output ~ 0
#HIGH
Text GLabel 6450 3450 2    50   Output ~ 0
#MID
Text GLabel 6450 3550 2    50   Output ~ 0
#LOW
Text GLabel 6450 2950 2    50   Output ~ 0
D0
Text GLabel 6450 3050 2    50   Output ~ 0
D1
Text GLabel 6450 3150 2    50   Output ~ 0
D2
Text GLabel 6450 3250 2    50   Output ~ 0
D3
Text GLabel 5650 3850 0    50   Input ~ 0
#HIGH
Text GLabel 5650 3750 0    50   Input ~ 0
#MID
Text GLabel 5650 4250 0    50   Input ~ 0
#LOW
$Comp
L Connector:Conn_01x11_Female J1
U 1 1 68008EEE
P 1550 3350
F 0 "J1" H 1442 4035 50  0000 C CNN
F 1 "IN" H 1442 3944 50  0000 C CNN
F 2 "" H 1550 3350 50  0001 C CNN
F 3 "~" H 1550 3350 50  0001 C CNN
	1    1550 3350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x11_Male J3
U 1 1 6800B353
P 1850 3350
F 0 "J3" H 1958 4031 50  0000 C CNN
F 1 "IN" H 1958 3940 50  0000 C CNN
F 2 "" H 1850 3350 50  0001 C CNN
F 3 "~" H 1850 3350 50  0001 C CNN
	1    1850 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x11_Male J4
U 1 1 6800DC43
P 2150 3350
F 0 "J4" H 2258 4031 50  0000 C CNN
F 1 "IN" H 2258 3940 50  0000 C CNN
F 2 "" H 2150 3350 50  0001 C CNN
F 3 "~" H 2150 3350 50  0001 C CNN
	1    2150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2850 2050 2850
Connection ~ 2050 2850
Wire Wire Line
	2050 2850 2350 2850
Wire Wire Line
	2350 2950 2050 2950
Connection ~ 2050 2950
Wire Wire Line
	2050 2950 1750 2950
Wire Wire Line
	1750 3050 2050 3050
Connection ~ 2050 3050
Wire Wire Line
	2050 3050 2350 3050
Wire Wire Line
	2350 3150 2050 3150
Connection ~ 2050 3150
Wire Wire Line
	2050 3150 1750 3150
Wire Wire Line
	1750 3250 2050 3250
Connection ~ 2050 3250
Wire Wire Line
	2050 3250 2350 3250
Wire Wire Line
	1750 3350 2050 3350
Connection ~ 2050 3350
Wire Wire Line
	2050 3350 2350 3350
Wire Wire Line
	1750 3450 2050 3450
Connection ~ 2050 3450
Wire Wire Line
	2050 3450 2350 3450
Wire Wire Line
	1750 3550 2050 3550
Connection ~ 2050 3550
Wire Wire Line
	2050 3550 2350 3550
Wire Wire Line
	1750 3650 2050 3650
Connection ~ 2050 3650
Wire Wire Line
	2050 3650 2350 3650
Wire Wire Line
	2350 3750 2050 3750
Connection ~ 2050 3750
Wire Wire Line
	2050 3750 1750 3750
Wire Wire Line
	1750 3850 2050 3850
Connection ~ 2050 3850
Wire Wire Line
	2050 3850 2350 3850
$Comp
L power:GND #PWR04
U 1 1 6802FDB2
P 2525 2675
F 0 "#PWR04" H 2525 2425 50  0001 C CNN
F 1 "GND" H 2530 2502 50  0000 C CNN
F 2 "" H 2525 2675 50  0001 C CNN
F 3 "" H 2525 2675 50  0001 C CNN
	1    2525 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2850 2350 2625
Wire Wire Line
	2350 2625 2525 2625
Wire Wire Line
	2525 2625 2525 2675
Connection ~ 2350 2850
Wire Wire Line
	5275 3750 5275 4150
Wire Wire Line
	5275 4150 5650 4150
Wire Wire Line
	5200 3850 5200 4450
Wire Wire Line
	5200 4450 5650 4450
Text Notes 700  3375 0    50   ~ 0
Input binary value
Text Notes 1375 2975 0    50   ~ 0
LSB
Text Notes 1375 3900 0    50   ~ 0
MSB
$Comp
L Device:R_Small R2
U 1 1 680709C4
P 2775 2950
F 0 "R2" V 2825 2950 20  0000 C CNN
F 1 "510R" V 2775 2950 20  0000 C CNN
F 2 "" H 2775 2950 50  0001 C CNN
F 3 "~" H 2775 2950 50  0001 C CNN
	1    2775 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6807E7A6
P 2775 3050
F 0 "R3" V 2825 3050 20  0000 C CNN
F 1 "510R" V 2775 3050 20  0000 C CNN
F 2 "" H 2775 3050 50  0001 C CNN
F 3 "~" H 2775 3050 50  0001 C CNN
	1    2775 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6807EA3C
P 2775 3150
F 0 "R4" V 2825 3150 20  0000 C CNN
F 1 "510R" V 2775 3150 20  0000 C CNN
F 2 "" H 2775 3150 50  0001 C CNN
F 3 "~" H 2775 3150 50  0001 C CNN
	1    2775 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6807EC78
P 2775 3250
F 0 "R5" V 2825 3250 20  0000 C CNN
F 1 "510R" V 2775 3250 20  0000 C CNN
F 2 "" H 2775 3250 50  0001 C CNN
F 3 "~" H 2775 3250 50  0001 C CNN
	1    2775 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 6807EE63
P 2775 3350
F 0 "R6" V 2825 3350 20  0000 C CNN
F 1 "510R" V 2775 3350 20  0000 C CNN
F 2 "" H 2775 3350 50  0001 C CNN
F 3 "~" H 2775 3350 50  0001 C CNN
	1    2775 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 680804F9
P 2775 3450
F 0 "R7" V 2825 3450 20  0000 C CNN
F 1 "510R" V 2775 3450 20  0000 C CNN
F 2 "" H 2775 3450 50  0001 C CNN
F 3 "~" H 2775 3450 50  0001 C CNN
	1    2775 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 680804FF
P 2775 3550
F 0 "R8" V 2825 3550 20  0000 C CNN
F 1 "510R" V 2775 3550 20  0000 C CNN
F 2 "" H 2775 3550 50  0001 C CNN
F 3 "~" H 2775 3550 50  0001 C CNN
	1    2775 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 68080505
P 2775 3650
F 0 "R9" V 2825 3650 20  0000 C CNN
F 1 "510R" V 2775 3650 20  0000 C CNN
F 2 "" H 2775 3650 50  0001 C CNN
F 3 "~" H 2775 3650 50  0001 C CNN
	1    2775 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 6808050B
P 2775 3750
F 0 "R10" V 2825 3750 20  0000 C CNN
F 1 "510R" V 2775 3750 20  0000 C CNN
F 2 "" H 2775 3750 50  0001 C CNN
F 3 "~" H 2775 3750 50  0001 C CNN
	1    2775 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 68080511
P 2775 3850
F 0 "R11" V 2825 3850 20  0000 C CNN
F 1 "510R" V 2775 3850 20  0000 C CNN
F 2 "" H 2775 3850 50  0001 C CNN
F 3 "~" H 2775 3850 50  0001 C CNN
	1    2775 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 2950 2675 2950
Connection ~ 2350 2950
Wire Wire Line
	2675 3050 2350 3050
Connection ~ 2350 3050
Wire Wire Line
	2350 3150 2675 3150
Connection ~ 2350 3150
Wire Wire Line
	2675 3250 2350 3250
Connection ~ 2350 3250
Wire Wire Line
	2350 3350 2675 3350
Connection ~ 2350 3350
Wire Wire Line
	2675 3450 2350 3450
Connection ~ 2350 3450
Wire Wire Line
	2350 3550 2675 3550
Connection ~ 2350 3550
Wire Wire Line
	2675 3650 2350 3650
Connection ~ 2350 3650
Wire Wire Line
	2350 3750 2675 3750
Connection ~ 2350 3750
Wire Wire Line
	2675 3850 2350 3850
Connection ~ 2350 3850
$Comp
L Device:R_Small R12
U 1 1 68099615
P 2925 4050
F 0 "R12" H 2866 4004 50  0000 R CNN
F 1 "10k" H 2866 4095 50  0000 R CNN
F 2 "" H 2925 4050 50  0001 C CNN
F 3 "~" H 2925 4050 50  0001 C CNN
	1    2925 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 6809D65F
P 3150 4250
F 0 "R13" H 3091 4204 50  0000 R CNN
F 1 "10k" H 3091 4295 50  0000 R CNN
F 2 "" H 3150 4250 50  0001 C CNN
F 3 "~" H 3150 4250 50  0001 C CNN
	1    3150 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 6809D9AD
P 3375 4050
F 0 "R14" H 3316 4004 50  0000 R CNN
F 1 "10k" H 3316 4095 50  0000 R CNN
F 2 "" H 3375 4050 50  0001 C CNN
F 3 "~" H 3375 4050 50  0001 C CNN
	1    3375 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 6809DF30
P 3600 4250
F 0 "R15" H 3541 4204 50  0000 R CNN
F 1 "10k" H 3541 4295 50  0000 R CNN
F 2 "" H 3600 4250 50  0001 C CNN
F 3 "~" H 3600 4250 50  0001 C CNN
	1    3600 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R16
U 1 1 6809FA36
P 3825 4050
F 0 "R16" H 3766 4004 50  0000 R CNN
F 1 "10k" H 3766 4095 50  0000 R CNN
F 2 "" H 3825 4050 50  0001 C CNN
F 3 "~" H 3825 4050 50  0001 C CNN
	1    3825 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 6809FA3C
P 4050 4250
F 0 "R17" H 3991 4204 50  0000 R CNN
F 1 "10k" H 3991 4295 50  0000 R CNN
F 2 "" H 4050 4250 50  0001 C CNN
F 3 "~" H 4050 4250 50  0001 C CNN
	1    4050 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 6809FA42
P 4275 4050
F 0 "R18" H 4216 4004 50  0000 R CNN
F 1 "10k" H 4216 4095 50  0000 R CNN
F 2 "" H 4275 4050 50  0001 C CNN
F 3 "~" H 4275 4050 50  0001 C CNN
	1    4275 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 6809FA48
P 4500 4250
F 0 "R19" H 4441 4204 50  0000 R CNN
F 1 "10k" H 4441 4295 50  0000 R CNN
F 2 "" H 4500 4250 50  0001 C CNN
F 3 "~" H 4500 4250 50  0001 C CNN
	1    4500 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 680A301D
P 4725 4025
F 0 "R20" H 4666 3979 50  0000 R CNN
F 1 "10k" H 4666 4070 50  0000 R CNN
F 2 "" H 4725 4025 50  0001 C CNN
F 3 "~" H 4725 4025 50  0001 C CNN
	1    4725 4025
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 680A3023
P 4950 4225
F 0 "R21" H 4891 4179 50  0000 R CNN
F 1 "10k" H 4891 4270 50  0000 R CNN
F 2 "" H 4950 4225 50  0001 C CNN
F 3 "~" H 4950 4225 50  0001 C CNN
	1    4950 4225
	-1   0    0    1   
$EndComp
Wire Wire Line
	2875 2950 2925 2950
Wire Wire Line
	5650 3050 3150 3050
Wire Wire Line
	2875 3150 3375 3150
Wire Wire Line
	5650 3250 3600 3250
Wire Wire Line
	2875 3350 3825 3350
Wire Wire Line
	5650 3450 4050 3450
Wire Wire Line
	5650 3550 4275 3550
Wire Wire Line
	2875 3650 4500 3650
Wire Wire Line
	2925 3950 2925 2950
Connection ~ 2925 2950
Wire Wire Line
	2925 2950 5650 2950
Wire Wire Line
	3150 4150 3150 3050
Connection ~ 3150 3050
Wire Wire Line
	3150 3050 2875 3050
Wire Wire Line
	3375 3950 3375 3150
Connection ~ 3375 3150
Wire Wire Line
	3375 3150 5650 3150
Wire Wire Line
	3600 4150 3600 3250
Connection ~ 3600 3250
Wire Wire Line
	3600 3250 2875 3250
Wire Wire Line
	3825 3950 3825 3350
Connection ~ 3825 3350
Wire Wire Line
	3825 3350 5650 3350
Wire Wire Line
	4050 4150 4050 3450
Connection ~ 4050 3450
Wire Wire Line
	4050 3450 2875 3450
Wire Wire Line
	4275 3950 4275 3550
Connection ~ 4275 3550
Wire Wire Line
	4275 3550 2875 3550
Wire Wire Line
	4500 4150 4500 3650
Connection ~ 4500 3650
Wire Wire Line
	4500 3650 5650 3650
Wire Wire Line
	4725 3925 4725 3750
Connection ~ 4725 3750
Wire Wire Line
	4725 3750 2875 3750
Wire Wire Line
	5275 3750 4725 3750
Wire Wire Line
	4950 4125 4950 3850
Wire Wire Line
	2875 3850 4950 3850
Connection ~ 4950 3850
Wire Wire Line
	4950 3850 5200 3850
Wire Wire Line
	2925 4150 2925 4400
Wire Wire Line
	4950 4400 4950 4325
Wire Wire Line
	4725 4125 4725 4400
Connection ~ 4725 4400
Wire Wire Line
	4725 4400 4950 4400
Wire Wire Line
	4500 4350 4500 4400
Connection ~ 4500 4400
Wire Wire Line
	4500 4400 4725 4400
Wire Wire Line
	4275 4150 4275 4400
Connection ~ 4275 4400
Wire Wire Line
	4275 4400 4500 4400
Wire Wire Line
	4050 4350 4050 4400
Connection ~ 4050 4400
Wire Wire Line
	4050 4400 4275 4400
Wire Wire Line
	3825 4150 3825 4400
Connection ~ 3825 4400
Wire Wire Line
	3825 4400 4050 4400
Wire Wire Line
	2925 4400 3150 4400
Connection ~ 3600 4400
Wire Wire Line
	3600 4400 3825 4400
Wire Wire Line
	3600 4350 3600 4400
Wire Wire Line
	3375 4150 3375 4400
Connection ~ 3375 4400
Wire Wire Line
	3375 4400 3600 4400
Wire Wire Line
	3150 4350 3150 4400
Connection ~ 3150 4400
Wire Wire Line
	3150 4400 3375 4400
Wire Wire Line
	5475 4350 5650 4350
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 680025F3
P 1550 4725
F 0 "J2" H 1658 5006 50  0000 C CNN
F 1 "Format" H 1658 4915 50  0000 C CNN
F 2 "" H 1550 4725 50  0001 C CNN
F 3 "~" H 1550 4725 50  0001 C CNN
	1    1550 4725
	1    0    0    -1  
$EndComp
NoConn ~ 1750 4625
Text GLabel 1675 5000 0    50   Input ~ 0
Vcc
Wire Wire Line
	1675 5000 1750 5000
Wire Wire Line
	1750 5000 1750 4825
$Comp
L Device:R_Small R1
U 1 1 6804D76A
P 1950 4875
F 0 "R1" H 1891 4829 50  0000 R CNN
F 1 "10k" H 1891 4920 50  0000 R CNN
F 2 "" H 1950 4875 50  0001 C CNN
F 3 "~" H 1950 4875 50  0001 C CNN
	1    1950 4875
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6804E022
P 1950 4975
F 0 "#PWR03" H 1950 4725 50  0001 C CNN
F 1 "GND" H 1955 4802 50  0000 C CNN
F 2 "" H 1950 4975 50  0001 C CNN
F 3 "" H 1950 4975 50  0001 C CNN
	1    1950 4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4725 1950 4725
Wire Wire Line
	1950 4725 1950 4775
Text Notes 1375 4700 0    50   ~ 0
DEC
Text Notes 1375 4825 0    50   ~ 0
HEX
Wire Wire Line
	1950 4725 5475 4725
Connection ~ 1950 4725
$Comp
L power:GND #PWR06
U 1 1 681485CD
P 4050 4400
F 0 "#PWR06" H 4050 4150 50  0001 C CNN
F 1 "GND" H 4055 4227 50  0000 C CNN
F 2 "" H 4050 4400 50  0001 C CNN
F 3 "" H 4050 4400 50  0001 C CNN
	1    4050 4400
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:27C512 U4
U 1 1 68162A1C
P 9375 4625
F 0 "U4" H 9450 4425 50  0000 C CNN
F 1 "27C32" H 9450 4325 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 9375 4625 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 9375 4625 50  0001 C CNN
	1    9375 4625
	1    0    0    -1  
$EndComp
Wire Wire Line
	8975 5425 8975 5525
Wire Wire Line
	8975 5725 9375 5725
Connection ~ 8975 5525
Wire Wire Line
	8975 5525 8975 5725
NoConn ~ 9375 3525
NoConn ~ 8975 5125
NoConn ~ 8975 5225
NoConn ~ 8975 4925
$Comp
L Device:C_Small C6
U 1 1 68191D7C
P 8525 5275
F 0 "C6" H 8617 5321 50  0000 L CNN
F 1 "100n" H 8617 5230 50  0000 L CNN
F 2 "" H 8525 5275 50  0001 C CNN
F 3 "~" H 8525 5275 50  0001 C CNN
	1    8525 5275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 68192A79
P 9375 5725
F 0 "#PWR013" H 9375 5475 50  0001 C CNN
F 1 "GND" H 9380 5552 50  0000 C CNN
F 2 "" H 9375 5725 50  0001 C CNN
F 3 "" H 9375 5725 50  0001 C CNN
	1    9375 5725
	1    0    0    -1  
$EndComp
Connection ~ 9375 5725
$Comp
L power:GND #PWR011
U 1 1 68192F48
P 8525 5375
F 0 "#PWR011" H 8525 5125 50  0001 C CNN
F 1 "GND" H 8530 5202 50  0000 C CNN
F 2 "" H 8525 5375 50  0001 C CNN
F 3 "" H 8525 5375 50  0001 C CNN
	1    8525 5375
	1    0    0    -1  
$EndComp
Wire Wire Line
	8525 5175 8525 5025
Wire Wire Line
	8525 5025 8975 5025
Text GLabel 8450 5025 0    50   Input ~ 0
Vcc
Wire Wire Line
	8450 5025 8525 5025
Connection ~ 8525 5025
Text GLabel 9775 4225 2    50   Output ~ 0
A
Text GLabel 9775 4125 2    50   Output ~ 0
B
Text GLabel 9775 3825 2    50   Output ~ 0
C
Text GLabel 9775 3925 2    50   Output ~ 0
D
Text GLabel 9775 3725 2    50   Output ~ 0
E
Text GLabel 9775 4325 2    50   Output ~ 0
F
Text GLabel 9775 4025 2    50   Output ~ 0
G
Text GLabel 9775 4425 2    50   Output ~ 0
DP
Text Notes 8050 6175 0    50   ~ 0
27C32 wasn't in the library and I was too lazy to add it.\nJust ignore legs 1, 2, 27 and 28 present in the DIP28 package, it's DIP24
Text GLabel 8975 3925 0    50   Input ~ 0
D2
Text GLabel 8975 3825 0    50   Input ~ 0
D1
Text GLabel 8975 3725 0    50   Input ~ 0
D0
Text GLabel 8975 4025 0    50   Input ~ 0
D3
Wire Wire Line
	8975 4725 8975 4825
$Comp
L power:GND #PWR012
U 1 1 681ACF65
P 8750 4775
F 0 "#PWR012" H 8750 4525 50  0001 C CNN
F 1 "GND" H 8755 4602 50  0000 C CNN
F 2 "" H 8750 4775 50  0001 C CNN
F 3 "" H 8750 4775 50  0001 C CNN
	1    8750 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4775 8750 4725
Wire Wire Line
	8750 4725 8975 4725
Connection ~ 8975 4725
Wire Wire Line
	5475 4725 5475 4350
Wire Wire Line
	5475 4725 5475 5250
Wire Wire Line
	5475 5250 8150 5250
Wire Wire Line
	8150 5250 8150 4425
Wire Wire Line
	8150 4425 8975 4425
Connection ~ 5475 4725
Wire Wire Line
	5200 4450 5200 5500
Wire Wire Line
	5200 5500 7975 5500
Wire Wire Line
	7975 5500 7975 4625
Wire Wire Line
	7975 4625 8975 4625
Connection ~ 5200 4450
Wire Wire Line
	5275 4150 5275 5600
Wire Wire Line
	5275 5600 7875 5600
Wire Wire Line
	7875 5600 7875 4525
Wire Wire Line
	7875 4525 8975 4525
Connection ~ 5275 4150
Text GLabel 8975 4125 0    50   Input ~ 0
#HIGH
Text GLabel 8975 4225 0    50   Input ~ 0
#MID
Text GLabel 8975 4325 0    50   Input ~ 0
#LOW
Text Notes 6450 4000 0    50   Italic 0
7-segment_driver.bin
Text Notes 9775 4850 0    50   Italic 0
7-segment_decoder.bin
$EndSCHEMATC
