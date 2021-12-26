100 REM ************************************************************
110 REM FILENAME     FILEMOD.BAS
120 REM WRITTEN BY   GARY PEEK
130 REM LAST UPDATE  change below!
140 REM DESCRIPTION  VARIOUS ROUTINES TO CHANGE FILES
150 REM
160 REM NOTE:  USES FULL KEY AND MODIFIED 10000 SUBROUTINE FROM
170 REM        ROUTINES.BAS, OTHERS FROM ROUTSMAL.BAS
180 REM ************************************************************
190 KEY OFF:FOR A=1 TO 10:KEY A,"":NEXT A
200 DIM ITEM$(10)
210 REM ----- FIRST MENU
250 GOSUB 9000
260 MSG$="File Modification Utilities   version 5/4/98"
261 ROW=5:GOSUB 9500
262 MSG$="This is a group of utilities that can be used to manually `fix' "
263 ROW=8:GOSUB 9500
264 MSG$="files that are in a different format, or have extra or missing  "
265 ROW=9:GOSUB 9500
266 MSG$="characters caused by differences in computers or other programs."
267 ROW=10:GOSUB 9500
280 REM -----
290 ROW=23:MSG$=CHR$(24)+" and "+CHR$(25)+" to Move, ENTER to Select, ESCAPE to Exit":GOSUB 9500
300 MSG$="Select Function:"
310 ITEM$(1)="1. Character and Text String Utilities"
320 ITEM$(2)="2. Binary File Editor"
330 ITEM$(3)="3. Display ASCII character set"
340 ROW=13:COL=20:GOSUB 30000
350 REM -----
400 IF EXIT$="ESC" THEN CLS:END
410 IF ITEM=1 THEN GOSUB 500:GOTO 440
420 IF ITEM=2 THEN GOSUB 5000:GOTO 440
430 IF ITEM=3 THEN GOSUB 3500:GOTO 440
440 GOTO 250
490 REM ----- SECOND MENU
500 GOSUB 9000
505 ROW=23:MSG$=CHR$(24)+" and "+CHR$(25)+" to Move, ENTER to Select, ESCAPE to Exit":GOSUB 9500
510 MSG$="Character and Text String Utilities"
520 ROW=5:GOSUB 9500
530 REM -----
550 MSG$="Select Utility:"
560 ITEM$(1)="1. Remove all occurances of a selected character"
565 ITEM$(2)="2. Remove the second of 2 duplicate characters"
570 ITEM$(3)="3. Add a character before or after another specified character"
580 ITEM$(4)="4. Find and replace a character"
590 ITEM$(5)="5. Find and replace a text string"
600 ITEM$(6)="6. Expand tabs into spaces"
610 ITEM$(7)="7. Compress spaces into tabs"
620 ITEM$(8)="8. Convert non-displayable characters to values"
630 ITEM$(9)="9. Strip bit 7 from all characters"
640 ROW=8:COL=8:GOSUB 30000
650 REM -----
670 IF EXIT$="ESC" THEN RETURN
680 IF ITEM=1 THEN GOSUB 900:GOTO 800
685 IF ITEM=2 THEN GOSUB 1000:GOTO 800
690 IF ITEM=3 THEN GOSUB 1200:GOTO 800
700 IF ITEM=4 THEN GOSUB 1500:GOTO 800
710 IF ITEM=5 THEN GOSUB 1700:GOTO 800
720 IF ITEM=6 THEN GOSUB 2000:GOTO 800
730 IF ITEM=7 THEN GOSUB 2200:GOTO 800 
740 IF ITEM=8 THEN GOSUB 2500:GOTO 800 
750 IF ITEM=9 THEN GOSUB 3000:GOTO 800 
800 GOTO 500
895 REM -------------------- REMOVE SELECTED CHAR ---------------------
900 GOSUB 4500:REM GET INPUT FILE
905 IF QUIT THEN QUIT=0:RETURN
910 GOSUB 4600:REM GET OUTPUT FILE
915 IF QUIT THEN QUIT=0:RETURN
920 CLS
925 PRINT "Decimal value of character to remove (? for a list): ";
930 LINE INPUT CH$
931 IF CH$="?" THEN GOSUB 3500:GOTO 920
932 IF CH$="" THEN CLOSE:GOSUB 4800:RETURN
935 CH=VAL(CH$)
940 IF CH>255 THEN 920
945 PRINT:PRINT "Writing to new file-"
950 REM -----
955 IF EOF(1) THEN 991
960 A$=INPUT$(1,#1)
965 A=ASC(A$)
975 IF A=CH THEN COUNT=COUNT+1:GOTO 955
980 B$=CHR$(A)
985 IF B$=CHR$(10) THEN 987
986 PRINT B$;
987 PRINT #2,B$;
988 IF INKEY$=CHR$(27) THEN 993
989 GOTO 955
990 REM -----
991 GOSUB 4300
992 CLOSE
993 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
994 RETURN
995 REM -------------------- REMOVE EXTRA CHAR ---------------------
1000 GOSUB 4500:REM GET INPUT FILE
1005 IF QUIT THEN QUIT=0:RETURN
1010 GOSUB 4600:REM GET OUTPUT FILE
1015 IF QUIT THEN QUIT=0:RETURN
1020 CLS
1025 PRINT "Decimal value of character to remove (? for a list): ";
1030 LINE INPUT CH$
1031 IF CH$="?" THEN GOSUB 3500:GOTO 1020
1032 IF CH$="" THEN CLOSE:GOSUB 4800:RETURN
1035 CH=VAL(CH$)
1040 IF CH>255 THEN 1020
1045 CFLAG=0
1047 PRINT:PRINT "Writing to new file-"
1050 REM -----
1055 IF EOF(1) THEN 1115
1060 A$=INPUT$(1,#1)
1065 A=ASC(A$)
1070 IF A=CH AND NOT CFLAG THEN CFLAG=-1:GOTO 1080
1075 IF A=CH AND CFLAG THEN CFLAG=0:COUNT=COUNT+1:GOTO 1055
1080 B$=CHR$(A)
1085 IF B$=CHR$(10) THEN 1095
1090 PRINT B$;
1095 PRINT #2,B$;
1100 IF INKEY$=CHR$(27) THEN 1120
1105 GOTO 1055
1110 REM -----
1115 CFLAG=0
1120 GOSUB 4300
1125 CLOSE
1127 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
1130 RETURN
1195 REM ----------------------- ADD CHARACTER ----------------------
1200 GOSUB 4500:REM GET INPUT FILE
1205 IF QUIT THEN QUIT=0:RETURN
1210 GOSUB 4600:REM GET OUTPUT FILE
1215 IF QUIT THEN QUIT=0:RETURN
1220 CLS
1225 PRINT "Decimal value of character to find (? for a list): ";
1230 LINE INPUT FINDCH$
1231 IF FINDCH$="?" THEN GOSUB 3500:GOTO 1220
1235 IF FINDCH$="" THEN CLOSE:GOSUB 4800:RETURN
1240 FINDCH=VAL(FINDCH$)
1245 IF FINDCH>255 THEN 1200
1250 PRINT "Decimal value of new character to add (? for a list): ";
1255 LINE INPUT ADDCH$
1256 IF ADDCH$="?" THEN GOSUB 3500:CLS:GOTO 1250
1260 IF ADDCH$="" THEN CLOSE:GOSUB 4800:RETURN
1265 ADDCH=VAL(ADDCH$)
1270 IF ADDCH>255 THEN 1250
1275 PRINT "Add new character before or after the character found (B or A): ";
1280 LINE INPUT BA$
1285 IF BA$="" THEN CLOSE:GOSUB 4800:RETURN
1290 IF BA$<>"B" AND BA$<>"b" AND BA$<>"A" AND BA$<>"a" THEN 1275
1295 IF BA$="B" OR BA$="b" THEN BA=0
1300 IF BA$="A" OR BA$="a" THEN BA=1
1302 PRINT:PRINT "Writing to new file-"
1305 REM -----
1310 IF EOF(1) THEN 1380
1315 A$=INPUT$(1,#1)
1320 A=ASC(A$)
1325 IF A=FINDCH THEN 1350
1330 IF A$=CHR$(10) THEN 1340
1335 PRINT A$;
1340 PRINT #2,A$;
1345 GOTO 1365
1350 IF BA=0 THEN PRINT CHR$(ADDCH);A$;:PRINT #2,CHR$(ADDCH);A$;
1355 IF BA=1 THEN PRINT A$;CHR$(ADDCH);:PRINT #2,A$;CHR$(ADDCH);
1360 COUNT=COUNT+1
1365 IF INKEY$=CHR$(27) THEN 1385
1370 GOTO 1310
1375 REM -----
1380 GOSUB 4300
1385 CLOSE
1387 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
1390 RETURN
1495 REM ----------------- FIND AND REPLACE CHARACTER -------------------
1500 GOSUB 4500:REM GET INPUT FILE
1505 IF QUIT THEN QUIT=0:RETURN
1510 GOSUB 4600:REM GET OUTPUT FILE
1515 IF QUIT THEN QUIT=0:RETURN
1520 CLS
1525 PRINT "Decimal value of character to find (? for a list): ";
1530 LINE INPUT FINDCH$
1531 IF FINDCH$="?" THEN GOSUB 3500:GOTO 1520
1535 IF FINDCH$="" THEN CLOSE:GOSUB 4800:RETURN
1540 FINDCH=VAL(FINDCH$)
1545 IF FINDCH>255 THEN 1500
1550 PRINT "Decimal value of replacement character (N for none, ? for a list): ";
1555 LINE INPUT ADDCH$
1551 IF ADDCH$="?" THEN GOSUB 3500:GOTO 1550
1560 IF ADDCH$="" THEN CLOSE:GOSUB 4800:RETURN
1565 IF ADDCH$="N" OR ADDCH$="n" THEN 1585
1570 ADDCH=VAL(ADDCH$)
1575 IF ADDCH>255 THEN 1550
1577 PRINT:PRINT "Writing to new file-"
1580 REM -----
1585 IF EOF(1) THEN 1650
1590 A$=INPUT$(1,#1)
1595 A=ASC(A$)
1600 IF A<>FINDCH THEN 1620
1605 IF ADDCH$="N" OR ADDCH$="n" THEN 1635
1610 A$=CHR$(ADDCH)
1615 COUNT=COUNT+1
1620 IF A$=CHR$(10) THEN 1630
1625 PRINT A$;
1630 PRINT #2,A$;
1635 IF INKEY$=CHR$(27) THEN 1655
1640 GOTO 1585
1645 REM -----
1650 GOSUB 4300
1655 CLOSE
1657 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
1660 RETURN
1695 REM ------------------- FIND AND REPLACE STRING ---------------------
1700 GOSUB 4500:REM GET INPUT FILE
1705 IF QUIT THEN QUIT=0:RETURN
1710 GOSUB 4600:REM GET OUTPUT FILE
1715 IF QUIT THEN QUIT=0:RETURN
1720 CLS
1725 LOCATE 1,1:PRINT "Text to find: ";
1730 ROW=1:COL=21:LNG=25:TEMP$="":GOSUB 10000
1735 IF EXIT$="ESC" THEN CLOSE:RETURN
1740 IF TEMP$="" THEN CLOSE:GOSUB 4800:RETURN
1745 FIND$=TEMP$
1750 LOCATE 3,1:PRINT "Replacement text (just hit ENTER for none): ";
1755 ROW=3:COL=54:LNG=20:TEMP$="":GOSUB 10000
1760 IF EXIT$="ESC" THEN CLOSE:RETURN
1765 REPLACE$=TEMP$
1767 PRINT:PRINT "Writing to new file-"
1770 REM -----
1775 IF EOF(1) THEN 1845
1780 LINE INPUT #1,L$
1785 STARTPOINT=1
1790 I=INSTR(STARTPOINT,L$,FIND$)
1795 IF I=0 THEN 1820
1800 L$=LEFT$(L$,I-1)+REPLACE$+RIGHT$(L$,LEN(L$)-I-LEN(FIND$)+1)
1805 COUNT=COUNT+1
1810 STARTPOINT=I+LEN(REPLACE$)
1815 GOTO 1790
1820 PRINT L$
1825 PRINT #2,L$
1830 IF INKEY$=CHR$(27) THEN 1850
1835 GOTO 1775
1840 REM -----
1845 GOSUB 4300
1850 CLOSE
1852 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
1855 RETURN
1995 REM ------------------------- EXPAND TABS ---------------------------
2000 GOSUB 4500:REM GET INPUT FILE
2005 IF QUIT THEN QUIT=0:RETURN
2010 GOSUB 4600:REM GET OUTPUT FILE
2015 IF QUIT THEN QUIT=0:RETURN
2020 CLS
2025 PRINT "Number of spaces to create for each tab (up to 32): ";
2030 LINE INPUT NUM$
2035 NUM=VAL(NUM$)
2040 IF NUM>32 THEN 2000
2042 PRINT:PRINT "Writing to new file-"
2045 REM -----
2050 IF EOF(1) THEN 2105
2055 A$=INPUT$(1,#1)
2060 A=ASC(A$)
2065 IF A=9 THEN B$=SPACE$(NUM):COUNT=COUNT+1:GOTO 2080
2070 B$=CHR$(A)
2075 IF B$=CHR$(10) THEN 2085
2080 PRINT B$;
2085 PRINT #2,B$;
2090 IF INKEY$=CHR$(27) THEN 2110
2095 GOTO 2050
2100 REM -----
2105 GOSUB 4300
2110 CLOSE
2112 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
2115 RETURN
2195 REM ------------------------ COMPRESS TABS --------------------------
2200 GOSUB 4500:REM GET INPUT FILE
2205 IF QUIT THEN QUIT=0:RETURN
2210 GOSUB 4600:REM GET OUTPUT FILE
2215 IF QUIT THEN QUIT=0:RETURN
2220 CLS
2225 PRINT "Number of spaces to compress into a tab (up to 32): ";
2230 LINE INPUT NUM$
2235 NUM=VAL(NUM$)
2240 IF NUM>32 THEN 2200
2245 NUMSPC=0
2247 PRINT:PRINT "Writing to new file-"
2250 REM ----- CONVERT LOOP
2255 IF EOF(1) THEN 2335
2260 A$=INPUT$(1,#1)
2265 A=ASC(A$)
2270 IF A<>32 THEN 2290
2275 NUMSPC=NUMSPC+1
2280 IF NUMSPC=NUM THEN NUMSPC=0:B$=CHR$(9):COUNT=COUNT+1:GOTO 2310
2285 GOTO 2255
2290 IF NUMSPC=0 THEN 2300
2295 PRINT SPACE$(NUMSPC);:PRINT #2,SPACE$(NUMSPC);:NUMSPC=0
2300 B$=CHR$(A)
2305 IF B$=CHR$(10) THEN 2315
2310 PRINT B$;
2315 PRINT #2,B$;
2320 IF INKEY$=CHR$(27) THEN 2340
2325 GOTO 2255
2330 REM -----
2335 GOSUB 4300
2340 CLOSE
2342 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
2345 RETURN
2495 REM ------------- CONVERT NON-PRINTING CHARACTERS TO CODES --------------
2500 GOSUB 4500:REM GET INPUT FILE
2505 IF QUIT THEN QUIT=0:RETURN
2510 GOSUB 4600:REM GET OUTPUT FILE
2515 IF QUIT THEN QUIT=0:RETURN
2520 PRINT:PRINT "Writing to new file-"
2525 REM -----
2530 IF EOF(1) THEN 2595
2535 A$=INPUT$(1,#1)
2540 A=ASC(A$)
2545 IF A>=32 AND A <=126 THEN B$=CHR$(A):GOTO 2565
2550 IF A=13 OR A=10 THEN B$=CHR$(A):GOTO 2565
2555 B$="{d"+RIGHT$(STR$(A),LEN(STR$(A))-1)+"h"+HEX$(A)+"}"
2560 COUNT=COUNT+1
2565 IF B$=CHR$(10) THEN 2575
2570 PRINT B$;
2575 PRINT #2,B$;
2580 IF INKEY$=CHR$(27) THEN 2600
2585 GOTO 2530
2590 REM -----
2595 GOSUB 4300
2600 CLOSE
2602 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
2605 RETURN
2995 REM ----------------------- STRIP BIT 7 ------------------------
3000 GOSUB 4500:REM GET INPUT FILE
3005 IF QUIT THEN QUIT=0:RETURN
3010 GOSUB 4600:REM GET OUTPUT FILE
3015 IF QUIT THEN QUIT=0:RETURN
3020 PRINT:PRINT "Writing to new file-"
3045 REM -----
3050 IF EOF(1) THEN 3115
3055 A$=INPUT$(1,#1)
3060 A=ASC(A$)
3065 IF A<=127 THEN 3080
3070 A=(A AND 127)
3075 COUNT=COUNT+1
3080 B$=CHR$(A)
3085 IF B$=CHR$(10) THEN 3095
3090 PRINT B$;
3095 PRINT #2,B$;
3100 IF INKEY$=CHR$(27) THEN 3120
3105 GOTO 3050
3110 REM -----
3115 GOSUB 4300
3120 CLOSE
3125 IF FIN$=FOUT$ THEN KILL FIN$:NAME FTMP$ AS FIN$
3135 RETURN
3490 REM --------------------- ASCII CHART ------------------------
3500 DIM CC$(32)
3510 CC$(0)="NUL"
3520 CC$(1)="SOH"
3530 CC$(2)="STX"
3540 CC$(3)="ETX"
3550 CC$(4)="EOT"
3560 CC$(5)="ENQ"
3570 CC$(6)="ACK"
3580 CC$(7)="BEL"
3590 CC$(8)="BS"
3600 CC$(9)="HT"
3610 CC$(10)="LF"
3620 CC$(11)="VT"
3630 CC$(12)="FF"
3640 CC$(13)="CR"
3650 CC$(14)="SO"
3660 CC$(15)="SI"
3670 CC$(16)="DLE"
3680 CC$(17)="DC1"
3690 CC$(18)="DC2"
3700 CC$(19)="DC3"
3710 CC$(20)="DC4"
3720 CC$(21)="NAK"
3730 CC$(22)="SYN"
3740 CC$(23)="ETB"
3750 CC$(24)="CAN"
3760 CC$(25)="EM"
3770 CC$(26)="SUB"
3780 CC$(27)="ESC"
3790 CC$(28)="FS"
3800 CC$(29)="GS"
3810 CC$(30)="RS"
3820 CC$(31)="US"
3890 REM ----- DISPLAY 4 SCREENS
3900 SCOL=0:ECOL=3:GOSUB 4000:IF QUIT THEN 3940
3910 SCOL=4:ECOL=7:GOSUB 4000:IF QUIT THEN 3940
3920 SCOL=8:ECOL=11:GOSUB 4000:IF QUIT THEN 3940
3930 SCOL=12:ECOL=15:GOSUB 4000:IF QUIT THEN 3940
3940 QUIT=0
3950 ERASE CC$
3960 RETURN
3990 REM ----- DISPLAY ONE SCREEN
4000 CLS
4010 LOCATE 1,29
4020 PRINT "ASCII CHARACTER SET";
4030 FOR COL=SCOL TO ECOL
4040   FOR ROW=0 TO 15
4050     RC=ROW+(COL*16)
4060     RC$=CHR$(RC)
4070     LOCATE ROW+5,1+((COL MOD 4)*22)
4080     PRINT USING "###";RC;:PRINT "d";
4090     RCH$=HEX$(RC)
4100     IF LEN(RCH$)<2 THEN RCH$="0"+RCH$
4110     PRINT " ";RCH$;"h";
4120     SC$=CHR$(RC)
4130     IF RC=7 THEN SC$=" "
4140     IF RC>=9 AND RC<=13 THEN SC$=" "
4150     IF RC>=28 AND RC<=31 THEN SC$=" "
4160     PRINT " ";SC$;
4170     IF RC<=31 THEN PRINT " ";CC$(RC);
4180   NEXT ROW
4190 NEXT COL
4200 LOCATE 25,28
4210 PRINT "Hit any key to continue";
4220 IN$=INKEY$:IF IN$="" THEN 4220
4230 IF IN$=CHR$(27) THEN QUIT=-1:RETURN
4240 RETURN
4290 REM -------------- DISPLAY COUNTS ----------------
4300 PRINT
4310 PRINT "There were";COUNT;"modifications made."
4320 PRINT "Hit any key to continue... ";
4330 IN$=INKEY$:IF IN$="" THEN 4330
4340 COUNT=0
4350 RETURN
4390 REM -------------- GET FILE NAMES ----------------
4500 EXT$="*"
4510 FILEMSG$="Select Input File or Hit Escape to Exit"
4520 GOSUB 22000:REM GET FILE FROM ANY DIRECTORY
4530 IF EXIT$="ESC" THEN QUIT=-1:RETURN
4540 IF EXT$="" THEN FIN$=FILE$ ELSE FIN$=FILE$+"."+EXT$
4550 OPEN DIRPATH$+FIN$ FOR INPUT AS #1
4560 RETURN
4590 REM -----
4600 CLS
4610 LOCATE 13,28:PRINT "(include extension if used)";
4620 LOCATE 11,22:PRINT "Enter output file name : ";
4630 TEMP$=FIN$:ROW=11:COL=47:LNG=12:GOSUB 10000:FOUT$=TEMP$
4640 IF EXIT$="ESC" THEN QUIT=-1:RETURN
4650 IF EXIT$<>"ENTER" THEN 4630
4660 IF FOUT$="" THEN QUIT=-1:CLOSE:GOSUB 4800:RETURN
4670 REM -----
4700 ON ERROR GOTO 4750
4710 IF FIN$<>FOUT$ THEN OPEN DIRPATH$+FOUT$ FOR OUTPUT AS #2:GOTO 4720
4715 FTMP$=FILE$+".TMP":OPEN DIRPATH$+FTMP$ FOR OUTPUT AS #2
4720 ON ERROR GOTO 0
4730 RETURN
4740 REM -----
4750 RESUME 4760
4760 ON ERROR GOTO 0
4770 LOCATE 13,27:PRINT "There is a problem with that file name"
4780 GOTO 4620
4790 REM ----------
4800 CLS
4810 MSG$="Incomplete information, operation cancelled"
4820 ROW=11:GOSUB 9500
4830 T=TIMER
4840 IF TIMER<T+2 THEN 4840
4850 RETURN
4990 REM --------------------- BINARY FILE EDITOR ---------------------
5000 EXT$="*"
5010 FILEMSG$="Select File to Edit or Hit Escape to Exit"
5020 GOSUB 22000:REM GET FILE FROM ANY DIRECTORY
5030 IF EXIT$="ESC" THEN RETURN
5040 IF EXT$="" THEN FIN$=FILE$ ELSE FIN$=FILE$+"."+EXT$
5050 FTEMP$=FILE$+".$$$"
5060 REM ----- MAKE TEMP FILE, FIND LENGTH -----
5070 DIM BIN%(256)
5080 OFFSET=0
5090 LOCATE 1,1,0:CLS:SHELL "COPY "+DIRPATH$+FIN$+" "+DIRPATH$+FTEMP$
5095 ON ERROR GOTO 5160
5100 OPEN DIRPATH$+FTEMP$ FOR INPUT AS #1
5105 ON ERROR GOTO 0
5110 FILELEN=LOF(1)
5120 CLOSE #1
5130 OPEN "R",#1,DIRPATH$+FTEMP$,1
5140 FIELD #1,1 AS FILEBYTE$
5150 GOTO 5200
5155 REM -----
5160 RESUME 5165
5165 CLS:MSG$="There is a problem copying the selected file to a temporary file":ROW=10:GOSUB 9500
5170 MSG$="The disk is nearly full, write-protected, or not ready":ROW=12:GOSUB 9500
5175 T=TIMER
5180 IF TIMER<T+4 THEN 5180
5185 GOTO 5000
5190 REM ----- BEGIN EDITING -----
5200 GOSUB 9000
5210 CHANGE=0
5220 LOCATE 2,14:PRINT "Editing "+FIN$+"   "
5230 LOCATE 2,42:PRINT "File length =";FILELEN;"    ";
5240 LOCATE 3,4:PRINT "Seg:Off";:LOCATE 3,65:PRINT "Ascii/Screen";
5250 ROW=24:MSG$=CHR$(24)+" "+CHR$(25)+" "+CHR$(27)+" "+CHR$(26)
5260 MSG$=MSG$+"  (Ctrl) PgUp PgDn  Home  End  Esc    ":GOSUB 9500
5290 REM ----- READ ONE (NEXT) BLOCK INTO ARRAY -----
5300 FOR BYTE=OFFSET TO OFFSET+255
5310   GET #1,BYTE+1
5320   BIN%(BYTE MOD 256)=ASC(FILEBYTE$)
5330   MSG$="Reading byte"+STR$(BYTE+1)+" of"+STR$(FILELEN)+"   "
5340   ROW=22:GOSUB 9500
5350   IF BYTE+1=FILELEN THEN 5370
5360 NEXT BYTE
5370 LOCATE 22,20:PRINT SPACE$(40);
5990 REM ----- DISPLAY BYTES -----
6100 FOR BYTE=OFFSET TO OFFSET+255
6110   RR=(INT(BYTE/16) MOD 16)
6120   IF RR<=7 THEN ROW=RR+4 ELSE ROW=RR+5
6130   HCOL=((BYTE MOD 16)*3)+14
6140   ACOL=(BYTE MOD 16)+63
6150   IF BYTE+1>FILELEN THEN HH$="xx":A$=".":GOTO 6220
6160     HH$=HEX$(BIN%(BYTE MOD 256))
6170     IF LEN(HH$)<2 THEN HH$="0"+HH$
6180     A$=CHR$(BIN%(BYTE MOD 256))
6190     IF BIN%(BYTE MOD 256)=7 THEN A$="."
6200     IF BIN%(BYTE MOD 256)>=9 AND BIN%(BYTE MOD 256)<=13 THEN A$="."
6210     IF BIN%(BYTE MOD 256)>=28 AND BIN%(BYTE MOD 256)<=31 THEN A$="."
6220     IF BYTE MOD 16<>0 THEN 6300
6230       IF BYTE+1>FILELEN THEN SEGMENT$="xxxx":OFFSET$="xxxx":GOTO 6280
6240       SEGMENT$=HEX$(INT(BYTE/65536))
6250       IF LEN(SEGMENT$)<4 THEN SEGMENT$="0"+SEGMENT$:GOTO 6250
6260       OFFSET$=HEX$(((BYTE/65536)-(INT(BYTE/65536)))*65536)
6270       IF LEN(OFFSET$)<4 THEN OFFSET$="0"+OFFSET$:GOTO 6270
6280     LOCATE ROW,3:PRINT SEGMENT$+":"+OFFSET$;
6300   LOCATE ROW,HCOL:PRINT HH$;
6310   LOCATE ROW,ACOL:PRINT A$;
6320 NEXT BYTE
6330 REM
6490 REM ----- EDIT VALUES -----
6500 BYTE=OFFSET
6510 REM ----- DISPLAY VALUE
6600 TEMP$=HEX$(BIN%(BYTE MOD 256))
6605 IF LEFT$(TEMP$,1)=" " THEN TEMP$=RIGHT$(TEMP$,LEN(TEMP$)-1)
6610 IF LEN(TEMP$)<2 THEN TEMP$="0"+TEMP$
6615 OLDVAL$=TEMP$
6620 RR=(INT(BYTE/16) MOD 16)
6625 IF RR<=7 THEN ROW=RR+4 ELSE ROW=RR+5
6630 COL=((BYTE MOD 16)*3)+14
6635 OFFSET$=HEX$(BYTE)
6640 REM IF LEN(OFFSET$)<4 THEN OFFSET$="0"+OFFSET$:GOTO 6640
6645 LOCATE 22,3:PRINT "Hex:";
6650 LOCATE 23,3:PRINT "Offset         ";:LOCATE 23,10:PRINT OFFSET$;
6655 LOCATE 24,3:PRINT "Value   ";:LOCATE 24,9:PRINT TEMP$;
6660 LOCATE 22,65:PRINT "Decimal:";
6665 LOCATE 23,65:PRINT "Offset        ";:LOCATE 23,71:PRINT BYTE;
6670 LOCATE 24,65:PRINT "Value         ";:LOCATE 24,70:PRINT BIN%(BYTE MOD 256);
6675 LNG=2:GOSUB 10000:REM MODIFIED EDIT ROUTINE
6680 IF OLDVAL$<>TEMP$ THEN CHANGE=-1
6690 REM ----- CHECK CHARACTERS ENTERED
6700 IF TEMP$="" THEN TEMP$="00"
6710 IF LEFT$(TEMP$,1)=" " THEN TEMP$="0"+RIGHT$(TEMP$,1)
6715 IF RIGHT$(TEMP$,1)=" " THEN TEMP$="0"+LEFT$(TEMP$,1)
6720 IF LEN(TEMP$)=1 THEN TEMP$="0"+TEMP$
6730 L=ASC(LEFT$(TEMP$,1))
6740 R=ASC(RIGHT$(TEMP$,1))
6750 IF L>=48 AND L<=57 THEN LL=(L-48)*16:GOTO 6800
6760 IF L>=65 AND L<=70 THEN LL=(L-55)*16:GOTO 6800
6770 IF L>=97 AND L<=102 THEN LL=(L-87)*16:GOTO 6800
6780 GOTO 6600
6800 IF R>=48 AND R<=57 THEN RR=(R-48):GOTO 6850
6810 IF R>=65 AND R<=70 THEN RR=(R-55):GOTO 6850
6820 IF R>=97 AND R<=102 THEN RR=(R-87):GOTO 6850
6830 GOTO 6600
6850 BIN%(BYTE MOD 256)=LL+RR
6860 REM ----- UPDATE SCREEN
6900 LOCATE ROW,COL:PRINT TEMP$;
6910 ACOL=(BYTE MOD 16)+63
6920 A$=CHR$(BIN%(BYTE MOD 256))
6930 IF BIN%(BYTE MOD 256)=7 THEN A$="."
6940 IF BIN%(BYTE MOD 256)>=9 AND BIN%(BYTE MOD 256)<=13 THEN A$="."
6950 IF BIN%(BYTE MOD 256)>=28 AND BIN%(BYTE MOD 256)<=31 THEN A$="."
6960 LOCATE ROW,ACOL:PRINT A$;
6970 REM ----- ACT ON SPECIAL KEYS
7000 IF EXIT$<>"ESC" THEN 7030
7010 IF CHANGE THEN CHANGE=0:GOSUB 8200
7020 GOSUB 8000:RETURN
7025 REM ---
7030 IF EXIT$<>"HOME" THEN 7100
7035 IF OFFSET=0 THEN 6600
7040 IF CHANGE THEN CHANGE=0:GOSUB 8200
7050 OFFSET=0
7060 GOTO 5300:REM NEXT BLOCK
7070 REM ---
7100 IF EXIT$<>"END" THEN 7200
7105 IF OFFSET=256*INT((FILELEN-1)/256) THEN 6600
7110 IF CHANGE THEN CHANGE=0:GOSUB 8200
7120 OFFSET=256*INT((FILELEN-1)/256)
7130 GOTO 5300:REM NEXT BLOCK
7140 REM ---
7200 IF EXIT$<>"PGUP" THEN 7250
7205 IF OFFSET=0 THEN 6600
7210 IF CHANGE THEN CHANGE=0:GOSUB 8200
7220 OFFSET=OFFSET-256
7225 IF OFFSET<0 THEN OFFSET=0
7230 GOTO 5300:REM NEXT BLOCK
7240 REM ---
7250 IF EXIT$<>"PGDN" THEN 7400
7255 IF OFFSET=256*INT((FILELEN-1)/256) THEN 6600
7260 IF CHANGE THEN CHANGE=0:GOSUB 8200
7270 OFFSET=OFFSET+256
7275 IF OFFSET>FILELEN-1 THEN OFFSET=OFFSET-256
7280 GOTO 5300:REM NEXT BLOCK
7290 REM ---
7400 IF EXIT$<>"CTRLPGUP" THEN 7450
7405 IF OFFSET=0 THEN 6600
7410 IF CHANGE THEN CHANGE=0:GOSUB 8200
7420 OFFSET=OFFSET-4096
7425 IF OFFSET<0 THEN OFFSET=0
7430 GOTO 5300:REM NEXT BLOCK
7440 REM ---
7450 IF EXIT$<>"CTRLPGDN" THEN 7600
7455 IF OFFSET=256*INT((FILELEN-1)/256) THEN 6600
7460 IF CHANGE THEN CHANGE=0:GOSUB 8200
7470 OFFSET=OFFSET+4096
7475 IF OFFSET>FILELEN-1 THEN OFFSET=256*INT((FILELEN-1)/256)
7480 GOTO 5300:REM NEXT BLOCK
7490 REM ---
7600 IF EXIT$<>"UP" THEN 7650
7610 BYTE=BYTE-16:IF BYTE<OFFSET THEN BYTE=BYTE+16
7620 GOTO 6600
7630 REM ---
7650 IF EXIT$<>"DOWN" THEN 7800
7660 BYTE=BYTE+16:IF BYTE>OFFSET+255 OR BYTE+1>FILELEN THEN BYTE=BYTE-16
7670 GOTO 6600
7680 REM ---
7800 IF EXIT$<>"LEFT" THEN 7850
7810 BYTE=BYTE-1:IF BYTE<OFFSET THEN BYTE=BYTE+1
7820 GOTO 6600
7830 REM ---
7850 IF EXIT$<>"RIGHT" AND EXIT$<>"ENTER" THEN 7900
7860 BYTE=BYTE+1:IF BYTE>OFFSET+255 OR BYTE+1>FILELEN THEN BYTE=BYTE-1
7870 GOTO 6600
7880 REM -----
7900 IF EXIT$="PLUS" THEN FILELEN=FILELEN+1:GOTO 7930
7910 IF EXIT$="MINUS" THEN FILELEN=FILELEN-1
7920 IF FILELEN<1 THEN FILELEN=1
7930 LOCATE 2,42:PRINT "File length =";FILELEN;"    ";
7940 CHANGE=-1:GOTO 6100
7950 REM -----
7960 GOTO 6600
7990 REM ----- CLEAN UP FILES FOR EXIT -----
8000 MSG$="Hit ENTER to save file, ESCAPE to exit    ":ROW=22:GOSUB 9500
8010 IN$=INKEY$:IF IN$="" THEN 8010
8020 IF IN$=CHR$(13) THEN ERASE BIN%:CLOSE:KILL FIN$:NAME DIRPATH$+FTEMP$ AS DIRPATH$+FIN$:RETURN 
8030 IF IN$=CHR$(27) THEN ERASE BIN%:CLOSE:KILL DIRPATH$+FTEMP$:RETURN
8040 GOTO 8010
8190 REM ----- WRITE ONE BLOCK FROM ARRAY -----
8200 FOR BYTE=OFFSET TO OFFSET+255
8210   LSET FILEBYTE$=CHR$(BIN%(BYTE MOD 256))
8220   PUT #1,BYTE+1
8230   MSG$="Writing byte"+STR$(BYTE+1)+" of"+STR$(FILELEN)+"   "
8240   ROW=22:GOSUB 9500
8250   IF BYTE+1=FILELEN THEN 8270
8260 NEXT BYTE
8270 LOCATE 22,20:PRINT SPACE$(40);
8280 RETURN
8930 REM ------------- from ROUTSMAL.BAS and ROUTINES.BAS --------------------
8935 REM *********************************************************************
8940 REM --------------------- OUTLINE THE SCREEN ----------------------------
8945 REM
8950 REM This subroutine outlines the screen with a box.
8965 REM
9000 KEY OFF:FOR A%=1 TO 10:KEY A%,"":NEXT A%
9010 LOCATE ,,0:COLOR 7,0:CLS
9020 TP=196:BT=196:MS=179:UL=218:LL=192:UR=191:LR=217
9025 REM TP=205:BT=205:MS=186:UL=201:LL=200:UR=187:LR=188
9030 REM TP=223:BT=220:MS=219:UL=219:LL=219:UR=219:LR=219
9035 ROW=1:LOCATE ROW,2:PRINT STRING$(78,CHR$(TP));
9040 ROW=25:LOCATE ROW,2:PRINT STRING$(78,CHR$(BT));
9045 COL=1:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
9050 COL=80:FOR ROW%=2 TO 24:LOCATE ROW%,COL:PRINT CHR$(MS);:NEXT ROW%
9055 LOCATE 1,1:PRINT CHR$(UL);:LOCATE 1,80:PRINT CHR$(UR);
9060 LOCATE 25,1:PRINT CHR$(LL);:LOCATE 25,80:PRINT CHR$(LR);
9065 RETURN
9070 REM
9075 REM
9460 REM *********************************************************************
9465 REM ------------------- DISPLAY CENTERED MESSAGE ------------------------
9470 REM
9475 REM This subroutine displays a message at the center of a specified row.
9480 REM
9485 REM enter with - MSG$="message", to display
9490 REM              ROW= row on which to display "message"
9495 REM
9500 COL=41-INT((LEN(MSG$)/2))
9505 LOCATE ROW,COL,0:PRINT MSG$;
9510 RETURN
9515 REM
9900 REM *********************************************************************
9905 REM ---------------- EDIT A FIELD AT ROW AND COLUMN ---------------------
9910 REM
9915 REM This subroutine allows you to edit or enter a string. The editing
9920 REM keys work about the same as BASIC in the screen editing mode.
9925 REM
9930 REM enter with - ROW and COL=row and column at which to edit the string
9935 REM              LNG=maximum length of string allowed
9940 REM              TEMP$="string" to edit
9945 REM exit with -  TEMP$="string" edited or entered
9950 REM              EXIT$=key hit that exited routine-"ENTER" or "ESC"
9955 REM            + -------------------------------------------------------+
9960 REM            | OTHER EXIT$ KEYS INCLUDED IN THIS SPECIAL VERSION:     |
9965 REM   SPECIAL  | PGUP, PGDN, CTRLPGUP, CTRLPGDN, HOME, END, UP, DN, + - |
9970 REM    MODS:   | CHANGED THE WAY LEFT AND RIGHT ARROW KEYS WORK,        |
9975 REM            | CURSOR NOW ALWAYS STARTS AT BEGINNING OF STRING        |
9980 REM            +--------------------------------------------------------+
9985 REM              ESCAPE=-1 (TRUE) if ESCAPE key hit
9990 REM              (for compatibility with old versions)
9995 REM
10000 LOCATE ,,0:INS=0:TEMP$=LEFT$(TEMP$,LNG)
10005 EDCOL=COL                                              :REM changed !!!!!
10010 LOCATE ROW,COL,0:COLOR 0,7:PRINT TEMP$;
10015 LOCATE ROW,COL+LEN(TEMP$):PRINT SPACE$(LNG-LEN(TEMP$));
10020 L=LEN(TEMP$)
10025 AAAA$=MID$(TEMP$,EDCOL-COL+1,1)
10030 IF INS THEN LOCATE ROW,EDCOL:COLOR 15,0
10035 IF INS THEN PRINT AAAA$;:COLOR 0,7
10040 IF EDCOL=COL+LNG THEN EDCOL=EDCOL-1
10045 LOCATE ROW,EDCOL
10050 LOCATE,,1
10055 IN$=INKEY$:IF IN$="" THEN 10055                        :REM WAIT FOR KEY
10060 IF IN$=CHR$(13) THEN EXIT$="ENTER":ESCAPE=0:GOTO 10325 :REM ENTER
10065 IF IN$=CHR$(27) THEN EXIT$="ESC":ESCAPE=-1:GOTO 10325  :REM ESCAPE
10070 IF IN$=CHR$(8) THEN 10180                              :REM BACKSPACE
10075 IF IN$=CHR$(0)+CHR$(75) THEN 10225         :REM LEFT ARROW changed !!!!!
10076 IF IN$=CHR$(0)+CHR$(77) THEN 10240        :REM RIGHT ARROW changed !!!!!
10077 REM IF IN$=CHR$(0)+CHR$(79) THEN 10275            :REM END changed !!!!!
10078 IF IN$=CHR$(0)+CHR$(82) THEN 10295                     :REM INSERT
10079 IF IN$=CHR$(0)+CHR$(83) THEN 10305                     :REM DELETE
10080 REM -------------------------------------------------------------------+
10081 IF IN$=CHR$(0)+CHR$(72) THEN EXIT$="UP":GOTO 10325  :REM UP ARROW      |
10082 IF IN$=CHR$(0)+CHR$(80) THEN EXIT$="DOWN":GOTO 10325:REM DOWN ARROW    |
10083 IF IN$=CHR$(0)+CHR$(73) THEN EXIT$="PGUP":GOTO 10325:REM PAGE UP       |
10084 IF IN$=CHR$(0)+CHR$(81) THEN EXIT$="PGDN":GOTO 10325:REM PAGE DOWN     |
10085 IF IN$=CHR$(0)+CHR$(132) THEN EXIT$="CTRLPGUP":GOTO 10325:REM PAGE UP  |
10086 IF IN$=CHR$(0)+CHR$(118) THEN EXIT$="CTRLPGDN":GOTO 10325:REM PAGE DOWN|
10087 IF IN$="+" THEN EXIT$="PLUS":GOTO 10325                  :REM PLUS     |
10088 IF IN$="-" THEN EXIT$="MINUS":GOTO 10325                :REM MINUS     |
10090 IF IN$=CHR$(0)+CHR$(71) THEN EXIT$="HOME":GOTO 10325:REM HOME    added |
10095 IF IN$=CHR$(0)+CHR$(79) THEN EXIT$="END":GOTO 10325 :REM END     these |
10097 REM -------------------------------------------------------------------+
10100 REM ----- allow only legitimate alphanumeric
10105 IF ASC(IN$)<32 OR ASC(IN$)>126 THEN GOSUB 10400:GOTO 10050
10110 REM ----- good character
10115 L=EDCOL-COL:IF INS THEN 10155
10120 REM ----- add character if at end of string
10125 IF EDCOL=COL+LEN(TEMP$) THEN TEMP$=TEMP$+IN$:EDCOL=EDCOL+1:GOTO 10010
10130 REM ----- add character in middle if not in insert mode
10135 TEMP$=LEFT$(TEMP$,L)+IN$+RIGHT$(TEMP$,LEN(TEMP$)-1-L):EDCOL=EDCOL+1
10140 IF EDCOL=COL+LNG THEN EXIT$="ENTER":GOTO 10325       :REM changed !!!!!
10145 GOTO 10010
10150 REM ----- in insert mode, check for full field
10155 IF LEN(TEMP$)=LNG THEN GOSUB 10400:GOTO 10010        :REM full field
10160 TEMP$=LEFT$(TEMP$,L)+IN$+RIGHT$(TEMP$,LEN(TEMP$)-L)  :REM not full
10165 EDCOL=EDCOL+1:GOTO 10010
10170 REM ----- BACKSPACE -----
10175 REM ----- error if at leftmost column
10180 IF EDCOL=COL THEN GOSUB 10400:GOTO 10010
10185 REM ----- skip moving cursor left if the field is full
10190 IF LEN(TEMP$)=LNG AND EDCOL=COL+LNG-1 THEN 10215
10195 REM ----- normal backspace (in middle of field)
10200 L=EDCOL-1-COL:TEMP$=LEFT$(TEMP$,L)+RIGHT$(TEMP$,LEN(TEMP$)-1-L)
10205 EDCOL=EDCOL-1:GOTO 10010
10210 REM ----- backspace if at rightmost column
10215 TEMP$=LEFT$(TEMP$,LEN(TEMP$)-1):GOTO 10010
10220 REM ----- LEFT ARROW -----
10225 INS=0:IF EDCOL>COL THEN EDCOL=EDCOL-1:GOTO 10010
10230 EXIT$="LEFT":GOTO 10325                           :REM changed !!!!!
10235 REM ----- RIGHT ARROW -----
10240 INS=0:IF EDCOL<COL+LNG-1 THEN 10255
10245 EXIT$="RIGHT":GOTO 10325                          :REM changed !!!!!
10250 REM ----- move cursor right if applicable
10255 IF EDCOL<COL+LEN(TEMP$) THEN EDCOL=EDCOL+1:GOTO 10010
10260 REM add "blank" character when cursor is moved to right
10265 TEMP$=TEMP$+CHR$(255):EDCOL=EDCOL+1:GOTO 10010
10270 REM ----- END -----
10275 INS=0:IF LEN(TEMP$)=LNG THEN EDCOL=COL+LEN(TEMP$)-1:GOTO 10010
10280 EDCOL=COL+LEN(TEMP$):GOTO 10010
10285 REM:END:IF EDCOL>COL+LNG THEN EDCOL=COL+LNG:GOTO 10025
10290 REM ----- INSERT -----
10295 IF INS THEN INS=0:GOTO 10010 ELSE INS=-1:GOTO 10010
10300 REM ----- DELETE -----
10305 INS=0:L=EDCOL-COL
10310 IF EDCOL>=COL+LEN(TEMP$) THEN GOSUB 10400:GOTO 10010
10315 TEMP$=LEFT$(TEMP$,L)+RIGHT$(TEMP$,LEN(TEMP$)-L-1):GOTO 10010
10320 REM ----- COMMON EXIT -----
10325 REM remove blanks at end
10330 IF RIGHT$(TEMP$,1)=CHR$(255) THEN TEMP$=LEFT$(TEMP$,LEN(TEMP$)-1):GOTO 10330
10335 REM change blanks in middle to spaces
10340 FOR AAAA%=1 TO LEN(TEMP$)
10345 IF MID$(TEMP$,AAAA%,1)=CHR$(255) THEN MID$(TEMP$,AAAA%,1)=" "
10350 NEXT AAAA%
10355 REM redisplay string
10360 LOCATE ROW,COL,0:COLOR 7,0
10365 PRINT TEMP$+SPACE$(LNG-LEN(TEMP$));
10370 RETURN
10375 REM
10395 REM ----- BEEP IF ERROR -----
10400 BEEP:RETURN
10405 REM
21925 REM ********************************************************************
21930 REM ---------- SELECT A FILE FROM ANY DIRECTORY ON THE DISK ------------
21935 REM
21940 REM This subroutine allows you to move up and down among a list of
21945 REM files and select one, or to move to another directory to continue
21950 REM the selection process. The file extension can be specified or all
21955 REM extensions allowed.
21960 REM
21965 REM    enter with   EXT$ (or *), FILEMSG$, DIRPATH$
21970 REM    exit with    FILE$, EXT$, DIRPATH$, NUMFILES
21975 REM                 EXIT$=key hit that exited routine-"ENTER" or "ESC"
21980 REM                 ESCAPE=-1 (TRUE) if ESCAPE key hit
21985 REM                 (for compatibility with old versions)
21990 REM                 DOSERROR$="NONE", "DISK"
21995 REM
22000 LOCATE ,,0:COLOR 7,0:CLS
22005 IF EXT$="*" THEN DIR1$="Root Directory":DIR2$="Up a Directory"
22010 IF EXT$<>"*" THEN DIR1$="Root Dir":DIR2$="Up a Dir"
22015 IF EXT$="*" THEN EXTOFF=5 ELSE EXTOFF=0
22020 IF EXT$="*" THEN COL=32 ELSE COL=34
22025 REM -----
22030 SHEL$="DIR "+DIRPATH$+"*.* | SORT > FILES.TMP":SHELL SHEL$:REM
22035 ON ERROR GOTO 22090
22040 OPEN "FILES.TMP" FOR INPUT AS 3
22045 IF LOF(3)=0 THEN CLOSE #1:GOTO 22055
22050 GOTO 22105
22055 PRINT:PRINT "SORT utility not in DOS path"
22060 REM -----
22065 SHEL$="DIR "+DIRPATH$+"*.* > FILES.TMP":SHELL SHEL$
22070 ON ERROR GOTO 22090
22075 OPEN "FILES.TMP" FOR INPUT AS 3
22080 IF LOF(3)=0 THEN CLOSE #1:GOTO 22095
22085 GOTO 22110
22090 RESUME 22095
22095 DOSERROR$="DISK":NUMFILES=0:FILE$=""
22100 ON ERROR GOTO 0:COLOR 7,0:RETURN
22105 REM -----
22110 ON ERROR GOTO 0
22115 DIM FILENAME$(1000):NUMFILES=0:NUMFIL=0:DOSERROR$="NONE":EXIT$=""
22120 REM -----
22125 IF EOF(3) THEN 22235
22130 LINE INPUT #3,FILE$
22135 IF INSTR(FILE$,"Directory")=0 THEN 22145
22140 DIRPATH$=MID$(FILE$,INSTR(FILE$,":\")+1,63):GOTO 22125
22145 IF LEFT$(FILE$,2)=".." THEN FILE$=DIR2$+"   ":GOTO 22195
22150 IF LEFT$(FILE$,1)="." THEN FILE$=DIR1$+ "   ":GOTO 22195
22155 IF INSTR(FILE$,"<DIR>")=0 THEN 22170
22160 FILE$="\"+LEFT$(FILE$,8)
22165 GOTO 22200
22170 IF LEFT$(FILE$,1)=" " OR MID$(FILE$,9,1)<>" " THEN 22125
22175 IF EXT$="*" THEN 22190
22180 IF MID$(FILE$,10,3)<>EXT$ THEN 22125
22185 NUMFILES=NUMFILES+1
22190 IF VAL(MID$(FILE$,14,13))=0 THEN 22125
22195 FILE$=LEFT$(FILE$,9+EXTOFF)
22200 IF EXT$="*" THEN FILE$=FILE$+SPACE$(14-LEN(FILE$))
22205 IF EXT$<>"*" THEN FILE$=FILE$+SPACE$(9-LEN(FILE$))
22210 FILENAME$(NUMFIL+1)=FILE$
22215 NUMFIL=NUMFIL+1
22220 IF NUMFIL>1000 THEN 22235
22225 GOTO 22125
22230 REM -----
22235 CLOSE 3:KILL "FILES.TMP"
22240 IF NUMFIL=0 THEN FILE$="":GOTO 22710
22245 REM ----- OUTLINE THE AREA
22250 ON ERROR GOTO 0:CLS
22255 TP=196:BT=196:MS=179:UL=218:LL=192:UR=191:LR=217
22260 REM TP=205:BT=205:MS=186:UL=201:LL=200:UR=187:LR=188
22265 REM TP=223:BT=220:MS=219:UL=219:LL=219:UR=219:LR=219
22270 ROW=4:LOCATE ROW,1+COL:PRINT STRING$(11+EXTOFF,CHR$(TP));
22275 ROW=24:LOCATE ROW,1+COL:PRINT STRING$(11+EXTOFF,CHR$(BT));
22280 DCOL=COL:FOR ROW=5 TO 23:LOCATE ROW,DCOL:PRINT CHR$(MS);:NEXT
22285 DCOL=COL+12+EXTOFF:FOR ROW=5 TO 23:LOCATE ROW,DCOL:PRINT CHR$(MS);:NEXT
22290 LOCATE 4,COL:PRINT CHR$(UL);:LOCATE 4,COL+12+EXTOFF:PRINT CHR$(UR);
22295 LOCATE 24,COL:PRINT CHR$(LL);:LOCATE 24,COL+12+EXTOFF:PRINT CHR$(LR);
22300 REM ----- DISPLAY MESSAGES
22305 IF EXT$="*" OR NUMFILES>0 THEN 22320
22310 MSG$="There are no files in the current directory with the extension "+EXT$
22315 GOTO 22325
22320 MSG$=FILEMSG$
22325 ROW=1:MCOL=41-INT((LEN(MSG$)/2))
22330 LOCATE ROW,MCOL:PRINT MSG$;
22335 ROW=3:MSG$="Directory of "+DIRPATH$
22340 MCOL=41-INT((LEN(MSG$)/2)):LOCATE ROW,MCOL:PRINT MSG$;
22345 ROW=25:MSG$=CHR$(24)+" and "+CHR$(25)+" to Move, PgUp & PgDn for More Files, ENTER to Select"
22350 MCOL=41-INT((LEN(MSG$)/2))
22355 LOCATE ROW,MCOL:PRINT MSG$;
22360 REM -----
22365 SRTROW=1:CURROW=1:OLDROW=CURROW
22370 MAXROW=19:IF NUMFIL<19 THEN MAXROW=NUMFIL
22375 REM ----- DISPLAY FILE NAMES
22380 FOR DISPROW=1 TO MAXROW
22385   LOCATE DISPROW+4,COL+2
22390   COLOR 7,0
22395   IF LEFT$(FILENAME$(DISPROW-1+SRTROW),4)=LEFT$(DIR1$,4) THEN COLOR 15,0
22400   IF LEFT$(FILENAME$(DISPROW-1+SRTROW),4)=LEFT$(DIR2$,4) THEN COLOR 15,0
22405   IF LEFT$(FILENAME$(DISPROW-1+SRTROW),1)="\" THEN COLOR 15,0
22410   PRINT FILENAME$(DISPROW-1+SRTROW);
22415 NEXT DISPROW
22420 REM ----- MOVE THROUGH FILE NAMES AND SELECT ONE
22425 LOCATE CURROW+4,COL+2,0:COLOR 0,7
22430 PRINT FILENAME$(CURROW-1+SRTROW);
22435 LOCATE CURROW+4,COL+2:COLOR 7,0
22440 REM -----
22445 IN$=INKEY$:IF IN$="" THEN 22445
22450 IF IN$=CHR$(13) THEN EXIT$="ENTER":ESCAPE=0::GOTO 22630
22455 IF IN$=CHR$(27) THEN EXIT$="ESC":ESCAPE=-1:FILE$="":GOTO 22740
22460 IF IN$=CHR$(0)+CHR$(72) THEN 22490:REM UP
22465 IF IN$=CHR$(0)+CHR$(80) THEN 22505:REM DOWN
22470 IF IN$=CHR$(0)+CHR$(73) THEN 22520:REM PAGE UP
22475 IF IN$=CHR$(0)+CHR$(81) THEN 22540:REM PAGE DOWN
22480 GOSUB 22570:GOTO 22445
22485 REM -----
22490 IF CURROW>1 THEN OLDROW=CURROW:CURROW=CURROW-1:GOTO 22580
22495 IF SRTROW>1 THEN SRTROW=SRTROW-1:GOTO 22380
22500 GOSUB 22570:GOTO 22445
22505 IF CURROW<MAXROW THEN OLDROW=CURROW:CURROW=CURROW+1:GOTO 22580
22510 IF NUMFIL>MAXROW AND SRTROW<=NUMFIL-19 THEN SRTROW=SRTROW+1:GOTO 22380
22515 GOSUB 22570:GOTO 22445
22520 IF SRTROW>18 THEN SRTROW=SRTROW-18:GOTO 22380
22525 IF SRTROW<>1 THEN SRTROW=1:GOTO 22380
22530 IF CURROW<>1 THEN CURROW=1:GOTO 22380
22535 GOSUB 22570:GOTO 22445
22540 IF SRTROW+18<=NUMFIL-19 THEN SRTROW=SRTROW+18:GOTO 22380
22545 IF SRTROW<=NUMFIL-19 THEN SRTROW=NUMFIL-18:GOTO 22380
22550 IF NUMFIL>MAXROW AND CURROW<>MAXROW THEN CURROW=MAXROW:GOTO 22380
22555 IF CURROW<>MAXROW THEN CURROW=MAXROW:GOTO 22380
22560 GOSUB 22570:GOTO 22445
22565 REM ----- BEEP ON ERROR
22570 RETURN
22575 REM ----- HIGHLIGHT NEW FILE
22580 LOCATE OLDROW+4,COL+2
22585 COLOR 7,0
22590 IF LEFT$(FILENAME$(OLDROW-1+SRTROW),4)=LEFT$(DIR1$,4) THEN COLOR 15,0
22595 IF LEFT$(FILENAME$(OLDROW-1+SRTROW),4)=LEFT$(DIR2$,4) THEN COLOR 15,0
22600 IF LEFT$(FILENAME$(OLDROW-1+SRTROW),1)="\" THEN COLOR 15,0
22605 PRINT FILENAME$(OLDROW-1+SRTROW);
22610 LOCATE CURROW+4,COL+2:COLOR 0,7
22615 PRINT FILENAME$(CURROW-1+SRTROW);
22620 GOTO 22445
22625 REM ----- SELECTION WAS MADE
22630 FILE$=FILENAME$(CURROW-1+SRTROW)
22635 REM ----- REMOVE TRAILING SPACES
22640 IF RIGHT$(FILE$,1)=" " THEN FILE$=LEFT$(FILE$,LEN(FILE$)-1):GOTO 22640
22645 REM ----- DIRECTORY CHANGES
22650 IF LEFT$(FILE$,1)<>"\" THEN 22670
22655 IF DIRPATH$="\" THEN DIRPATH$=FILE$+"\":GOTO 22665
22660 IF DIRPATH$<>"\" THEN DIRPATH$=DIRPATH$+FILE$+"\"
22665 ERASE FILENAME$:GOTO 22000
22670 IF FILE$<>DIR1$ THEN 22685
22675 DIRPATH$="\"
22680 ERASE FILENAME$:GOTO 22000
22685 IF FILE$<>DIR2$ THEN 22710
22690 DIRPATH$=LEFT$(DIRPATH$,LEN(DIRPATH$)-1)
22695 IF RIGHT$(DIRPATH$,1)<>"\" THEN 22690
22700 ERASE FILENAME$:GOTO 22000
22705 REM ----- SEPARATE FILE AND EXTENSION IF ALL FILES WERE SPECIFIED
22710 IF EXT$<>"*" THEN 22720
22715 EXT$="":IF LEN(FILE$)>8 THEN EXT$=MID$(FILE$,10,3)
22720 IF LEFT$(EXT$,1)=" " THEN EXT$=RIGHT$(EXT$,LEN(EXT$)-1):GOTO 22720
22725 FILE$=LEFT$(FILE$,9)
22730 IF RIGHT$(FILE$,1)=" " THEN FILE$=LEFT$(FILE$,LEN(FILE$)-1):GOTO 22730
22735 REM -----
22740 ERASE FILENAME$
22745 IF DIRPATH$<>"\" THEN DIRPATH$=DIRPATH$+"\"
22750 COLOR 7,0:RETURN
22755 REM
29905 REM ********************************************************************
29910 REM ---------------------- POINT AND SHOOT MENU ------------------------
29915 REM
29920 REM This subroutine allows you to set up a menu of up to 9 items, and
29925 REM select an item with the arrow keys and ENTER, or use the numbers
29930 REM 1-9 or function keys F1-F9. Displays a message at top. Item names
29935 REM must be in order and none may be skipped. The ROW and COL must
29940 REM allow all of the menu to be displayed on the screen.
29945 REM
29950 REM enter with ITEM$(1)="ITEM 1 message",(up to 76 chars.),ITEM$(2), etc.
29955 REM            (array must be DIMinsioned before using this routine)
29960 REM            MSG$="menu message or name", (up to 76 characters)
29965 REM            ROW, COL=upper left corner of menu
29970 REM exit with -ITEM = 1-9, item selected
29975 REM            ITEM$ = ITEM$(1)-ITEM$(9), depending on item selected
29980 REM            ESCAPE=-1 (TRUE) if ESCAPE key hit
29985 REM            (for compatibility with old versions)
29990 REM            EXIT$=key hit that exited routine-"ENTER" OR "ESC"
29995 REM
30000 KEY OFF:FOR A%=1 TO 10:KEY A%,"":NEXT A%
30005 NUMITEMS=0
30010 FOR A%=1 TO 9:IF ITEM$(A%)="" THEN 30020
30015 NUMITEMS=NUMITEMS+1:NEXT A%
30020 IF NUMITEMS+ROW+3>25 THEN ROW=25-3-NUMITEMS
30025 REM ------ find maximum length and pad the rest
30030 MAXLEN=LEN(MSG$)
30035 FOR MLOOP%=1 TO NUMITEMS
30040   IF LEN(ITEM$(MLOOP%))>MAXLEN THEN MAXLEN=LEN(ITEM$(MLOOP%))
30045 NEXT MLOOP%
30050 IF LEN(MSG$)<MAXLEN THEN MSG$=MSG$+SPACE$(MAXLEN-LEN(MSG$))
30055 FOR MLOOP%=1 TO NUMITEMS
30060   IF LEN(ITEM$(MLOOP%))<MAXLEN THEN ITEM$(MLOOP%)=ITEM$(MLOOP%)+SPACE$(MAXLEN-LEN(ITEM$(MLOOP%)))
30065 NEXT MLOOP%
30070 IF MAXLEN+COL+3>80 THEN COL=80-3-MAXLEN
30075 REM ------ display the menu
30080 LOCATE ,,0
30085 TP=196:BT=196:LS=195:RS=180:MS=179:MM=196:UL=218:LL=192:UR=191:LR=217:DN=194:RT=195
30090 IROW=ROW:ICOL=COL
30095 LOCATE IROW,ICOL:COLOR 7,0
30100 PRINT CHR$(UL)+STRING$(MAXLEN+2,TP)+CHR$(UR);
30105 LOCATE IROW+1,ICOL:PRINT CHR$(MS)+" ";
30110 COLOR 7,0:PRINT MSG$;
30115 COLOR 7,0:PRINT " "+CHR$(MS);
30120 LOCATE IROW+2,ICOL:COLOR 7,0
30125 PRINT CHR$(LS)+STRING$(MAXLEN+2,MM)+CHR$(RS);
30130 FOR PLOOP%=1 TO NUMITEMS
30135   LOCATE IROW+2+PLOOP%,ICOL
30140   PRINT CHR$(MS)+" "+ITEM$(PLOOP%)+" "+CHR$(MS);
30145 NEXT PLOOP%
30150 LOCATE IROW+3+NUMITEMS,ICOL
30155 PRINT CHR$(LL)+STRING$(MAXLEN+2,BT)+CHR$(LR);
30160 REM
30165 REM ------ move through the items and select one
30170 IROW=1
30175 OLDIROW=IROW:ICOL=COL+2
30180 LOCATE OLDIROW+ROW+2,ICOL:COLOR 7,0:PRINT ITEM$(OLDIROW);
30185 LOCATE IROW+ROW+2,ICOL:COLOR 0,7:PRINT ITEM$(IROW);
30190 IN$=INKEY$:IF IN$="" THEN 30190
30195 IF IN$=CHR$(27) THEN EXIT$="ESC":ESCAPE=-1:GOTO 30265
30200 IF IN$=CHR$(13) THEN EXIT$="ENTER":ESCAPE=0:GOTO 30265
30205 IF LEN(IN$)=1 THEN 30215
30210 V=ASC(RIGHT$(IN$,1))-58:GOTO 30220:REM FUNCTION KEY
30215 V=VAL(IN$)
30220 IF V>=1 AND V<=9 AND V<=NUMITEMS THEN OLDIROW=IROW:IROW=V:EXIT$="ENTER":GOTO 30265
30225 IF IN$=CHR$(0)+CHR$(72) THEN 30240:REM UP
30230 IF IN$=CHR$(0)+CHR$(80) THEN 30250:REM DOWN
30235 BEEP:GOTO 30190
30240 OLDIROW=IROW:IF IROW>1 THEN IROW=IROW-1:GOTO 30180
30245 IROW=NUMITEMS:GOTO 30180
30250 OLDIROW=IROW:IF IROW<NUMITEMS THEN IROW=IROW+1:GOTO 30180
30255 IROW=1:GOTO 30180
30260 REM ------ item was selected, so exit
30265 ITEM=IROW:ITEM$=ITEM$(IROW)
30270 LOCATE OLDIROW+ROW+2,ICOL:COLOR 7,0:PRINT ITEM$(OLDIROW);
30275 LOCATE IROW+ROW+2,ICOL:COLOR 15,0:PRINT ITEM$(IROW);
30280 REM
30285 FOR A%=1 TO 9:ITEM$(A%)="":NEXT A%
30290 COLOR 7,0
30295 RETURN
30300 REM --------------------------------------------------- END OF FILE
