EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "Sequencer board for 8-bit CPU"
Date "2025-06-24"
Rev "1"
Comp "MINT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 68AEE36F
P 875 1125
F 0 "J1" H 767 1610 50  0000 C CNN
F 1 "CPU POWER" H 767 1519 50  0000 C CNN
F 2 "" H 875 1125 50  0001 C CNN
F 3 "~" H 875 1125 50  0001 C CNN
	1    875  1125
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1075 825  1075 925 
Connection ~ 1075 925 
Wire Wire Line
	1075 925  1075 1025
Connection ~ 1075 1025
Wire Wire Line
	1075 1025 1075 1125
Wire Wire Line
	1075 1225 1075 1325
Connection ~ 1075 1325
Wire Wire Line
	1075 1325 1075 1425
Connection ~ 1075 1425
Wire Wire Line
	1075 1425 1075 1525
$Comp
L Device:D_Schottky D1
U 1 1 68AF063F
P 1300 1175
F 0 "D1" V 1254 1255 50  0000 L CNN
F 1 "3A Schottky" V 1345 1255 50  0000 L CNN
F 2 "" H 1300 1175 50  0001 C CNN
F 3 "~" H 1300 1175 50  0001 C CNN
	1    1300 1175
	0    1    1    0   
$EndComp
Wire Wire Line
	1075 1025 1300 1025
Wire Wire Line
	1075 1325 1300 1325
$Comp
L Device:Q_PMOS_SDG Q2
U 1 1 68AF1504
P 4200 925
F 0 "Q2" V 4542 925 50  0000 C CNN
F 1 "AO4413" V 4451 925 50  0000 C CNN
F 2 "" H 4400 1025 50  0001 C CNN
F 3 "~" H 4200 925 50  0001 C CNN
	1    4200 925 
	0    1    -1   0   
$EndComp
Wire Wire Line
	1075 825  2050 825 
Connection ~ 1075 825 
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 68AF56BC
P 875 3375
F 0 "J2" H 767 3660 50  0000 C CNN
F 1 "Input lines" H 767 3569 50  0000 C CNN
F 2 "" H 875 3375 50  0001 C CNN
F 3 "~" H 875 3375 50  0001 C CNN
	1    875  3375
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 68AF68EE
P 1075 3475
F 0 "#PWR02" H 1075 3225 50  0001 C CNN
F 1 "GND" H 1080 3302 50  0000 C CNN
F 2 "" H 1075 3475 50  0001 C CNN
F 3 "" H 1075 3475 50  0001 C CNN
	1    1075 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 68AF71CB
P 1075 1525
F 0 "#PWR01" H 1075 1275 50  0001 C CNN
F 1 "GND" H 1080 1352 50  0000 C CNN
F 2 "" H 1075 1525 50  0001 C CNN
F 3 "" H 1075 1525 50  0001 C CNN
	1    1075 1525
	1    0    0    -1  
$EndComp
Text GLabel 1700 3275 2    50   Output ~ 0
CLK
Text GLabel 1700 3375 2    50   Output ~ 0
#WAIT
$Comp
L Device:R_Small R3
U 1 1 68AF7ED4
P 1300 3550
F 0 "R3" H 1359 3596 50  0000 L CNN
F 1 "10k" H 1359 3505 50  0000 L CNN
F 2 "" H 1300 3550 50  0001 C CNN
F 3 "~" H 1300 3550 50  0001 C CNN
	1    1300 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 68AF9661
P 1600 3550
F 0 "R4" H 1659 3596 50  0000 L CNN
F 1 "10k" H 1659 3505 50  0000 L CNN
F 2 "" H 1600 3550 50  0001 C CNN
F 3 "~" H 1600 3550 50  0001 C CNN
	1    1600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 68AF9C74
P 1300 3650
F 0 "#PWR04" H 1300 3400 50  0001 C CNN
F 1 "GND" H 1305 3477 50  0000 C CNN
F 2 "" H 1300 3650 50  0001 C CNN
F 3 "" H 1300 3650 50  0001 C CNN
	1    1300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3450 1300 3275
Wire Wire Line
	1300 3275 1075 3275
Wire Wire Line
	1300 3275 1700 3275
Connection ~ 1300 3275
Wire Wire Line
	1075 3375 1600 3375
Wire Wire Line
	1600 3450 1600 3375
Connection ~ 1600 3375
Wire Wire Line
	1600 3375 1700 3375
Text GLabel 1675 3725 2    50   Input ~ 10
5V
Wire Wire Line
	1675 3725 1600 3725
Wire Wire Line
	1600 3725 1600 3650
$Comp
L Switch:SW_Push SW1
U 1 1 68AFAB8B
P 1075 4550
F 0 "SW1" V 1121 4502 50  0000 R CNN
F 1 "RESET" V 1030 4502 50  0000 R CNN
F 2 "" H 1075 4750 50  0001 C CNN
F 3 "~" H 1075 4750 50  0001 C CNN
	1    1075 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 68AFBC18
P 1075 4250
F 0 "R1" H 1134 4296 50  0000 L CNN
F 1 "100R" H 1134 4205 50  0000 L CNN
F 2 "" H 1075 4250 50  0001 C CNN
F 3 "~" H 1075 4250 50  0001 C CNN
	1    1075 4250
	1    0    0    -1  
$EndComp
Text GLabel 1000 4050 0    50   Input ~ 10
5V
Wire Wire Line
	1000 4050 1075 4050
Wire Wire Line
	1075 4050 1075 4150
$Comp
L Device:C_Small C1
U 1 1 68AFC4CE
P 1475 4375
F 0 "C1" H 1567 4421 50  0000 L CNN
F 1 "2.2u" H 1567 4330 50  0000 L CNN
F 2 "" H 1475 4375 50  0001 C CNN
F 3 "~" H 1475 4375 50  0001 C CNN
	1    1475 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 4050 1475 4050
Wire Wire Line
	1475 4050 1475 4275
Connection ~ 1075 4050
Wire Wire Line
	1075 4750 1475 4750
Wire Wire Line
	1475 4750 1475 4475
$Comp
L Device:R_Small R2
U 1 1 68AFE64A
P 1075 4925
F 0 "R2" H 1134 4971 50  0000 L CNN
F 1 "47k" H 1134 4880 50  0000 L CNN
F 2 "" H 1075 4925 50  0001 C CNN
F 3 "~" H 1075 4925 50  0001 C CNN
	1    1075 4925
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 4825 1075 4750
Connection ~ 1075 4750
$Comp
L power:GND #PWR03
U 1 1 68AFEF31
P 1075 5025
F 0 "#PWR03" H 1075 4775 50  0001 C CNN
F 1 "GND" H 1080 4852 50  0000 C CNN
F 2 "" H 1075 5025 50  0001 C CNN
F 3 "" H 1075 5025 50  0001 C CNN
	1    1075 5025
	1    0    0    -1  
$EndComp
Text GLabel 2175 4750 2    50   Output ~ 0
#RST_IN
Wire Wire Line
	1575 4750 1475 4750
Connection ~ 1475 4750
$Comp
L Device:CP C2
U 1 1 68B00877
P 2050 1125
F 0 "C2" H 2168 1171 50  0000 L CNN
F 1 "470u" H 2168 1080 50  0000 L CNN
F 2 "" H 2088 975 50  0001 C CNN
F 3 "~" H 2050 1125 50  0001 C CNN
	1    2050 1125
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 68B00FF1
P 2475 1125
F 0 "C3" H 2567 1171 50  0000 L CNN
F 1 "1u" H 2567 1080 50  0000 L CNN
F 2 "" H 2475 1125 50  0001 C CNN
F 3 "~" H 2475 1125 50  0001 C CNN
	1    2475 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 975  2050 825 
Connection ~ 2050 825 
Wire Wire Line
	2050 825  2475 825 
Wire Wire Line
	2475 1025 2475 825 
Connection ~ 2475 825 
Wire Wire Line
	2475 825  2750 825 
Connection ~ 1075 1525
$Comp
L power:GND #PWR05
U 1 1 68B02610
P 2050 1275
F 0 "#PWR05" H 2050 1025 50  0001 C CNN
F 1 "GND" H 2055 1102 50  0000 C CNN
F 2 "" H 2050 1275 50  0001 C CNN
F 3 "" H 2050 1275 50  0001 C CNN
	1    2050 1275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 68B02928
P 2475 1225
F 0 "#PWR06" H 2475 975 50  0001 C CNN
F 1 "GND" H 2480 1052 50  0000 C CNN
F 2 "" H 2475 1225 50  0001 C CNN
F 3 "" H 2475 1225 50  0001 C CNN
	1    2475 1225
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 68B02C73
P 5050 1125
F 0 "C8" H 5142 1171 50  0000 L CNN
F 1 "1u" H 5142 1080 50  0000 L CNN
F 2 "" H 5050 1125 50  0001 C CNN
F 3 "~" H 5050 1125 50  0001 C CNN
	1    5050 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 825  5050 1025
Wire Wire Line
	4400 825  4625 825 
Connection ~ 4625 825 
Wire Wire Line
	4625 825  5050 825 
$Comp
L power:GND #PWR014
U 1 1 68B04AA5
P 4625 1225
F 0 "#PWR014" H 4625 975 50  0001 C CNN
F 1 "GND" H 4630 1052 50  0000 C CNN
F 2 "" H 4625 1225 50  0001 C CNN
F 3 "" H 4625 1225 50  0001 C CNN
	1    4625 1225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 68B04D71
P 5050 1225
F 0 "#PWR017" H 5050 975 50  0001 C CNN
F 1 "GND" H 5055 1052 50  0000 C CNN
F 2 "" H 5050 1225 50  0001 C CNN
F 3 "" H 5050 1225 50  0001 C CNN
	1    5050 1225
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C6
U 1 1 68B052BD
P 4625 1125
F 0 "C6" H 4713 1171 50  0000 L CNN
F 1 "47u" H 4713 1080 50  0000 L CNN
F 2 "" H 4625 1125 50  0001 C CNN
F 3 "~" H 4625 1125 50  0001 C CNN
	1    4625 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 825  4625 1025
$Comp
L Device:R_Small R10
U 1 1 68B06267
P 4200 2050
F 0 "R10" H 4259 2096 50  0000 L CNN
F 1 "1k" H 4259 2005 50  0000 L CNN
F 2 "" H 4200 2050 50  0001 C CNN
F 3 "~" H 4200 2050 50  0001 C CNN
	1    4200 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1125 4200 1825
$Comp
L power:GND #PWR012
U 1 1 68B06FF7
P 4200 2225
F 0 "#PWR012" H 4200 1975 50  0001 C CNN
F 1 "GND" H 4205 2052 50  0000 C CNN
F 2 "" H 4200 2225 50  0001 C CNN
F 3 "" H 4200 2225 50  0001 C CNN
	1    4200 2225
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC557 Q1
U 1 1 68B0F222
P 3575 1550
F 0 "Q1" H 3766 1504 50  0000 L CNN
F 1 "BC557" H 3766 1595 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3775 1475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC556BTA-D.pdf" H 3575 1550 50  0001 L CNN
	1    3575 1550
	1    0    0    1   
$EndComp
Wire Wire Line
	3675 1350 3675 825 
Connection ~ 3675 825 
Wire Wire Line
	3675 825  4000 825 
Wire Wire Line
	3675 1750 3675 1825
Wire Wire Line
	3675 1825 4200 1825
Connection ~ 4200 1825
$Comp
L Device:R_Small R8
U 1 1 68B112F1
P 3150 1750
F 0 "R8" H 3209 1796 50  0000 L CNN
F 1 "1.5k" H 3209 1705 50  0000 L CNN
F 2 "" H 3150 1750 50  0001 C CNN
F 3 "~" H 3150 1750 50  0001 C CNN
	1    3150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1650 3150 1550
Wire Wire Line
	3150 1550 3375 1550
$Comp
L Reference_Voltage:TL431D U3
U 1 1 68B13406
P 3150 2100
F 0 "U3" V 3196 2030 50  0000 R CNN
F 1 "TL431D" V 3105 2030 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3150 1850 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl431.pdf" H 3150 2100 50  0001 C CIN
	1    3150 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 2000 3150 1925
$Comp
L power:GND #PWR07
U 1 1 68B14DBF
P 3150 2375
F 0 "#PWR07" H 3150 2125 50  0001 C CNN
F 1 "GND" H 3155 2202 50  0000 C CNN
F 2 "" H 3150 2375 50  0001 C CNN
F 3 "" H 3150 2375 50  0001 C CNN
	1    3150 2375
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2375 3150 2200
$Comp
L Device:R_Small R6
U 1 1 68B25F65
P 2750 2250
F 0 "R6" H 2692 2204 50  0000 R CNN
F 1 "10k 1%" H 2692 2295 50  0000 R CNN
F 2 "" H 2750 2250 50  0001 C CNN
F 3 "~" H 2750 2250 50  0001 C CNN
	1    2750 2250
	1    0    0    1   
$EndComp
Wire Wire Line
	2750 2150 2750 2100
Wire Wire Line
	2750 2100 3050 2100
Wire Wire Line
	2750 2350 2750 2375
Wire Wire Line
	2750 2375 3150 2375
Connection ~ 3150 2375
$Comp
L Device:R_Small R5
U 1 1 68B28981
P 2750 1950
F 0 "R5" H 2692 1904 50  0000 R CNN
F 1 "12k 1%" H 2692 1995 50  0000 R CNN
F 2 "" H 2750 1950 50  0001 C CNN
F 3 "~" H 2750 1950 50  0001 C CNN
	1    2750 1950
	1    0    0    1   
$EndComp
Wire Wire Line
	2750 2050 2750 2100
Connection ~ 2750 2100
Wire Wire Line
	2750 1850 2750 825 
Connection ~ 2750 825 
Wire Wire Line
	2750 825  2925 825 
$Comp
L Device:R_Small R7
U 1 1 68B2CD42
P 2925 1750
F 0 "R7" H 2984 1796 50  0000 L CNN
F 1 "1k" H 2984 1705 50  0000 L CNN
F 2 "" H 2925 1750 50  0001 C CNN
F 3 "~" H 2925 1750 50  0001 C CNN
	1    2925 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 1850 2925 1925
Wire Wire Line
	2925 1925 3150 1925
Connection ~ 3150 1925
Wire Wire Line
	3150 1925 3150 1850
Wire Wire Line
	2925 1650 2925 825 
Connection ~ 2925 825 
Wire Wire Line
	2925 825  3675 825 
$Comp
L Device:R_Small R9
U 1 1 68B311FC
P 3675 1975
F 0 "R9" H 3616 1929 50  0000 R CNN
F 1 "68k" H 3616 2020 50  0000 R CNN
F 2 "" H 3675 1975 50  0001 C CNN
F 3 "~" H 3675 1975 50  0001 C CNN
	1    3675 1975
	-1   0    0    1   
$EndComp
Wire Wire Line
	3675 1875 3675 1825
$Comp
L Diode:1N4148 D2
U 1 1 68B33829
P 3675 2300
F 0 "D2" V 3721 2220 50  0000 R CNN
F 1 "1N4148" V 3630 2220 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3675 2125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3675 2300 50  0001 C CNN
	1    3675 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3675 2075 3675 2150
Connection ~ 3675 1825
Wire Wire Line
	3675 2450 3675 2650
Wire Wire Line
	3675 2650 2350 2650
Wire Wire Line
	2350 2650 2350 2100
Wire Wire Line
	2350 2100 2750 2100
Text GLabel 5575 825  2    50   Output ~ 10
5V
Wire Wire Line
	5575 825  5350 825 
Connection ~ 5050 825 
$Comp
L Device:LED D3
U 1 1 68B405DF
P 4600 2050
F 0 "D3" V 4639 1932 50  0000 R CNN
F 1 "OVP" V 4548 1932 50  0000 R CNN
F 2 "" H 4600 2050 50  0001 C CNN
F 3 "~" H 4600 2050 50  0001 C CNN
	1    4600 2050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 68B41472
P 4400 1825
F 0 "R11" V 4204 1825 50  0000 C CNN
F 1 "1k" V 4295 1825 50  0000 C CNN
F 2 "" H 4400 1825 50  0001 C CNN
F 3 "~" H 4400 1825 50  0001 C CNN
	1    4400 1825
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 1825 4300 1825
Wire Wire Line
	4500 1825 4600 1825
Wire Wire Line
	4600 1825 4600 1900
$Comp
L power:GND #PWR013
U 1 1 68B44330
P 4600 2200
F 0 "#PWR013" H 4600 1950 50  0001 C CNN
F 1 "GND" H 4605 2027 50  0000 C CNN
F 2 "" H 4600 2200 50  0001 C CNN
F 3 "" H 4600 2200 50  0001 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 68B44647
P 5025 2050
F 0 "D4" V 5064 1932 50  0000 R CNN
F 1 "OK" V 4973 1932 50  0000 R CNN
F 2 "" H 5025 2050 50  0001 C CNN
F 3 "~" H 5025 2050 50  0001 C CNN
	1    5025 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 68B44C6E
P 5025 2200
F 0 "#PWR016" H 5025 1950 50  0001 C CNN
F 1 "GND" H 5030 2027 50  0000 C CNN
F 2 "" H 5025 2200 50  0001 C CNN
F 3 "" H 5025 2200 50  0001 C CNN
	1    5025 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 68B45E0A
P 5025 1800
F 0 "R12" H 5084 1846 50  0000 L CNN
F 1 "1k" H 5084 1755 50  0000 L CNN
F 2 "" H 5025 1800 50  0001 C CNN
F 3 "~" H 5025 1800 50  0001 C CNN
	1    5025 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5025 1700 5025 1550
Wire Wire Line
	5025 1550 5350 1550
Wire Wire Line
	5350 1550 5350 825 
Connection ~ 5350 825 
Wire Wire Line
	5350 825  5050 825 
Wire Wire Line
	4200 1825 4200 1950
Wire Wire Line
	4200 2225 4200 2150
$Comp
L 74xx:74HC14 U1
U 1 1 68B5F6AC
P 18525 7325
F 0 "U1" H 18525 7642 50  0000 C CNN
F 1 "74AC14" H 18525 7551 50  0000 C CNN
F 2 "" H 18525 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 18525 7325 50  0001 C CNN
	1    18525 7325
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 2 1 68B60318
P 18525 7850
F 0 "U1" H 18525 8167 50  0000 C CNN
F 1 "74AC14" H 18525 8076 50  0000 C CNN
F 2 "" H 18525 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 18525 7850 50  0001 C CNN
	2    18525 7850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 3 1 68B61202
P 18525 8375
F 0 "U1" H 18525 8692 50  0000 C CNN
F 1 "74AC14" H 18525 8601 50  0000 C CNN
F 2 "" H 18525 8375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 18525 8375 50  0001 C CNN
	3    18525 8375
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 4 1 68B628FF
P 19275 9250
F 0 "U1" H 19275 9567 50  0000 C CNN
F 1 "74AC14" H 19275 9476 50  0000 C CNN
F 2 "" H 19275 9250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 19275 9250 50  0001 C CNN
	4    19275 9250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 5 1 68B6395B
P 1875 4750
F 0 "U1" H 1875 5067 50  0000 C CNN
F 1 "74AC14" H 1875 4976 50  0000 C CNN
F 2 "" H 1875 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 1875 4750 50  0001 C CNN
	5    1875 4750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 6 1 68B646F0
P 16675 7525
F 0 "U1" H 16675 7842 50  0000 C CNN
F 1 "74AC14" H 16675 7751 50  0000 C CNN
F 2 "" H 16675 7525 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 16675 7525 50  0001 C CNN
	6    16675 7525
	1    0    0    1   
$EndComp
$Comp
L 74xx:74HC14 U1
U 7 1 68B655D8
P 6700 1650
F 0 "U1" H 6930 1696 50  0000 L CNN
F 1 "74AC14" H 6930 1605 50  0000 L CNN
F 2 "" H 6700 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 6700 1650 50  0001 C CNN
	7    6700 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 68B678EC
P 6875 1000
F 0 "C10" H 6967 1046 50  0000 L CNN
F 1 "100n" H 6967 955 50  0000 L CNN
F 2 "" H 6875 1000 50  0001 C CNN
F 3 "~" H 6875 1000 50  0001 C CNN
	1    6875 1000
	1    0    0    -1  
$EndComp
Text GLabel 6600 825  0    50   Input ~ 10
5V
$Comp
L power:GND #PWR022
U 1 1 68B68530
P 6875 1100
F 0 "#PWR022" H 6875 850 50  0001 C CNN
F 1 "GND" H 6880 927 50  0000 C CNN
F 2 "" H 6875 1100 50  0001 C CNN
F 3 "" H 6875 1100 50  0001 C CNN
	1    6875 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 825  6875 900 
Wire Wire Line
	6700 1150 6700 825 
Wire Wire Line
	6600 825  6700 825 
Connection ~ 6700 825 
Wire Wire Line
	6700 825  6875 825 
$Comp
L power:GND #PWR021
U 1 1 68B6BEEB
P 6700 2150
F 0 "#PWR021" H 6700 1900 50  0001 C CNN
F 1 "GND" H 6705 1977 50  0000 C CNN
F 2 "" H 6700 2150 50  0001 C CNN
F 3 "" H 6700 2150 50  0001 C CNN
	1    6700 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x28_Female J4
U 1 1 68B72C77
P 17025 3550
F 0 "J4" H 17000 5100 50  0000 L CNN
F 1 "To address board" H 16700 5000 50  0000 L CNN
F 2 "" H 17025 3550 50  0001 C CNN
F 3 "~" H 17025 3550 50  0001 C CNN
	1    17025 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x33_Female J6
U 1 1 68B75BEE
P 18475 3850
F 0 "J6" H 18425 5675 50  0000 L CNN
F 1 "To ALU board" H 18225 5575 50  0000 L CNN
F 2 "" H 18475 3850 50  0001 C CNN
F 3 "~" H 18475 3850 50  0001 C CNN
	1    18475 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR049
U 1 1 68B796B3
P 16450 2350
F 0 "#PWR049" H 16450 2100 50  0001 C CNN
F 1 "GND" H 16455 2177 50  0000 C CNN
F 2 "" H 16450 2350 50  0001 C CNN
F 3 "" H 16450 2350 50  0001 C CNN
	1    16450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	16450 2350 16450 2250
Wire Wire Line
	16450 2250 16825 2250
Text GLabel 16825 2350 0    50   3State ~ 0
D7
Text GLabel 16825 2450 0    50   3State ~ 0
D6
Text GLabel 16825 2550 0    50   3State ~ 0
D5
Text GLabel 16825 2650 0    50   3State ~ 0
D4
Text GLabel 16825 2750 0    50   3State ~ 0
D3
Text GLabel 16825 2850 0    50   3State ~ 0
D2
Text GLabel 16825 2950 0    50   3State ~ 0
D1
Text GLabel 16825 3050 0    50   3State ~ 0
D0
Text GLabel 16825 3750 0    50   Input ~ 0
#RST_OUT
Text GLabel 16825 3850 0    50   Output ~ 0
INT
Text GLabel 16825 3950 0    50   Input ~ 0
#INTA
$Comp
L Device:R_Small R15
U 1 1 68B7DEA0
P 17250 4000
F 0 "R15" H 17309 4046 50  0000 L CNN
F 1 "10k" H 17309 3955 50  0000 L CNN
F 2 "" H 17250 4000 50  0001 C CNN
F 3 "~" H 17250 4000 50  0001 C CNN
	1    17250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	16825 3850 17250 3850
Wire Wire Line
	17250 3850 17250 3900
$Comp
L power:GND #PWR051
U 1 1 68B82BE3
P 17250 4100
F 0 "#PWR051" H 17250 3850 50  0001 C CNN
F 1 "GND" H 17255 3927 50  0000 C CNN
F 2 "" H 17250 4100 50  0001 C CNN
F 3 "" H 17250 4100 50  0001 C CNN
	1    17250 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR056
U 1 1 68B840F2
P 17900 2350
F 0 "#PWR056" H 17900 2100 50  0001 C CNN
F 1 "GND" H 17905 2177 50  0000 C CNN
F 2 "" H 17900 2350 50  0001 C CNN
F 3 "" H 17900 2350 50  0001 C CNN
	1    17900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	17900 2350 17900 2250
Wire Wire Line
	17900 2250 18275 2250
Text GLabel 18275 3050 0    50   3State ~ 0
D7
Text GLabel 18275 2950 0    50   3State ~ 0
D6
Text GLabel 18275 2850 0    50   3State ~ 0
D5
Text GLabel 18275 2750 0    50   3State ~ 0
D4
Text GLabel 18275 2650 0    50   3State ~ 0
D3
Text GLabel 18275 2550 0    50   3State ~ 0
D2
Text GLabel 18275 2450 0    50   3State ~ 0
D1
Text GLabel 18275 2350 0    50   3State ~ 0
D0
$Comp
L Device:R_Small R17
U 1 1 68B883E8
P 18700 5600
F 0 "R17" H 18759 5646 50  0000 L CNN
F 1 "10k" H 18759 5555 50  0000 L CNN
F 2 "" H 18700 5600 50  0001 C CNN
F 3 "~" H 18700 5600 50  0001 C CNN
	1    18700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	18275 5450 18700 5450
Wire Wire Line
	18700 5450 18700 5500
$Comp
L power:GND #PWR058
U 1 1 68B883F0
P 18700 5700
F 0 "#PWR058" H 18700 5450 50  0001 C CNN
F 1 "GND" H 18705 5527 50  0000 C CNN
F 2 "" H 18700 5700 50  0001 C CNN
F 3 "" H 18700 5700 50  0001 C CNN
	1    18700 5700
	1    0    0    -1  
$EndComp
Text GLabel 18275 5450 0    50   Output ~ 0
FLAG
$Comp
L Connector:Conn_01x06_Female J5
U 1 1 68B95927
P 18475 1450
F 0 "J5" H 18450 1875 50  0000 L CNN
F 1 "ALU BOARD POWER" H 18125 1775 50  0000 L CNN
F 2 "" H 18475 1450 50  0001 C CNN
F 3 "~" H 18475 1450 50  0001 C CNN
	1    18475 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J3
U 1 1 68B9638B
P 17025 1450
F 0 "J3" H 16975 1875 50  0000 L CNN
F 1 "ADDRESS BOARD POWER" H 16575 1775 50  0000 L CNN
F 2 "" H 17025 1450 50  0001 C CNN
F 3 "~" H 17025 1450 50  0001 C CNN
	1    17025 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	18275 1250 18275 1350
Connection ~ 18275 1350
Wire Wire Line
	18275 1350 18275 1450
Wire Wire Line
	18275 1550 18275 1650
Connection ~ 18275 1650
Wire Wire Line
	18275 1650 18275 1750
Wire Wire Line
	16825 1250 16825 1350
Connection ~ 16825 1350
Wire Wire Line
	16825 1350 16825 1450
Wire Wire Line
	16825 1550 16825 1650
Connection ~ 16825 1650
Wire Wire Line
	16825 1650 16825 1750
$Comp
L power:GND #PWR057
U 1 1 68BAB09C
P 18275 1750
F 0 "#PWR057" H 18275 1500 50  0001 C CNN
F 1 "GND" H 18280 1577 50  0000 C CNN
F 2 "" H 18275 1750 50  0001 C CNN
F 3 "" H 18275 1750 50  0001 C CNN
	1    18275 1750
	1    0    0    -1  
$EndComp
Connection ~ 18275 1750
$Comp
L power:GND #PWR050
U 1 1 68BAF513
P 16825 1750
F 0 "#PWR050" H 16825 1500 50  0001 C CNN
F 1 "GND" H 16830 1577 50  0000 C CNN
F 2 "" H 16825 1750 50  0001 C CNN
F 3 "" H 16825 1750 50  0001 C CNN
	1    16825 1750
	1    0    0    -1  
$EndComp
Connection ~ 16825 1750
Text GLabel 16675 1350 0    50   Input ~ 10
5V
Wire Wire Line
	16675 1350 16825 1350
Text GLabel 18125 1350 0    50   Input ~ 10
5V
Wire Wire Line
	18125 1350 18275 1350
Text GLabel 16375 7525 0    50   Input ~ 0
CLK
$Comp
L Memory_EPROM:27C512 U4
U 1 1 68BBED06
P 3750 7750
F 0 "U4" H 3800 7750 50  0000 C CNN
F 1 "27C512" H 3825 7650 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 3750 7750 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 3750 7750 50  0001 C CNN
	1    3750 7750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 68BC0F45
P 3925 6375
F 0 "C4" H 4017 6421 50  0000 L CNN
F 1 "1u" H 4017 6330 50  0000 L CNN
F 2 "" H 3925 6375 50  0001 C CNN
F 3 "~" H 3925 6375 50  0001 C CNN
	1    3925 6375
	1    0    0    -1  
$EndComp
Text GLabel 3650 6200 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR010
U 1 1 68BC0F4C
P 3925 6475
F 0 "#PWR010" H 3925 6225 50  0001 C CNN
F 1 "GND" H 3930 6302 50  0000 C CNN
F 2 "" H 3925 6475 50  0001 C CNN
F 3 "" H 3925 6475 50  0001 C CNN
	1    3925 6475
	1    0    0    -1  
$EndComp
Wire Wire Line
	3925 6200 3925 6275
Wire Wire Line
	3650 6200 3750 6200
Connection ~ 3750 6200
Wire Wire Line
	3750 6200 3925 6200
Wire Wire Line
	3750 6200 3750 6650
$Comp
L power:GND #PWR08
U 1 1 68BC555C
P 3750 8850
F 0 "#PWR08" H 3750 8600 50  0001 C CNN
F 1 "GND" H 3755 8677 50  0000 C CNN
F 2 "" H 3750 8850 50  0001 C CNN
F 3 "" H 3750 8850 50  0001 C CNN
	1    3750 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 8550 3350 8650
Wire Wire Line
	3350 8850 3750 8850
Connection ~ 3350 8650
Wire Wire Line
	3350 8650 3350 8850
Connection ~ 3750 8850
$Comp
L 74xx:74HC273 U7
U 1 1 68BC93D6
P 5525 7350
F 0 "U7" H 5525 7150 50  0000 C CNN
F 1 "74HCT273" H 5525 7050 50  0000 C CNN
F 2 "" H 5525 7350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT273.pdf" H 5525 7350 50  0001 C CNN
	1    5525 7350
	1    0    0    -1  
$EndComp
Text GLabel 5025 7850 0    50   Input ~ 0
#RST_IN
Text GLabel 5025 7750 0    50   Input ~ 0
CLK
$Comp
L power:GND #PWR019
U 1 1 68BCAB1A
P 5525 8150
F 0 "#PWR019" H 5525 7900 50  0001 C CNN
F 1 "GND" H 5530 7977 50  0000 C CNN
F 2 "" H 5525 8150 50  0001 C CNN
F 3 "" H 5525 8150 50  0001 C CNN
	1    5525 8150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 68BCC577
P 5700 6400
F 0 "C9" H 5792 6446 50  0000 L CNN
F 1 "100n" H 5792 6355 50  0000 L CNN
F 2 "" H 5700 6400 50  0001 C CNN
F 3 "~" H 5700 6400 50  0001 C CNN
	1    5700 6400
	1    0    0    -1  
$EndComp
Text GLabel 5425 6225 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR020
U 1 1 68BCC57E
P 5700 6500
F 0 "#PWR020" H 5700 6250 50  0001 C CNN
F 1 "GND" H 5705 6327 50  0000 C CNN
F 2 "" H 5700 6500 50  0001 C CNN
F 3 "" H 5700 6500 50  0001 C CNN
	1    5700 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6225 5700 6300
Wire Wire Line
	5525 6550 5525 6225
Wire Wire Line
	5425 6225 5525 6225
Connection ~ 5525 6225
Wire Wire Line
	5525 6225 5700 6225
Text GLabel 5025 6850 0    50   Input ~ 0
#WAIT
Text GLabel 6025 6850 2    50   Output ~ 0
#WAIT_SYNC
Text GLabel 3350 8350 0    50   Input ~ 0
#WAIT_SYNC
Wire Wire Line
	4150 6850 4525 6850
Wire Wire Line
	4525 6850 4525 7350
Wire Wire Line
	4525 7350 5025 7350
Wire Wire Line
	4150 6950 4450 6950
Wire Wire Line
	4450 6950 4450 7250
Wire Wire Line
	4450 7250 5025 7250
Wire Wire Line
	4150 7050 4375 7050
Wire Wire Line
	4375 7050 4375 7150
Wire Wire Line
	4375 7150 5025 7150
Wire Wire Line
	4150 7150 4300 7150
Wire Wire Line
	4300 7150 4300 7100
Wire Wire Line
	4300 7100 4625 7100
Wire Wire Line
	4625 7100 4625 7050
Wire Wire Line
	4625 7050 5025 7050
Wire Wire Line
	4150 7250 4375 7250
Wire Wire Line
	4375 7250 4375 7450
Wire Wire Line
	4375 7450 5025 7450
Wire Wire Line
	4150 7350 4300 7350
Wire Wire Line
	4300 7350 4300 7550
Wire Wire Line
	4300 7550 5025 7550
Wire Wire Line
	4150 7450 4250 7450
Wire Wire Line
	4250 7450 4250 7000
Wire Wire Line
	4250 7000 4625 7000
Wire Wire Line
	4625 7000 4625 6950
Wire Wire Line
	4625 6950 5025 6950
NoConn ~ 4150 7550
Text GLabel 6025 7550 2    50   Output ~ 0
STATE0
Text GLabel 6025 6950 2    50   Output ~ 0
STATE1
Text GLabel 6025 7450 2    50   Output ~ 0
STATE2
Text GLabel 6025 7050 2    50   Output ~ 0
STATE3
Text GLabel 6025 7350 2    50   Output ~ 0
STATE4
Text GLabel 6025 7150 2    50   Output ~ 0
STATE5
Text GLabel 6025 7250 2    50   Output ~ 0
#RST_OUT
Text GLabel 3350 6850 0    50   Input ~ 0
STATE0
Text GLabel 3350 6950 0    50   Input ~ 0
STATE1
Text GLabel 3350 7050 0    50   Input ~ 0
STATE2
Text GLabel 3350 7150 0    50   Input ~ 0
STATE3
Text GLabel 3350 7250 0    50   Input ~ 0
STATE4
Text GLabel 3350 7450 0    50   Input ~ 0
FLAG
$Comp
L 74xx:74HC74 U2
U 1 1 68BF2975
P 1925 7150
F 0 "U2" H 2225 7525 50  0000 C CNN
F 1 "74HCT74" H 2225 7425 50  0000 C CNN
F 2 "" H 1925 7150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1925 7150 50  0001 C CNN
	1    1925 7150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U2
U 2 1 68BF2F9E
P 1925 8050
F 0 "U2" H 2225 8450 50  0000 C CNN
F 1 "74HCT74" H 2225 8325 50  0000 C CNN
F 2 "" H 1925 8050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1925 8050 50  0001 C CNN
	2    1925 8050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC74 U2
U 3 1 68BF4693
P 7775 1650
F 0 "U2" H 8005 1696 50  0000 L CNN
F 1 "74HCT74" H 8005 1605 50  0000 L CNN
F 2 "" H 7775 1650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7775 1650 50  0001 C CNN
	3    7775 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 68BF58C9
P 7775 2050
F 0 "#PWR023" H 7775 1800 50  0001 C CNN
F 1 "GND" H 7780 1877 50  0000 C CNN
F 2 "" H 7775 2050 50  0001 C CNN
F 3 "" H 7775 2050 50  0001 C CNN
	1    7775 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 68BF6F1C
P 7950 1000
F 0 "C11" H 8042 1046 50  0000 L CNN
F 1 "100n" H 8042 955 50  0000 L CNN
F 2 "" H 7950 1000 50  0001 C CNN
F 3 "~" H 7950 1000 50  0001 C CNN
	1    7950 1000
	1    0    0    -1  
$EndComp
Text GLabel 7675 825  0    50   Input ~ 10
5V
$Comp
L power:GND #PWR024
U 1 1 68BF6F23
P 7950 1100
F 0 "#PWR024" H 7950 850 50  0001 C CNN
F 1 "GND" H 7955 927 50  0000 C CNN
F 2 "" H 7950 1100 50  0001 C CNN
F 3 "" H 7950 1100 50  0001 C CNN
	1    7950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 825  7950 900 
Wire Wire Line
	7675 825  7775 825 
Connection ~ 7775 825 
Wire Wire Line
	7775 825  7950 825 
Wire Wire Line
	7775 825  7775 1250
Text GLabel 1625 7050 0    50   Input ~ 0
INT
Text GLabel 2225 7050 2    50   Output ~ 0
INT_SYNC
NoConn ~ 2225 7250
Text GLabel 1875 6775 0    50   Input ~ 10
5V
Wire Wire Line
	1875 6775 1925 6775
Wire Wire Line
	1925 6775 1925 6850
NoConn ~ 2225 7950
Text GLabel 1875 8450 0    50   Input ~ 10
5V
Wire Wire Line
	1875 8450 1925 8450
Wire Wire Line
	1925 8450 1925 8350
Text GLabel 1625 7150 0    50   Input ~ 0
INT_SAMPLE
Text GLabel 1625 7950 0    50   Input ~ 0
IE_DATA
Text GLabel 1625 8050 0    50   Input ~ 0
IE_LATCH
Wire Wire Line
	2225 8150 2425 8150
Wire Wire Line
	2425 8150 2425 7525
Wire Wire Line
	2425 7525 1925 7525
Wire Wire Line
	1925 7525 1925 7450
Wire Wire Line
	1800 7675 1925 7675
Wire Wire Line
	1925 7675 1925 7750
Text GLabel 1800 7675 0    50   Input ~ 0
#RST_OUT
Text GLabel 3350 7350 0    50   Input ~ 0
INT_SYNC
$Comp
L 74xx:74HCT574 U15
U 1 1 68C30B51
P 13650 2250
F 0 "U15" H 13650 2025 50  0000 C CNN
F 1 "74HCT574" H 13650 1925 50  0000 C CNN
F 2 "" H 13650 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 13650 2250 50  0001 C CNN
	1    13650 2250
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 68C331CE
P 13825 1300
F 0 "C20" H 13917 1346 50  0000 L CNN
F 1 "100n" H 13917 1255 50  0000 L CNN
F 2 "" H 13825 1300 50  0001 C CNN
F 3 "~" H 13825 1300 50  0001 C CNN
	1    13825 1300
	1    0    0    -1  
$EndComp
Text GLabel 13550 1125 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR042
U 1 1 68C331D5
P 13825 1400
F 0 "#PWR042" H 13825 1150 50  0001 C CNN
F 1 "GND" H 13830 1227 50  0000 C CNN
F 2 "" H 13825 1400 50  0001 C CNN
F 3 "" H 13825 1400 50  0001 C CNN
	1    13825 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13825 1125 13825 1200
Wire Wire Line
	13650 1450 13650 1125
Wire Wire Line
	13550 1125 13650 1125
Connection ~ 13650 1125
Wire Wire Line
	13650 1125 13825 1125
$Comp
L power:GND #PWR040
U 1 1 68C38468
P 13650 3050
F 0 "#PWR040" H 13650 2800 50  0001 C CNN
F 1 "GND" H 13655 2877 50  0000 C CNN
F 2 "" H 13650 3050 50  0001 C CNN
F 3 "" H 13650 3050 50  0001 C CNN
	1    13650 3050
	-1   0    0    -1  
$EndComp
Text GLabel 14150 2650 2    50   Input ~ 0
LATCH_IR
Wire Wire Line
	14150 2750 14150 3050
Wire Wire Line
	14150 3050 13650 3050
Connection ~ 13650 3050
Text GLabel 14150 1750 2    50   Input ~ 0
D7
Text GLabel 14150 1850 2    50   Input ~ 0
D6
Text GLabel 14150 1950 2    50   Input ~ 0
D5
Text GLabel 14150 2050 2    50   Input ~ 0
D4
Text GLabel 14150 2150 2    50   Input ~ 0
D3
Text GLabel 14150 2250 2    50   Input ~ 0
D2
Text GLabel 14150 2350 2    50   Input ~ 0
D1
Text GLabel 14150 2450 2    50   Input ~ 0
D0
Text GLabel 13150 2450 0    50   Output ~ 0
IR0
Text GLabel 13150 2350 0    50   Output ~ 0
IR1
Text GLabel 13150 2250 0    50   Output ~ 0
IR2
Text GLabel 13150 2150 0    50   Output ~ 0
IR3
Text GLabel 13150 2050 0    50   Output ~ 0
IR4
Text GLabel 13150 1950 0    50   Output ~ 0
IR5
Text GLabel 13150 1850 0    50   Output ~ 0
IR6
Text GLabel 13150 1750 0    50   Output ~ 0
IR7
Text GLabel 3350 8250 0    50   Input ~ 0
IR0
Text GLabel 3350 8050 0    50   Input ~ 0
IR1
Text GLabel 3350 8150 0    50   Input ~ 0
IR2
Text GLabel 3350 7550 0    50   Input ~ 0
IR3
Text GLabel 3350 7650 0    50   Input ~ 0
IR4
Text GLabel 3350 7750 0    50   Input ~ 0
IR5
Text GLabel 3350 7950 0    50   Input ~ 0
IR6
Text GLabel 3350 7850 0    50   Input ~ 0
IR7
Text GLabel 16825 4050 0    50   Input ~ 0
ADDR_OP1
Text GLabel 16825 4150 0    50   Input ~ 0
ADDR_OP0
$Comp
L Device:C_Small C5
U 1 1 68D94A91
P 3925 9550
F 0 "C5" H 4017 9596 50  0000 L CNN
F 1 "1u" H 4017 9505 50  0000 L CNN
F 2 "" H 3925 9550 50  0001 C CNN
F 3 "~" H 3925 9550 50  0001 C CNN
	1    3925 9550
	1    0    0    -1  
$EndComp
Text GLabel 3650 9375 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR011
U 1 1 68D94A98
P 3925 9650
F 0 "#PWR011" H 3925 9400 50  0001 C CNN
F 1 "GND" H 3930 9477 50  0000 C CNN
F 2 "" H 3925 9650 50  0001 C CNN
F 3 "" H 3925 9650 50  0001 C CNN
	1    3925 9650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3925 9375 3925 9450
Wire Wire Line
	3650 9375 3750 9375
Connection ~ 3750 9375
Wire Wire Line
	3750 9375 3925 9375
Wire Wire Line
	3750 9375 3750 9825
$Comp
L power:GND #PWR09
U 1 1 68D94AA3
P 3750 12025
F 0 "#PWR09" H 3750 11775 50  0001 C CNN
F 1 "GND" H 3755 11852 50  0000 C CNN
F 2 "" H 3750 12025 50  0001 C CNN
F 3 "" H 3750 12025 50  0001 C CNN
	1    3750 12025
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 12025 3750 12025
Text GLabel 3350 10025 0    50   Input ~ 0
STATE0
Text GLabel 3350 10125 0    50   Input ~ 0
STATE1
Text GLabel 3350 10225 0    50   Input ~ 0
STATE2
Text GLabel 3350 10325 0    50   Input ~ 0
STATE3
Text GLabel 3350 10425 0    50   Input ~ 0
STATE4
Text GLabel 3350 10625 0    50   Input ~ 0
FLAG
Text GLabel 3350 10525 0    50   Input ~ 0
INT_SYNC
Text GLabel 3350 11425 0    50   Input ~ 0
IR0
Text GLabel 3350 11225 0    50   Input ~ 0
IR1
Text GLabel 3350 11325 0    50   Input ~ 0
IR2
Text GLabel 3350 10725 0    50   Input ~ 0
IR3
Text GLabel 3350 10825 0    50   Input ~ 0
IR4
Text GLabel 3350 10925 0    50   Input ~ 0
IR5
Text GLabel 3350 11125 0    50   Input ~ 0
IR6
Text GLabel 3350 11025 0    50   Input ~ 0
IR7
$Comp
L Memory_EPROM:27C256 U5
U 1 1 68D94AB9
P 3750 10925
F 0 "U5" H 3825 10900 50  0000 C CNN
F 1 "27C256" H 3825 10800 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 3750 10925 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0014.pdf" H 3750 10925 50  0001 C CNN
	1    3750 10925
	1    0    0    -1  
$EndComp
Connection ~ 3750 12025
Wire Wire Line
	3350 11825 3350 12025
Wire Wire Line
	3350 11725 3350 11825
Connection ~ 3350 11825
Text GLabel 3350 11625 0    50   Input ~ 0
STATE5
$Comp
L Device:C_Small C7
U 1 1 68D94AC4
P 5000 11225
F 0 "C7" H 5092 11271 50  0000 L CNN
F 1 "100n" H 5092 11180 50  0000 L CNN
F 2 "" H 5000 11225 50  0001 C CNN
F 3 "~" H 5000 11225 50  0001 C CNN
	1    5000 11225
	1    0    0    1   
$EndComp
Text GLabel 4925 11075 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR015
U 1 1 68D94ACB
P 5000 11325
F 0 "#PWR015" H 5000 11075 50  0001 C CNN
F 1 "GND" H 5005 11152 50  0000 C CNN
F 2 "" H 5000 11325 50  0001 C CNN
F 3 "" H 5000 11325 50  0001 C CNN
	1    5000 11325
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 68D94AD1
P 5425 9475
F 0 "#PWR018" H 5425 9225 50  0001 C CNN
F 1 "GND" H 5430 9302 50  0000 C CNN
F 2 "" H 5425 9475 50  0001 C CNN
F 3 "" H 5425 9475 50  0001 C CNN
	1    5425 9475
	-1   0    0    -1  
$EndComp
Text GLabel 5500 10725 2    50   Output ~ 0
#DATA_WR3
Text GLabel 5500 10625 2    50   Output ~ 0
DATA_RD1
Text GLabel 5500 10525 2    50   Output ~ 0
DATA_RD2
Text GLabel 5500 10425 2    50   Output ~ 0
DATA_RD3
Text GLabel 5500 10325 2    50   Output ~ 0
DATA_WR0
Text GLabel 5500 10225 2    50   Output ~ 0
DATA_WR1
Text GLabel 5500 10125 2    50   Output ~ 0
DATA_WR2
Text GLabel 5500 10025 2    50   Output ~ 0
DATA_WR3
$Comp
L 74xx:74HCT574 U6
U 1 1 68D94ADF
P 5000 10225
F 0 "U6" H 5000 10025 50  0000 C CNN
F 1 "74HCT574" H 5000 9925 50  0000 C CNN
F 2 "" H 5000 10225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 5000 10225 50  0001 C CNN
	1    5000 10225
	1    0    0    1   
$EndComp
Wire Wire Line
	4500 9725 4500 9425
Wire Wire Line
	4500 9425 5000 9425
Connection ~ 5000 9425
Text GLabel 4500 9825 0    50   Input ~ 0
CLK
Wire Wire Line
	4925 11075 5000 11075
Wire Wire Line
	5000 11075 5000 11025
Wire Wire Line
	5000 11125 5000 11075
Connection ~ 5000 11075
Wire Wire Line
	5000 9425 5425 9425
Wire Wire Line
	5425 9425 5425 9475
Wire Wire Line
	4150 10725 4500 10725
Wire Wire Line
	4500 10625 4150 10625
Wire Wire Line
	4150 10525 4500 10525
Wire Wire Line
	4500 10425 4150 10425
Wire Wire Line
	4150 10325 4500 10325
Wire Wire Line
	4150 10225 4325 10225
Wire Wire Line
	4325 10225 4325 10025
Wire Wire Line
	4325 10025 4500 10025
Wire Wire Line
	4150 10125 4500 10125
Wire Wire Line
	4150 10025 4250 10025
Wire Wire Line
	4250 10025 4250 10175
Wire Wire Line
	4250 10175 4500 10175
Wire Wire Line
	4500 10175 4500 10225
Text Notes 4425 8375 0    118  ~ 24
EPROM A
Text Notes 4425 8575 0    79   ~ 16
State Counter
Text Notes 1600 8725 0    79   ~ 16
IE Latch
Text Notes 1600 6650 0    79   ~ 16
INT Latch
Text Notes 4475 11825 0    118  ~ 24
EPROM C
Text Notes 4275 12000 0    79   ~ 16
Data Bus Controller
$Comp
L Device:C_Small C13
U 1 1 68DE7B92
P 8400 9550
F 0 "C13" H 8492 9596 50  0000 L CNN
F 1 "1u" H 8492 9505 50  0000 L CNN
F 2 "" H 8400 9550 50  0001 C CNN
F 3 "~" H 8400 9550 50  0001 C CNN
	1    8400 9550
	1    0    0    -1  
$EndComp
Text GLabel 8125 9375 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR028
U 1 1 68DE7B99
P 8400 9650
F 0 "#PWR028" H 8400 9400 50  0001 C CNN
F 1 "GND" H 8405 9477 50  0000 C CNN
F 2 "" H 8400 9650 50  0001 C CNN
F 3 "" H 8400 9650 50  0001 C CNN
	1    8400 9650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 9375 8400 9450
Wire Wire Line
	8125 9375 8225 9375
Connection ~ 8225 9375
Wire Wire Line
	8225 9375 8400 9375
Wire Wire Line
	8225 9375 8225 9825
$Comp
L power:GND #PWR026
U 1 1 68DE7BA4
P 8225 12025
F 0 "#PWR026" H 8225 11775 50  0001 C CNN
F 1 "GND" H 8230 11852 50  0000 C CNN
F 2 "" H 8225 12025 50  0001 C CNN
F 3 "" H 8225 12025 50  0001 C CNN
	1    8225 12025
	1    0    0    -1  
$EndComp
Wire Wire Line
	7825 12025 8225 12025
Text GLabel 7825 10025 0    50   Input ~ 0
STATE0
Text GLabel 7825 10125 0    50   Input ~ 0
STATE1
Text GLabel 7825 10225 0    50   Input ~ 0
STATE2
Text GLabel 7825 10325 0    50   Input ~ 0
STATE3
Text GLabel 7825 10425 0    50   Input ~ 0
STATE4
Text GLabel 7825 10625 0    50   Input ~ 0
FLAG
Text GLabel 7825 10525 0    50   Input ~ 0
INT_SYNC
Text GLabel 7825 11425 0    50   Input ~ 0
IR0
Text GLabel 7825 11225 0    50   Input ~ 0
IR1
Text GLabel 7825 11325 0    50   Input ~ 0
IR2
Text GLabel 7825 10725 0    50   Input ~ 0
IR3
Text GLabel 7825 10825 0    50   Input ~ 0
IR4
Text GLabel 7825 10925 0    50   Input ~ 0
IR5
Text GLabel 7825 11125 0    50   Input ~ 0
IR6
Text GLabel 7825 11025 0    50   Input ~ 0
IR7
$Comp
L Memory_EPROM:27C256 U9
U 1 1 68DE7BBA
P 8225 10925
F 0 "U9" H 8300 10900 50  0000 C CNN
F 1 "27C256" H 8300 10800 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8225 10925 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0014.pdf" H 8225 10925 50  0001 C CNN
	1    8225 10925
	1    0    0    -1  
$EndComp
Connection ~ 8225 12025
Wire Wire Line
	7825 11825 7825 12025
Wire Wire Line
	7825 11725 7825 11825
Connection ~ 7825 11825
Text GLabel 7825 11625 0    50   Input ~ 0
STATE5
$Comp
L Device:C_Small C16
U 1 1 68DE7BC5
P 9475 11225
F 0 "C16" H 9567 11271 50  0000 L CNN
F 1 "100n" H 9567 11180 50  0000 L CNN
F 2 "" H 9475 11225 50  0001 C CNN
F 3 "~" H 9475 11225 50  0001 C CNN
	1    9475 11225
	1    0    0    1   
$EndComp
Text GLabel 9400 11075 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR032
U 1 1 68DE7BCC
P 9475 11325
F 0 "#PWR032" H 9475 11075 50  0001 C CNN
F 1 "GND" H 9480 11152 50  0000 C CNN
F 2 "" H 9475 11325 50  0001 C CNN
F 3 "" H 9475 11325 50  0001 C CNN
	1    9475 11325
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 68DE7BD2
P 9900 9475
F 0 "#PWR034" H 9900 9225 50  0001 C CNN
F 1 "GND" H 9905 9302 50  0000 C CNN
F 2 "" H 9900 9475 50  0001 C CNN
F 3 "" H 9900 9475 50  0001 C CNN
	1    9900 9475
	-1   0    0    -1  
$EndComp
Text GLabel 9975 10725 2    50   Output ~ 0
FSEL0
Text GLabel 9975 10425 2    50   Output ~ 0
C\#NC
Text GLabel 9975 10325 2    50   Output ~ 0
ALU_OP0
Text GLabel 9975 10225 2    50   Output ~ 0
ALU_OP1
Text GLabel 9975 10125 2    50   Output ~ 0
ALU_OP2
Text GLabel 9975 10025 2    50   Output ~ 0
F_SRC
$Comp
L 74xx:74HCT574 U12
U 1 1 68DE7BE0
P 9475 10225
F 0 "U12" H 9475 10025 50  0000 C CNN
F 1 "74HCT574" H 9475 9925 50  0000 C CNN
F 2 "" H 9475 10225 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 9475 10225 50  0001 C CNN
	1    9475 10225
	1    0    0    1   
$EndComp
Wire Wire Line
	8975 9725 8975 9425
Wire Wire Line
	8975 9425 9475 9425
Connection ~ 9475 9425
Text GLabel 8975 9825 0    50   Input ~ 0
CLK
Wire Wire Line
	9400 11075 9475 11075
Wire Wire Line
	9475 11075 9475 11025
Wire Wire Line
	9475 11125 9475 11075
Connection ~ 9475 11075
Wire Wire Line
	9475 9425 9900 9425
Wire Wire Line
	9900 9425 9900 9475
Wire Wire Line
	8625 10725 8975 10725
Wire Wire Line
	8975 10625 8625 10625
Wire Wire Line
	8625 10525 8975 10525
Wire Wire Line
	8975 10425 8625 10425
Wire Wire Line
	8625 10325 8975 10325
Wire Wire Line
	8625 10225 8800 10225
Wire Wire Line
	8800 10225 8800 10025
Wire Wire Line
	8800 10025 8975 10025
Wire Wire Line
	8625 10125 8975 10125
Wire Wire Line
	8625 10025 8725 10025
Wire Wire Line
	8725 10025 8725 10175
Wire Wire Line
	8725 10175 8975 10175
Wire Wire Line
	8975 10175 8975 10225
Text Notes 9175 11825 0    118  ~ 24
EPROM D
Text Notes 8750 12000 0    79   ~ 16
Opcodes & Flags Controller
Text GLabel 9975 10625 2    50   Output ~ 0
FSEL1
Text GLabel 9975 10525 2    50   Output ~ 0
FSEL2
Text GLabel 18275 3550 0    50   Input ~ 0
F_SRC
Text GLabel 18275 4550 0    50   Input ~ 0
ALU_OP2
Text GLabel 18275 4650 0    50   Input ~ 0
ALU_OP1
Text GLabel 18275 4750 0    50   Input ~ 0
ALU_OP0
Text GLabel 18275 4850 0    50   Input ~ 0
C\#NC
Text GLabel 18275 5350 0    50   Input ~ 0
FSEL0
Text GLabel 18275 5250 0    50   Input ~ 0
FSEL1
Text GLabel 18275 5150 0    50   Input ~ 0
FSEL2
Text GLabel 10550 10025 2    50   Output ~ 0
BUS7
Text GLabel 10550 10125 2    50   Output ~ 0
BUS6
Text GLabel 10550 10225 2    50   Output ~ 0
BUS5
Text GLabel 10550 10325 2    50   Output ~ 0
BUS4
Text GLabel 10550 10425 2    50   Output ~ 0
BUS3
Text GLabel 10550 10525 2    50   Output ~ 0
BUS2
Text GLabel 10550 10625 2    50   Output ~ 0
BUS1
Text GLabel 10550 10725 2    50   Output ~ 0
BUS0
Wire Wire Line
	9975 10025 10550 10025
Wire Wire Line
	9975 10125 10550 10125
Wire Wire Line
	9975 10225 10550 10225
Wire Wire Line
	9975 10325 10550 10325
Wire Wire Line
	9975 10425 10550 10425
Wire Wire Line
	9975 10525 10550 10525
Wire Wire Line
	9975 10625 10550 10625
Wire Wire Line
	9975 10725 10550 10725
Text GLabel 13150 4100 0    50   Input ~ 0
BUS0
Text GLabel 13150 4200 0    50   Input ~ 0
BUS1
Text GLabel 13150 4300 0    50   Input ~ 0
BUS2
Text GLabel 13150 4400 0    50   Input ~ 0
BUS3
Text GLabel 13150 4500 0    50   Input ~ 0
BUS4
Text GLabel 13150 4600 0    50   Input ~ 0
BUS5
Text GLabel 13150 4700 0    50   Input ~ 0
BUS6
Text GLabel 13150 4800 0    50   Input ~ 0
BUS7
Text GLabel 14150 4800 2    50   Output ~ 0
D7
Text GLabel 14150 4700 2    50   Output ~ 0
D6
Text GLabel 14150 4600 2    50   Output ~ 0
D5
Text GLabel 14150 4500 2    50   Output ~ 0
D4
Text GLabel 14150 4400 2    50   Output ~ 0
D3
Text GLabel 14150 4300 2    50   Output ~ 0
D2
Text GLabel 14150 4200 2    50   Output ~ 0
D1
Text GLabel 14150 4100 2    50   Output ~ 0
D0
$Comp
L power:GND #PWR041
U 1 1 68C828CD
P 13650 5400
F 0 "#PWR041" H 13650 5150 50  0001 C CNN
F 1 "GND" H 13655 5227 50  0000 C CNN
F 2 "" H 13650 5400 50  0001 C CNN
F 3 "" H 13650 5400 50  0001 C CNN
	1    13650 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 3475 13825 3475
Connection ~ 13650 3475
Wire Wire Line
	13550 3475 13650 3475
Wire Wire Line
	13650 3800 13650 3475
Wire Wire Line
	13825 3475 13825 3550
$Comp
L power:GND #PWR043
U 1 1 68C71609
P 13825 3750
F 0 "#PWR043" H 13825 3500 50  0001 C CNN
F 1 "GND" H 13830 3577 50  0000 C CNN
F 2 "" H 13825 3750 50  0001 C CNN
F 3 "" H 13825 3750 50  0001 C CNN
	1    13825 3750
	1    0    0    -1  
$EndComp
Text GLabel 13550 3475 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C21
U 1 1 68C71602
P 13825 3650
F 0 "C21" H 13917 3696 50  0000 L CNN
F 1 "100n" H 13917 3605 50  0000 L CNN
F 2 "" H 13825 3650 50  0001 C CNN
F 3 "~" H 13825 3650 50  0001 C CNN
	1    13825 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 5050 13150 5100
Connection ~ 13150 5050
Wire Wire Line
	13100 5050 13150 5050
Text GLabel 13100 5050 0    50   Input ~ 0
#DRIVE_BUS
Wire Wire Line
	13150 5000 13150 5050
$Comp
L 74xx:74HCT541 U16
U 1 1 68C625AE
P 13650 4600
F 0 "U16" H 13650 4400 50  0000 C CNN
F 1 "74HCT541" H 13650 4300 50  0000 C CNN
F 2 "" H 13650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 13650 4600 50  0001 C CNN
	1    13650 4600
	1    0    0    -1  
$EndComp
Text Notes 8600 8900 0    79   ~ 16
Address Bus Controller
Text Notes 8875 8725 0    118  ~ 24
EPROM B
Wire Wire Line
	8975 7000 8975 7050
Wire Wire Line
	8725 7000 8975 7000
Wire Wire Line
	8725 6850 8725 7000
Wire Wire Line
	8625 6850 8725 6850
Wire Wire Line
	8625 6950 8975 6950
Wire Wire Line
	8800 6850 8975 6850
Wire Wire Line
	8800 7050 8800 6850
Wire Wire Line
	8625 7050 8800 7050
Wire Wire Line
	8625 7150 8975 7150
Wire Wire Line
	8975 7250 8625 7250
Wire Wire Line
	8625 7350 8975 7350
Wire Wire Line
	8975 7450 8625 7450
Wire Wire Line
	8625 7550 8975 7550
Wire Wire Line
	9900 6250 9900 6300
Wire Wire Line
	9475 6250 9900 6250
Connection ~ 9475 7900
Wire Wire Line
	9475 7950 9475 7900
Wire Wire Line
	9475 7900 9475 7850
Wire Wire Line
	9400 7900 9475 7900
Text GLabel 8975 6650 0    50   Input ~ 0
CLK
Connection ~ 9475 6250
Wire Wire Line
	8975 6250 9475 6250
Wire Wire Line
	8975 6550 8975 6250
$Comp
L 74xx:74HCT574 U11
U 1 1 68CD2DA7
P 9475 7050
F 0 "U11" H 9475 6850 50  0000 C CNN
F 1 "74HCT574" H 9475 6750 50  0000 C CNN
F 2 "" H 9475 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT574" H 9475 7050 50  0001 C CNN
	1    9475 7050
	1    0    0    1   
$EndComp
Text GLabel 9975 6850 2    50   Output ~ 0
DATA_RD0
Text GLabel 9975 6950 2    50   Output ~ 0
#INTA
Text GLabel 11700 6875 2    50   Output ~ 0
ADDR_OP1
Text GLabel 11700 7700 2    50   Output ~ 0
ADDR_OP0
Text GLabel 9975 7250 2    50   Output ~ 0
ADDR_WR1
Text GLabel 9975 7350 2    50   Output ~ 0
ADDR_WR0
Text GLabel 9975 7450 2    50   Output ~ 0
ADDR_RD1
Text GLabel 9975 7550 2    50   Output ~ 0
ADDR_RD0
$Comp
L power:GND #PWR033
U 1 1 68CC9C0A
P 9900 6300
F 0 "#PWR033" H 9900 6050 50  0001 C CNN
F 1 "GND" H 9905 6127 50  0000 C CNN
F 2 "" H 9900 6300 50  0001 C CNN
F 3 "" H 9900 6300 50  0001 C CNN
	1    9900 6300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 68CC9BFF
P 9475 8150
F 0 "#PWR031" H 9475 7900 50  0001 C CNN
F 1 "GND" H 9480 7977 50  0000 C CNN
F 2 "" H 9475 8150 50  0001 C CNN
F 3 "" H 9475 8150 50  0001 C CNN
	1    9475 8150
	-1   0    0    -1  
$EndComp
Text GLabel 9400 7900 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C15
U 1 1 68CC9BF8
P 9475 8050
F 0 "C15" H 9567 8096 50  0000 L CNN
F 1 "100n" H 9567 8005 50  0000 L CNN
F 2 "" H 9475 8050 50  0001 C CNN
F 3 "~" H 9475 8050 50  0001 C CNN
	1    9475 8050
	1    0    0    1   
$EndComp
Text GLabel 7825 8450 0    50   Input ~ 0
STATE5
Connection ~ 7825 8650
Wire Wire Line
	7825 8550 7825 8650
Wire Wire Line
	7825 8650 7825 8850
Connection ~ 8225 8850
$Comp
L Memory_EPROM:27C256 U8
U 1 1 68CB5AB7
P 8225 7750
F 0 "U8" H 8300 7725 50  0000 C CNN
F 1 "27C256" H 8300 7625 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8225 7750 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0014.pdf" H 8225 7750 50  0001 C CNN
	1    8225 7750
	1    0    0    -1  
$EndComp
Text GLabel 7825 7850 0    50   Input ~ 0
IR7
Text GLabel 7825 7950 0    50   Input ~ 0
IR6
Text GLabel 7825 7750 0    50   Input ~ 0
IR5
Text GLabel 7825 7650 0    50   Input ~ 0
IR4
Text GLabel 7825 7550 0    50   Input ~ 0
IR3
Text GLabel 7825 8150 0    50   Input ~ 0
IR2
Text GLabel 7825 8050 0    50   Input ~ 0
IR1
Text GLabel 7825 8250 0    50   Input ~ 0
IR0
Text GLabel 7825 7350 0    50   Input ~ 0
INT_SYNC
Text GLabel 7825 7450 0    50   Input ~ 0
FLAG
Text GLabel 7825 7250 0    50   Input ~ 0
STATE4
Text GLabel 7825 7150 0    50   Input ~ 0
STATE3
Text GLabel 7825 7050 0    50   Input ~ 0
STATE2
Text GLabel 7825 6950 0    50   Input ~ 0
STATE1
Text GLabel 7825 6850 0    50   Input ~ 0
STATE0
Wire Wire Line
	7825 8850 8225 8850
$Comp
L power:GND #PWR025
U 1 1 68CB5AA1
P 8225 8850
F 0 "#PWR025" H 8225 8600 50  0001 C CNN
F 1 "GND" H 8230 8677 50  0000 C CNN
F 2 "" H 8225 8850 50  0001 C CNN
F 3 "" H 8225 8850 50  0001 C CNN
	1    8225 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8225 6200 8225 6650
Wire Wire Line
	8225 6200 8400 6200
Connection ~ 8225 6200
Wire Wire Line
	8125 6200 8225 6200
Wire Wire Line
	8400 6200 8400 6275
$Comp
L power:GND #PWR027
U 1 1 68CB5A96
P 8400 6475
F 0 "#PWR027" H 8400 6225 50  0001 C CNN
F 1 "GND" H 8405 6302 50  0000 C CNN
F 2 "" H 8400 6475 50  0001 C CNN
F 3 "" H 8400 6475 50  0001 C CNN
	1    8400 6475
	1    0    0    -1  
$EndComp
Text GLabel 8125 6200 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C12
U 1 1 68CB5A8F
P 8400 6375
F 0 "C12" H 8492 6421 50  0000 L CNN
F 1 "1u" H 8492 6330 50  0000 L CNN
F 2 "" H 8400 6375 50  0001 C CNN
F 3 "~" H 8400 6375 50  0001 C CNN
	1    8400 6375
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U17
U 1 1 68F62F59
P 14600 8950
F 0 "U17" H 14550 8975 50  0000 C CNN
F 1 "74HCT138" H 14525 8875 50  0000 C CNN
F 2 "" H 14600 8950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 14600 8950 50  0001 C CNN
	1    14600 8950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 68FA4E3A
P 14800 8200
F 0 "C22" H 14892 8246 50  0000 L CNN
F 1 "100n" H 14892 8155 50  0000 L CNN
F 2 "" H 14800 8200 50  0001 C CNN
F 3 "~" H 14800 8200 50  0001 C CNN
	1    14800 8200
	1    0    0    -1  
$EndComp
Text GLabel 14525 8025 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR047
U 1 1 68FA4E41
P 14800 8300
F 0 "#PWR047" H 14800 8050 50  0001 C CNN
F 1 "GND" H 14805 8127 50  0000 C CNN
F 2 "" H 14800 8300 50  0001 C CNN
F 3 "" H 14800 8300 50  0001 C CNN
	1    14800 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	14800 8025 14800 8100
Wire Wire Line
	14525 8025 14600 8025
Wire Wire Line
	14600 8350 14600 8025
Connection ~ 14600 8025
Wire Wire Line
	14600 8025 14800 8025
$Comp
L power:GND #PWR045
U 1 1 68FD54F0
P 14600 9650
F 0 "#PWR045" H 14600 9400 50  0001 C CNN
F 1 "GND" H 14605 9477 50  0000 C CNN
F 2 "" H 14600 9650 50  0001 C CNN
F 3 "" H 14600 9650 50  0001 C CNN
	1    14600 9650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U18
U 1 1 68FD9572
P 14600 10900
F 0 "U18" H 14550 10925 50  0000 C CNN
F 1 "74HCT138" H 14525 10825 50  0000 C CNN
F 2 "" H 14600 10900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 14600 10900 50  0001 C CNN
	1    14600 10900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C23
U 1 1 68FD9578
P 14800 10150
F 0 "C23" H 14892 10196 50  0000 L CNN
F 1 "100n" H 14892 10105 50  0000 L CNN
F 2 "" H 14800 10150 50  0001 C CNN
F 3 "~" H 14800 10150 50  0001 C CNN
	1    14800 10150
	1    0    0    -1  
$EndComp
Text GLabel 14525 9975 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR048
U 1 1 68FD957F
P 14800 10250
F 0 "#PWR048" H 14800 10000 50  0001 C CNN
F 1 "GND" H 14805 10077 50  0000 C CNN
F 2 "" H 14800 10250 50  0001 C CNN
F 3 "" H 14800 10250 50  0001 C CNN
	1    14800 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14800 9975 14800 10050
Wire Wire Line
	14525 9975 14600 9975
Wire Wire Line
	14600 10300 14600 9975
Connection ~ 14600 9975
Wire Wire Line
	14600 9975 14800 9975
$Comp
L power:GND #PWR046
U 1 1 68FD958A
P 14600 11600
F 0 "#PWR046" H 14600 11350 50  0001 C CNN
F 1 "GND" H 14605 11427 50  0000 C CNN
F 2 "" H 14600 11600 50  0001 C CNN
F 3 "" H 14600 11600 50  0001 C CNN
	1    14600 11600
	1    0    0    -1  
$EndComp
Text Notes 12300 3075 0    79   ~ 16
Instruction Register
Text Notes 12600 5375 0    79   ~ 16
Bus Driver
Wire Wire Line
	14100 11200 14100 11300
Wire Wire Line
	14100 11300 14100 11600
Wire Wire Line
	14100 11600 14600 11600
Connection ~ 14100 11300
Connection ~ 14600 11600
Wire Wire Line
	14100 9250 14100 9350
Text GLabel 14100 9150 0    50   Input ~ 10
5V
Wire Wire Line
	14100 11100 13675 11100
Wire Wire Line
	13675 11100 13675 10900
Wire Wire Line
	13675 9350 14100 9350
Connection ~ 14100 9350
Text GLabel 13575 10900 0    50   Input ~ 0
DATA_RD3
Wire Wire Line
	14100 10600 13900 10600
Wire Wire Line
	13900 10600 13900 8650
Wire Wire Line
	13900 8650 14100 8650
Wire Wire Line
	14100 10700 13825 10700
Wire Wire Line
	13825 10700 13825 8750
Wire Wire Line
	13825 8750 14100 8750
Wire Wire Line
	14100 10800 13750 10800
Wire Wire Line
	13750 10800 13750 8850
Wire Wire Line
	13750 8850 14100 8850
Text GLabel 13575 10800 0    50   Input ~ 0
DATA_RD2
Text GLabel 13575 10700 0    50   Input ~ 0
DATA_RD1
Text GLabel 13575 10600 0    50   Input ~ 0
DATA_RD0
Wire Wire Line
	13575 10600 13900 10600
Connection ~ 13900 10600
Wire Wire Line
	13575 10700 13825 10700
Connection ~ 13825 10700
Wire Wire Line
	13575 10800 13750 10800
Connection ~ 13750 10800
Wire Wire Line
	13575 10900 13675 10900
Connection ~ 13675 10900
Wire Wire Line
	13675 10900 13675 9350
$Comp
L 74xx:74LS138 U19
U 1 1 69152634
P 17475 8950
F 0 "U19" H 17425 8975 50  0000 C CNN
F 1 "74HCT238" H 17400 8875 50  0000 C CNN
F 2 "" H 17475 8950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 17475 8950 50  0001 C CNN
	1    17475 8950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 6915263A
P 17675 8200
F 0 "C24" H 17767 8246 50  0000 L CNN
F 1 "100n" H 17767 8155 50  0000 L CNN
F 2 "" H 17675 8200 50  0001 C CNN
F 3 "~" H 17675 8200 50  0001 C CNN
	1    17675 8200
	1    0    0    -1  
$EndComp
Text GLabel 17400 8025 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR054
U 1 1 69152641
P 17675 8300
F 0 "#PWR054" H 17675 8050 50  0001 C CNN
F 1 "GND" H 17680 8127 50  0000 C CNN
F 2 "" H 17675 8300 50  0001 C CNN
F 3 "" H 17675 8300 50  0001 C CNN
	1    17675 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	17675 8025 17675 8100
Wire Wire Line
	17400 8025 17475 8025
Wire Wire Line
	17475 8350 17475 8025
Connection ~ 17475 8025
Wire Wire Line
	17475 8025 17675 8025
$Comp
L power:GND #PWR052
U 1 1 6915264C
P 17475 9650
F 0 "#PWR052" H 17475 9400 50  0001 C CNN
F 1 "GND" H 17480 9477 50  0000 C CNN
F 2 "" H 17475 9650 50  0001 C CNN
F 3 "" H 17475 9650 50  0001 C CNN
	1    17475 9650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U20
U 1 1 69152652
P 17475 10900
F 0 "U20" H 17425 10925 50  0000 C CNN
F 1 "74HCT238" H 17400 10825 50  0000 C CNN
F 2 "" H 17475 10900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 17475 10900 50  0001 C CNN
	1    17475 10900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C25
U 1 1 69152658
P 17675 10150
F 0 "C25" H 17767 10196 50  0000 L CNN
F 1 "100n" H 17767 10105 50  0000 L CNN
F 2 "" H 17675 10150 50  0001 C CNN
F 3 "~" H 17675 10150 50  0001 C CNN
	1    17675 10150
	1    0    0    -1  
$EndComp
Text GLabel 17400 9975 0    50   Input ~ 10
5V
$Comp
L power:GND #PWR055
U 1 1 6915265F
P 17675 10250
F 0 "#PWR055" H 17675 10000 50  0001 C CNN
F 1 "GND" H 17680 10077 50  0000 C CNN
F 2 "" H 17675 10250 50  0001 C CNN
F 3 "" H 17675 10250 50  0001 C CNN
	1    17675 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	17675 9975 17675 10050
Wire Wire Line
	17400 9975 17475 9975
Wire Wire Line
	17475 10300 17475 9975
Connection ~ 17475 9975
Wire Wire Line
	17475 9975 17675 9975
$Comp
L power:GND #PWR053
U 1 1 6915266A
P 17475 11600
F 0 "#PWR053" H 17475 11350 50  0001 C CNN
F 1 "GND" H 17480 11427 50  0000 C CNN
F 2 "" H 17475 11600 50  0001 C CNN
F 3 "" H 17475 11600 50  0001 C CNN
	1    17475 11600
	1    0    0    -1  
$EndComp
Wire Wire Line
	16975 11200 16975 11250
Wire Wire Line
	16975 9250 16975 9300
Text GLabel 16975 9150 0    50   Input ~ 10
5V
Text GLabel 16450 10900 0    50   Input ~ 0
DATA_WR3
Wire Wire Line
	16975 10600 16775 10600
Wire Wire Line
	16775 10600 16775 8650
Wire Wire Line
	16775 8650 16975 8650
Wire Wire Line
	16975 10700 16700 10700
Wire Wire Line
	16700 10700 16700 8750
Wire Wire Line
	16700 8750 16975 8750
Wire Wire Line
	16975 10800 16625 10800
Wire Wire Line
	16625 10800 16625 8850
Wire Wire Line
	16625 8850 16975 8850
Text GLabel 16450 10800 0    50   Input ~ 0
DATA_WR2
Text GLabel 16450 10700 0    50   Input ~ 0
DATA_WR1
Text GLabel 16450 10600 0    50   Input ~ 0
DATA_WR0
Wire Wire Line
	16450 10600 16775 10600
Connection ~ 16775 10600
Wire Wire Line
	16450 10700 16700 10700
Connection ~ 16700 10700
Wire Wire Line
	16450 10800 16625 10800
Connection ~ 16625 10800
NoConn ~ 15100 8650
NoConn ~ 15100 11300
NoConn ~ 15100 11200
Text GLabel 15100 8750 2    50   Output ~ 0
#RD_A
Text GLabel 15100 8850 2    50   Output ~ 0
#RD_B
Text GLabel 15100 8950 2    50   Output ~ 0
#RD_C
Text GLabel 15100 9050 2    50   Output ~ 0
#RD_D
Text GLabel 15100 9150 2    50   Output ~ 0
#RD_F
Text GLabel 18275 4050 0    50   Input ~ 0
#RD_A
Text GLabel 18275 4150 0    50   Input ~ 0
#RD_B
Text GLabel 18275 4250 0    50   Input ~ 0
#RD_C
Text GLabel 18275 4350 0    50   Input ~ 0
#RD_D
Text GLabel 18275 4450 0    50   Input ~ 0
#RD_F
Text GLabel 15100 9350 2    50   Output ~ 0
#RD_ALU_L
Text GLabel 15100 10600 2    50   Output ~ 0
#RD_ALU_H
Text GLabel 15100 9250 2    50   Output ~ 0
#RD_M
Text GLabel 16825 3650 0    50   Input ~ 0
#RD_M
Text GLabel 18275 5050 0    50   Input ~ 0
#RD_ALU_L
Text GLabel 18275 4950 0    50   Input ~ 0
#RD_ALU_H
Text GLabel 15100 10700 2    50   Output ~ 0
#RD_ADDR_L
Text GLabel 15100 10800 2    50   Output ~ 0
#RD_ADDR_H
Text GLabel 16825 3450 0    50   Input ~ 0
#RD_ADDR_L
Text GLabel 16825 3350 0    50   Input ~ 0
#RD_ADDR_H
NoConn ~ 15100 11000
Text GLabel 15100 10900 2    50   Output ~ 0
IE_DATA
Text GLabel 15100 11100 2    50   Output ~ 0
#DRIVE_BUS
Text GLabel 16450 11000 0    50   Input ~ 0
#DATA_WR3
Text GLabel 16975 11100 0    50   Input ~ 10
5V
Wire Wire Line
	16450 11000 16550 11000
Wire Wire Line
	16550 11000 16550 11250
Wire Wire Line
	16550 11250 16975 11250
Connection ~ 16975 11250
Wire Wire Line
	16975 11250 16975 11300
Wire Wire Line
	16450 10900 16550 10900
Wire Wire Line
	16550 10900 16550 9300
Wire Wire Line
	16550 9300 16975 9300
Connection ~ 16975 9300
Wire Wire Line
	16975 9300 16975 9350
NoConn ~ 17975 8650
Text GLabel 17975 8750 2    50   Output ~ 0
WR_A
Text GLabel 17975 8850 2    50   Output ~ 0
WR_B
Text GLabel 17975 8950 2    50   Output ~ 0
WR_C
Text GLabel 17975 9050 2    50   Output ~ 0
WR_D
Text GLabel 17975 9150 2    50   Output ~ 0
WR_F
Text GLabel 18275 3150 0    50   Input ~ 0
WR_A
Text GLabel 18275 3250 0    50   Input ~ 0
WR_B
Text GLabel 18275 3350 0    50   Input ~ 0
WR_C
Text GLabel 18275 3450 0    50   Input ~ 0
WR_D
Text GLabel 18275 3650 0    50   Input ~ 0
WR_F
$Comp
L Device:D_Schottky_Small D5
U 1 1 692BCE60
P 18575 8925
F 0 "D5" H 18575 9132 50  0000 C CNN
F 1 "BAT54" H 18575 9041 50  0000 C CNN
F 2 "" V 18575 8925 50  0001 C CNN
F 3 "~" V 18575 8925 50  0001 C CNN
	1    18575 8925
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R16
U 1 1 692BD77D
P 18575 9250
F 0 "R16" V 18379 9250 50  0000 C CNN
F 1 "1.5k" V 18470 9250 50  0000 C CNN
F 2 "" H 18575 9250 50  0001 C CNN
F 3 "~" H 18575 9250 50  0001 C CNN
	1    18575 9250
	0    1    1    0   
$EndComp
Wire Wire Line
	18475 8925 18400 8925
Wire Wire Line
	18400 8925 18400 9250
Wire Wire Line
	18400 9250 18475 9250
Wire Wire Line
	18675 8925 18750 8925
Wire Wire Line
	18750 9250 18675 9250
Wire Wire Line
	17975 9250 18400 9250
Connection ~ 18400 9250
$Comp
L Device:C_Small C26
U 1 1 69302822
P 18750 9425
F 0 "C26" H 18842 9471 50  0000 L CNN
F 1 "22p" H 18842 9380 50  0000 L CNN
F 2 "" H 18750 9425 50  0001 C CNN
F 3 "~" H 18750 9425 50  0001 C CNN
	1    18750 9425
	1    0    0    -1  
$EndComp
Wire Wire Line
	18750 8925 18750 9250
Connection ~ 18750 9250
Wire Wire Line
	18750 9250 18750 9325
$Comp
L power:GND #PWR059
U 1 1 6931A1F7
P 18750 9525
F 0 "#PWR059" H 18750 9275 50  0001 C CNN
F 1 "GND" H 18755 9352 50  0000 C CNN
F 2 "" H 18750 9525 50  0001 C CNN
F 3 "" H 18750 9525 50  0001 C CNN
	1    18750 9525
	1    0    0    -1  
$EndComp
Wire Wire Line
	18750 9250 18975 9250
Text GLabel 19575 9250 2    50   Output ~ 0
#WR_M
Text GLabel 16825 3550 0    50   Input ~ 0
#WR_M
Text Notes 19100 9550 0    59   ~ 0
Timing Fix
Text GLabel 17975 9350 2    50   Output ~ 0
WR_ADDR_L
Text GLabel 17975 10600 2    50   Output ~ 0
WR_ADDR_H
Text GLabel 16825 3250 0    50   Input ~ 0
WR_ADDR_L
Text GLabel 16825 3150 0    50   Input ~ 0
WR_ADDR_H
Text GLabel 17975 10700 2    50   Output ~ 0
ST_A
Text GLabel 17975 10800 2    50   Output ~ 0
ST_B
Text GLabel 17975 10900 2    50   Output ~ 0
ST_F
Text GLabel 17975 11000 2    50   Output ~ 0
ST_ADDR
Text GLabel 18275 3750 0    50   Input ~ 0
ST_A
Text GLabel 18275 3850 0    50   Input ~ 0
ST_B
Text GLabel 18275 3950 0    50   Input ~ 0
ST_F
Text GLabel 16825 4950 0    50   Input ~ 0
ST_ADDR
Text GLabel 17975 11100 2    50   Output ~ 0
INT_SAMPLE
Text GLabel 17975 11200 2    50   Output ~ 0
IE_LATCH
Text GLabel 17975 11300 2    50   Output ~ 0
LATCH_IR
$Comp
L 74xGxx:74AHC1G125 U13
U 1 1 69371E05
P 11450 6875
F 0 "U13" H 11750 7000 50  0000 C CNN
F 1 "74AHC1G125" H 11775 7100 50  0000 C CNN
F 2 "" H 11450 6875 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 11450 6875 50  0001 C CNN
	1    11450 6875
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 69374738
P 10900 6875
F 0 "R13" V 10704 6875 50  0000 C CNN
F 1 "1k" V 10795 6875 50  0000 C CNN
F 2 "" H 10900 6875 50  0001 C CNN
F 3 "~" H 10900 6875 50  0001 C CNN
	1    10900 6875
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C17
U 1 1 693753F8
P 11075 7075
F 0 "C17" H 10983 7029 50  0000 R CNN
F 1 "47p" H 10983 7120 50  0000 R CNN
F 2 "" H 11075 7075 50  0001 C CNN
F 3 "~" H 11075 7075 50  0001 C CNN
	1    11075 7075
	1    0    0    1   
$EndComp
Wire Wire Line
	11000 6875 11075 6875
Wire Wire Line
	11075 6975 11075 6875
Connection ~ 11075 6875
Wire Wire Line
	11075 6875 11150 6875
Wire Wire Line
	11450 7075 11500 7075
Wire Wire Line
	11500 7075 11500 6925
$Comp
L power:GND #PWR035
U 1 1 693FF0B6
P 11075 7175
F 0 "#PWR035" H 11075 6925 50  0001 C CNN
F 1 "GND" H 11080 7002 50  0000 C CNN
F 2 "" H 11075 7175 50  0001 C CNN
F 3 "" H 11075 7175 50  0001 C CNN
	1    11075 7175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR037
U 1 1 693FF538
P 11450 7075
F 0 "#PWR037" H 11450 6825 50  0001 C CNN
F 1 "GND" H 11455 6902 50  0000 C CNN
F 2 "" H 11450 7075 50  0001 C CNN
F 3 "" H 11450 7075 50  0001 C CNN
	1    11450 7075
	1    0    0    -1  
$EndComp
Connection ~ 11450 7075
$Comp
L 74xGxx:74AHC1G125 U14
U 1 1 69400FDA
P 11450 7700
F 0 "U14" H 11750 7825 50  0000 C CNN
F 1 "74AHC1G125" H 11775 7925 50  0000 C CNN
F 2 "" H 11450 7700 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 11450 7700 50  0001 C CNN
	1    11450 7700
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 69400FE0
P 10900 7700
F 0 "R14" V 10704 7700 50  0000 C CNN
F 1 "1k" V 10795 7700 50  0000 C CNN
F 2 "" H 10900 7700 50  0001 C CNN
F 3 "~" H 10900 7700 50  0001 C CNN
	1    10900 7700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 69400FE6
P 11075 7900
F 0 "C18" H 10983 7854 50  0000 R CNN
F 1 "47p" H 10983 7945 50  0000 R CNN
F 2 "" H 11075 7900 50  0001 C CNN
F 3 "~" H 11075 7900 50  0001 C CNN
	1    11075 7900
	1    0    0    1   
$EndComp
Wire Wire Line
	11000 7700 11075 7700
Wire Wire Line
	11075 7800 11075 7700
Connection ~ 11075 7700
Wire Wire Line
	11075 7700 11150 7700
Wire Wire Line
	11450 7900 11500 7900
Wire Wire Line
	11500 7900 11500 7750
$Comp
L power:GND #PWR036
U 1 1 69400FF2
P 11075 8000
F 0 "#PWR036" H 11075 7750 50  0001 C CNN
F 1 "GND" H 11080 7827 50  0000 C CNN
F 2 "" H 11075 8000 50  0001 C CNN
F 3 "" H 11075 8000 50  0001 C CNN
	1    11075 8000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 69400FF8
P 11450 7900
F 0 "#PWR038" H 11450 7650 50  0001 C CNN
F 1 "GND" H 11455 7727 50  0000 C CNN
F 2 "" H 11450 7900 50  0001 C CNN
F 3 "" H 11450 7900 50  0001 C CNN
	1    11450 7900
	1    0    0    -1  
$EndComp
Connection ~ 11450 7900
Text Notes 11675 7300 0    59   ~ 0
Timing Fix
Wire Wire Line
	11500 6200 11675 6200
Connection ~ 11500 6200
Wire Wire Line
	11400 6200 11500 6200
Wire Wire Line
	11675 6200 11675 6275
$Comp
L power:GND #PWR039
U 1 1 694349AF
P 11675 6475
F 0 "#PWR039" H 11675 6225 50  0001 C CNN
F 1 "GND" H 11680 6302 50  0000 C CNN
F 2 "" H 11675 6475 50  0001 C CNN
F 3 "" H 11675 6475 50  0001 C CNN
	1    11675 6475
	1    0    0    -1  
$EndComp
Text GLabel 11400 6200 0    50   Input ~ 10
5V
$Comp
L Device:C_Small C19
U 1 1 694349B6
P 11675 6375
F 0 "C19" H 11767 6421 50  0000 L CNN
F 1 "100n" H 11767 6330 50  0000 L CNN
F 2 "" H 11675 6375 50  0001 C CNN
F 3 "~" H 11675 6375 50  0001 C CNN
	1    11675 6375
	1    0    0    -1  
$EndComp
Wire Wire Line
	11500 6200 11500 6725
Wire Wire Line
	11500 7650 11500 7400
Wire Wire Line
	11500 7400 12250 7400
Wire Wire Line
	12250 7400 12250 6725
Wire Wire Line
	12250 6725 11500 6725
Connection ~ 11500 6725
Wire Wire Line
	11500 6725 11500 6825
Wire Wire Line
	9975 7050 10575 7050
Wire Wire Line
	10575 7050 10575 6875
Wire Wire Line
	10575 6875 10800 6875
Wire Wire Line
	9975 7150 10575 7150
Wire Wire Line
	10575 7150 10575 7700
Wire Wire Line
	10575 7700 10800 7700
$Comp
L 74xx:74LS139 U10
U 1 1 6950E976
P 14600 7325
F 0 "U10" H 14600 7692 50  0000 C CNN
F 1 "74HCT139" H 14600 7601 50  0000 C CNN
F 2 "" H 14600 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 14600 7325 50  0001 C CNN
	1    14600 7325
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U10
U 2 1 6950F1BA
P 17475 7325
F 0 "U10" H 17475 7692 50  0000 C CNN
F 1 "74HCT139" H 17475 7601 50  0000 C CNN
F 2 "" H 17475 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 17475 7325 50  0001 C CNN
	2    17475 7325
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U10
U 3 1 695106D7
P 8900 1650
F 0 "U10" H 9130 1696 50  0000 L CNN
F 1 "74HCT139" H 9130 1605 50  0000 L CNN
F 2 "" H 8900 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 8900 1650 50  0001 C CNN
	3    8900 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 69513631
P 9075 1000
F 0 "C14" H 9167 1046 50  0000 L CNN
F 1 "100n" H 9167 955 50  0000 L CNN
F 2 "" H 9075 1000 50  0001 C CNN
F 3 "~" H 9075 1000 50  0001 C CNN
	1    9075 1000
	1    0    0    -1  
$EndComp
Text GLabel 8800 825  0    50   Input ~ 10
5V
$Comp
L power:GND #PWR030
U 1 1 69513638
P 9075 1100
F 0 "#PWR030" H 9075 850 50  0001 C CNN
F 1 "GND" H 9080 927 50  0000 C CNN
F 2 "" H 9075 1100 50  0001 C CNN
F 3 "" H 9075 1100 50  0001 C CNN
	1    9075 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9075 825  9075 900 
Wire Wire Line
	8800 825  8900 825 
Wire Wire Line
	8900 1150 8900 825 
Connection ~ 8900 825 
Wire Wire Line
	8900 825  9075 825 
$Comp
L power:GND #PWR029
U 1 1 695665C6
P 8900 2150
F 0 "#PWR029" H 8900 1900 50  0001 C CNN
F 1 "GND" H 8905 1977 50  0000 C CNN
F 2 "" H 8900 2150 50  0001 C CNN
F 3 "" H 8900 2150 50  0001 C CNN
	1    8900 2150
	1    0    0    -1  
$EndComp
Text GLabel 16975 7325 0    50   Input ~ 0
ADDR_WR0
Text GLabel 16975 7225 0    50   Input ~ 0
ADDR_WR1
Text GLabel 14100 7225 0    50   Input ~ 0
ADDR_RD1
Text GLabel 14100 7325 0    50   Input ~ 0
ADDR_RD0
$Comp
L power:GND #PWR044
U 1 1 695C2E9E
P 14100 7525
F 0 "#PWR044" H 14100 7275 50  0001 C CNN
F 1 "GND" H 14105 7352 50  0000 C CNN
F 2 "" H 14100 7525 50  0001 C CNN
F 3 "" H 14100 7525 50  0001 C CNN
	1    14100 7525
	1    0    0    -1  
$EndComp
Text GLabel 15100 7225 2    50   Output ~ 0
#OUT_DIR
Text GLabel 15100 7325 2    50   Output ~ 0
#OUT_PC
Text GLabel 15100 7425 2    50   Output ~ 0
#OUT_SP
Text GLabel 15100 7525 2    50   Output ~ 0
#OUT_DP
Text GLabel 16825 4850 0    50   Input ~ 0
#OUT_DIR
Text GLabel 16825 4750 0    50   Input ~ 0
#OUT_DP
Text GLabel 16825 4650 0    50   Input ~ 0
#OUT_SP
Text GLabel 16825 4550 0    50   Input ~ 0
#OUT_PC
NoConn ~ 17975 7225
Wire Wire Line
	17975 7325 18225 7325
Wire Wire Line
	17975 7425 18150 7425
Wire Wire Line
	18150 7425 18150 7850
Wire Wire Line
	18150 7850 18225 7850
Wire Wire Line
	17975 7525 18075 7525
Wire Wire Line
	18075 7525 18075 8375
Wire Wire Line
	18075 8375 18225 8375
Text GLabel 18825 7325 2    50   Output ~ 0
WR_PC
Text GLabel 18825 7850 2    50   Output ~ 0
WR_SP
Text GLabel 18825 8375 2    50   Output ~ 0
WR_DP
Text GLabel 16825 4250 0    50   Input ~ 0
WR_PC
Text GLabel 16825 4350 0    50   Input ~ 0
WR_SP
Text GLabel 16825 4450 0    50   Input ~ 0
WR_DP
Text Notes 14600 12225 0    118  ~ 24
Source & Destination Selectors
Text Notes 2625 3050 0    118  ~ 24
Overvoltage Protection
Text Notes 900  5500 0    79   ~ 16
Reset Button & POR
$EndSCHEMATC
