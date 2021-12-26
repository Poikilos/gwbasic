10 REM DSNAME = MUSIC.BAS
20 REM This version completed on 6/20/82.  For comments and suggestions,
30 REM please contact Bruce Guthrie by mail at
40 REM   P.O. Box 710
50 REM   Washington, D.C. 20044
60 REM Copyright 1982 by Bruce Guthrie
70 DEF FNCT(I)=BEAT+1/L*(1+.5*ABS(DOTTED=1))
80 DIM WHOLE%(19),HALF%(19),QUARTER%(19),EIGHTH%(37),SIXTEENTH%(37)
90 DIM WREST%(4),QREST%(25),EREST%(19),SREST%(21)
100 DIM CURSOR%(19),DOT%(37),FORBID%(25),NULL%(19),TIED%(10)
110 DIM FLAT%(15),NATURAL%(16),SHARP%(15)
120 DIM TREBLE%(73),BASE%(39)
130 DIM ONE%(39),TWO%(39),THREE%(39),FOUR%(39),EIGHT%(39)
140 DIM P$(1000),P(1000),KEYS(7)
150 SCREEN 1:KEY OFF:FOR I=1 TO 10:KEY I,"":NEXT I
160 BEAT=0:CUREND=0:TIE=0:DOTTED=0:SHARP=0:FLAT=0:NATURAL=0:NOTE=2:REPEAT=-1:POINTER=0
170 CLS:PRINT TAB(10);"Music package":PRINT TAB(3);"(c) Bruce Guthrie June, 1982"
180 INPUT "Need instructions [Y/N]? ",A$:IF A$="n" OR A$="N" THEN 220:ELSE IF A$<>"y" AND A$<>"Y" THEN 180
190 OPEN "music.DAT" FOR INPUT AS #1:I=0
200 I=I+1:IF EOF(1) THEN 220
210 INPUT #1,A$:PRINT A$:IF I<22 THEN 200:ELSE I=0:INPUT "Press RETURN? ",A$:GOTO 200
220 GOSUB 1350  'read in PUT definitions for notes
230 PLAY "MB":CLS:INPUT "Is composition saved already [Y/N]? ",A$:IF A$<>"Y" AND A$<>"y" AND A$<>"N" AND A$<>"n" THEN 230:ELSE IF A$="Y" OR A$="y" THEN GOTO 1190:ELSE CLS:P$(0)="T120":P(0)=-1
240 GOSUB 2020:NOTE=12 'draw clefs
250 GOSUB 890        'set key
260 GOSUB 830        'set bar measure
270 GOSUB 300        'enter notes
280 NEWPAGE=0:GOSUB 2050:IF NEWPAGE=1 THEN GOTO 270:ELSE GOSUB 320:GOTO 280
290 'INPUT NOTE****************************************************************
300 GOSUB 1910:PRINT"Enter note: sharp(+),flat(-),nat(N),":PRINT "rest(P), 1,2,4,8,S(16th)":PRINT"change key(K),measure(M),tempo(T)"
310 LOCATE 20,1:PRINT "'1 play, '3 save, '2 tie notes":PRINT ". (dotted note)":' print "[ (begin) and ] (end) repeat"
320 LOCATE 4,1:PRINT "Use cursor controls to position note. ":GOSUB 1890:PAUSE=0
330 X$=INKEY$:IF X$="" THEN 330:ELSE IF LEN(X$)=1 THEN 390:ELSE X=ASC(MID$(X$,2))
340 IF X=59 THEN GOSUB 1890:BEAT=0:GOSUB 1920:GOSUB 1020:GOTO 300 'SF 1 (play song)
350 IF X=60 THEN GOSUB 1950:IF TIE=1 THEN TIE=0:GOSUB 1950:GOTO 330:ELSE TIE=1:GOSUB 1950:GOTO 330 'SF 2 (tie notes)
360 IF X=61 THEN GOSUB 1150:GOSUB 1940:NEWPAGE=1:GOTO 300 'SF 3 (save it)
370 IF X=72 THEN GOSUB 1890:GOSUB 1950:NOTE=NOTE-1:IF NOTE=0 THEN NOTE=25:GOSUB 1890:GOSUB 1950:GOTO 330:ELSE GOSUB 1890:GOSUB 1950:GOTO 330 'cursor up
380 IF X=80 THEN GOSUB 1890:GOSUB 1950:NOTE=NOTE+1:IF NOTE=26 THEN NOTE=1:GOSUB 1890:GOSUB 1950:GOTO 330:ELSE GOSUB 1890:GOSUB 1950:GOTO 330 'cursor down
390 A1$=X$:IF A1$="#" THEN A1$="+":ELSE IF A1$>="a" AND A1$<="z" THEN A1$=CHR$(ASC(A1$)-32)
400 ON INSTR("+-.1248KMNSPT[]",A1$)+1 GOTO 330,520,520,410,440,440,440,440,460,470,520,450,420,500,480,490
410 GOSUB 1950:IF DOTTED=1 THEN DOTTED=0:GOSUB 1950:GOTO 330:ELSE DOTTED=1:GOSUB 1950:GOTO 330  'dotted note
420 GOSUB 1920:PRINT "Enter length for this rest? ";:PAUSE=1
430 A1$=INKEY$:IF LEN(A1$)<>1 THEN 430:ELSE ON INSTR("1248Ss",A1$)+1 GOTO 430,440,440,440,440,450,450
440 L=VAL(A1$):A1$="0":GOTO 580
450 L=16:A1$="0":GOTO 580
460 C=0:GOSUB 1890:GOSUB 890:GOTO 300 'change key
470 C=0:GOSUB 1890:GOSUB 830:GOTO 300 'change bar measure
480 'BEGIN REPEAT
490 'END REPEAT
500 GOSUB 1920:INPUT "New tempo [32<=x<=255]? ",TEMPO:IF TEMPO<32 OR TEMPO>255 THEN 500
510 GOSUB 1890:GOSUB 1920:P1$="T"+MID$(STR$(TEMPO+1000),3):INPUT "Play all with this [Y/N]? ",A$:IF A$="Y" THEN P$(0)=P1$:GOTO 300:ELSE IF A$="N" THEN POINTER=CUREND:GOSUB 780:GOTO 300:ELSE GOTO 510
520 IF A1$="+" AND FORBID%(NOTE)=1 THEN BEEP:GOTO 330:ELSE IF A1$="-" AND FORBID%(NOTE)=2 THEN BEEP:GOTO 330    'checking on flats and sharps
530 GOSUB 1950:IF A1$="+" THEN IF SHARP=1 THEN SHARP=0:GOSUB 1950:GOTO 330:ELSE SHARP=1:FLAT=0:NATURAL=0:GOSUB 1950:GOTO 330  'sharp
540 IF A1$="-" THEN IF FLAT=1 THEN FLAT=0:GOSUB 1950:GOTO 330:ELSE FLAT=1:SHARP=0:NATURAL=0:GOSUB 1950:GOTO 330              'flat
550 IF FLAT=1 THEN NATURAL=0:GOSUB 1950:GOTO 330:ELSE NATURAL=1:FLAT=0:SHARP=0:GOSUB 1950:GOTO 330                           'natural
560 GOSUB 1920:INPUT "Enter length for this note/rest? ",L:IF L=0 THEN GOSUB 1890:GOTO 320
570 'DRAW NOTE*****************************************************************
580 GOSUB 1890:IF FNCT(I)>TOP/BOTTOM THEN GOSUB 1920:PRINT "Note of this length doesn't fit in bar":BEEP:GOSUB 1930:GOTO 320:ELSE GOSUB 590:GOTO 720
590 IF PAUSE=0 THEN ON L GOTO 660,670,590,680,590,590,590,690,590,590,590,590,590,590,590,700
600 ON L GOTO 610,620,600,630,600,600,600,640,600,600,600,600,600,600,600,650   'REST NOTES
610 PUT(WHERE-4,61),WREST%,OR:RETURN
620 PUT(WHERE-4,67),WREST%,OR:RETURN
630 PUT(WHERE-4,60),QREST%,OR:RETURN
640 PUT(WHERE-4,60),EREST%,OR:RETURN
650 PUT(WHERE-4,60),SREST%,OR:RETURN
660 PUT (WHERE-4,NOTE*5+38),NULL%,PSET:PUT (WHERE-4,NOTE*5+38),NULL%,XOR:PUT(WHERE-4,NOTE*5+25),WHOLE%,OR:RETURN
670 PUT (WHERE-4,NOTE*5+38),NULL%,PSET:PUT (WHERE-4,NOTE*5+38),NULL%,XOR:PUT(WHERE-4,NOTE*5+25),HALF%,OR:RETURN
680 PUT (WHERE-4,NOTE*5+25),QUARTER%,OR:RETURN
690 PUT (WHERE-4,NOTE*5+25),EIGHTH%,OR:RETURN
700 PUT (WHERE-4,NOTE*5+25),SIXTEENTH%,OR:RETURN
710 'FIGURE OUT WHAT TO PLAY***************************************************
720 IF PAUSE=1 THEN P1$="O3P ":GOTO 740:ELSE P2$=MID$("GFEDCBAGFEDCBAGFEDCBAGFEDCBA",NOTE,1):P1$=P2$:IF NOTE<6 THEN P1$="O4"+P1$:ELSE IF NOTE<13 THEN P1$="O3"+P1$:ELSE IF NOTE<20 THEN P1$="O2"+P1$:ELSE P1$="O1"+P1$
730 IF FLAT=1 THEN P1$=P1$+"-":ELSE IF SHARP=1 THEN P1$=P1$+"+":ELSE IF NATURAL=1 THEN P1$=P1$+" ":ELSE P1$=P1$+MID$("- +",KEYS(ASC(P2$)-64)+2,1)
740 IF TIE=1 THEN P1$="ML"+P1$:ELSE P1$="MN"+P1$
750 P1$=P1$+MID$(STR$(100+L),3):IF DOTTED=1 THEN P1$=P1$+".":ELSE P1$=P1$+" "
760 ON ERROR GOTO 820:PLAY P1$:ON ERROR GOTO 0
770 'INSERT NOTE AFTER POINTER*************************************************
780 N1=P(POINTER):CUREND=CUREND+1:P(POINTER)=CUREND:POINTER=P(POINTER):P$(POINTER)=P1$:P(POINTER)=N1:RETURN
790 'DELETE NOTE AFTER POINTER*************************************************
800 P$(P(POINTER))="":P(POINTER)=P(P(POINTER)):RETURN
810 'ERROR*********************************************************************
820 GOSUB 1920:PRINT "Sorry.  That note's incorrect.":RESUME 300
830 'SET TEMPO****************************************************************
840 GOSUB 1910:INPUT "Bar measure, e.g. 4/4? ",A$
850 X=INSTR(A$,"/"):IF X=0 THEN PRINT "No division symbol [/].  Re-enter.":GOTO 840:ELSE IF X=1 OR LEN(A$)=X THEN 840
860 TOP=VAL(MID$(A$,1,X-1)):BOTTOM=VAL(MID$(A$,X+1)):IF MID$("XXXX   X",BOTTOM,1)+MID$("XXXX   X",TOP,1)<>"XX" THEN PRINT "Illegal numbers.  Re-enter.":GOTO 830
870 P1$="B"+RIGHT$(STR$(TOP),2)+"/"+RIGHT$(STR$(BOTTOM),2):POINTER=CUREND:GOSUB 780:GOTO 2120
880 'SET KEY******************************************************************
890 GOSUB 1910:PRINT "Use cursor controls [up/down] and +/-":PRINT "keys to position/set flats and sharps.":PRINT "Use CR to stop.  Do top clef only."
900 FOR I=1 TO 7:KEYS(I)=0:NEXT I:NOTE=2
910 GOSUB 1900
920 X$=INKEY$:IF X$="" THEN 920
930 IF X$="+" OR X$="#" THEN IF FORBID%(NOTE)=1 THEN BEEP:GOTO 920:ELSE I=1:GOSUB 1000:PUT(WHERE+4,NOTE*5+32),SHARP%,XOR:GOTO 920
940 IF X$="-" THEN IF FORBID%(NOTE)=2 THEN BEEP:GOTO 920:ELSE I=-1:GOSUB 1000:PUT(WHERE+4,NOTE*5+32),FLAT%,XOR:GOTO 920
950 IF ASC(X$)=13 THEN P1$="K":FOR I=0 TO 7:P1$=P1$+STR$(KEYS(I)):NEXT I:POINTER=CUREND:GOSUB 780:GOSUB 1900:GOSUB 2080:WHERE=WHERE+4:NOTE=12:RETURN  'carriage return
960 IF LEN(X$)<2 THEN 920:ELSE X=ASC(MID$(X$,2))
970 IF X=72 THEN GOSUB 1900:NOTE=NOTE-1:IF NOTE=0 THEN NOTE=7:GOSUB 1900:ELSE GOSUB 1900
980 IF X=80 THEN GOSUB 1900:NOTE=NOTE+1:IF NOTE=8 THEN NOTE=1:GOSUB 1900:ELSE GOSUB 1900
990 GOTO 920
1000 IF KEYS(8-NOTE)=I THEN KEYS(0)=KEYS(0)-1:KEYS(8-NOTE)=0:RETURN:ELSE IF KEYS(8-NOTE)=-I THEN KEYS(8-NOTE)=I:RETURN:ELSE KEYS(8-NOTE)=I:KEYS(0)=KEYS(0)+1:RETURN
1010 'PLAY IT WHILE DRAWING IT*************************************************
1020 GOSUB 2020:E=0:WHILE E>-1:A$=P$(E):A1$=MID$(A$,1,1)
1030 IF A1$="T" THEN PLAY A$:GOTO 1130
1040 IF A1$="B" THEN TOP=VAL(MID$(A$,2,2)):BOTTOM=VAL(MID$(A$,5,2)):GOSUB 2120:GOTO 1130
1050 IF A1$="K" THEN FOR I=0 TO 7:KEYS(I)=VAL(MID$(A$,I*2+2,2)):NEXT I:GOSUB 2080:GOTO 1130
1060 IF A1$="R" THEN  'repeats
1070 IF MID$(A$,1,2)="ML" THEN TIE=1:ELSE TIE=0
1080 L=VAL(MID$(A$,7,2)):A1$=MID$(A$,5,1):IF A1$="P" THEN PAUSE=1:GOTO 1110
1090 PAUSE=0:NOTE=(4-VAL(MID$(A$,4,1)))*7-2+INSTR("BAGFEDC",A1$):T1$=MID$(A$,6,1):IF T1$="+" THEN SHARP=1:ELSE IF T1$="-" THEN FLAT=1
1100 IF MID$(A$,9,1)="." THEN DOTTED=1
1110 WHERE=WHERE+(SHARP+FLAT+NATURAL)*4:GOSUB 1950:GOSUB 590
1120 PLAY A$:GOSUB 2050
1130 E=P(E):WEND:RETURN
1140 'SAVE IT******************************************************************
1150 CLS:I1=0:ON ERROR GOTO 1280:INPUT "Name of composition? ",N$:PRINT "Name of file to save as":GOSUB 1240:IF A$="Q" THEN 1940
1160 OPEN FI$ FOR OUTPUT AS #1:WRITE #1,DATE$,N$,CUREND
1170 FOR I=0 TO CUREND:WRITE#1,P(I),P$(I):NEXT I:CLOSE #1:PRINT "Saved!!":BEEP:GOSUB 1930:ON ERROR GOTO 0:RETURN
1180 'LOAD IT******************************************************************
1190 CLS:I1=1:ON ERROR GOTO 1280:PRINT "Name of file to load composition from?":GOSUB 1240:IF A$="Q" THEN 230
1200 OPEN FI$ FOR INPUT AS #1:INPUT #1,A$,N$,CUREND
1210 FOR I=0 TO CUREND:INPUT#1,P(I),P$(I):NEXT I:CLOSE #1
1220 PRINT "The name of this composition is:":PRINT N$:PRINT "File was last saved on ";A$:GOSUB 1930
1230 PRINT "Loaded!":BEEP:GOSUB 1930:ON ERROR GOTO 0:GOSUB 1020:GOTO 270
1240 INPUT "(DEF ext=MUS)? ",FI$:IF INSTR(FI$,".") = 0 THEN FI$=FI$+".MUS"
1241 IF FI$=".MUS" THEN PRINT "Expecting file name.":PRINT "File name ";:GOTO 1240
1250 IF INSTR(FI$,":")=0 THEN INPUT "Device A or B? ",A$:IF LEN(A$)<>1 THEN 1250:ELSE FI$=A$+":"+FI$
1260 INPUT "Insert disk.  Press RETURN (Q=quit)? ",A$:IF A$="Q" THEN ON ERROR GOTO 0:RETURN:ELSE RETURN
1270 'ERROR-TRAPPING ROUTINE***************************************************
1280 IF ERR=53 THEN PRINT "File of this name is not on disk.":PRINT "Try another disk or give up.":GOTO 1330
1290 IF ERR=61 THEN PRINT "Ran out of room on the disk for this":PRINT "file.  Try another disk or give up.":GOTO 1330
1300 IF ERR=62 THEN PRINT "Hmm.  It says we're out of data.":PRINT "Perhaps your file was created by an":PRINT "earlier version of this routine.":PRINT "Skip loading it here.":GOTO 1330
1310 IF ERR=64 THEN PRINT "What the hell was that name you input?":PRINT "It didn't go over at all!":PRINT "Try again or give up.":GOTO 1330
1320 ON ERROR GOTO 0:RESUME
1330 GOSUB 1930:IF I1=1 THEN RESUME 1190:ELSE RESUME 1150
1340 'READ NOTE VALUES*********************************************************
1350 PRINT:PRINT "Reading note character definitions..."
1360 DATA 16,05,-241,-193,-193,-193,-1009
1370 FOR I=0 TO 6:READ NULL%(I):NEXT I 'USED AS PUT(X,Y),NULL%,PRESET TO CLEAR OUT FOR WHOLE% AND HALF%
1380 DATA 3,2,1,3,2,1,3,3,2,1,3,2,1,3,3,2,1,3,2,1,3,3,2,1,3
1390 FOR I=1 TO 25:READ FORBID%(I):NEXT I
1400 DATA 16,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-193,-193,-193,0
1410 FOR I=0 TO 19:READ CURSOR%(I):NEXT I
1420 DATA 16,18,0,0,0,0,0,0,0,0,0,0,0,0,0,-241,816,816,816,-1009
1430 FOR I=0 TO 19:READ WHOLE%(I):NEXT I
1440 DATA 16,18,768,768,768,768,768,768,768,768,768,768,768,768,768,-241,816,816,816,-1009
1450 FOR I=0 TO 19:READ HALF%(I):NEXT I
1460 DATA 16,18,768,768,768,768,768,768,768,768,768,768,768,768,768,-241,-193,-193,-193,-1009
1470 FOR I=0 TO 19:READ QUARTER%(I):NEXT I
1480 DATA 32,18,768,192,768,48,768,12,768,3,768,-16384,768,-16384,768,-16384,768,-16384,768,-16384,768,0,768,0,768,0,768,0,-241,0,-193,0,-193,0,-193,0,-1009,0
1490 FOR I=0 TO 37:READ EIGHTH%(I):NEXT I
1500 DATA 32,18,768,192,768,48,768,12,768,3,768,-16192,768,-16336,768,-16372,768,-16381,768,-16384,768,-16384,768,-16384,768,-16384,768,-16384,-241,0,-193,0,-193,0,-193,0,-1009,0
1510 FOR I=0 TO 37:READ SIXTEENTH%(I):NEXT I
1520 DATA 32,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,60,0,0,0,0
1530 FOR I=0 TO 37:READ DOT%(I):NEXT I
1540 DATA 16,3,-961,-961,-961
1550 FOR I=0 TO 4:READ WREST%(I):NEXT I
1560 DATA 18,16,0,0,192,-4096,0,60,-4096,768,192,15,3840,0,-16381,0,240,-1021,3840,0,60,15360,0,12,0,0
1570 FOR I=0 TO 25:READ QREST%(I):NEXT I
1580 DATA 18,12,0,0,0,3072,15360,48,12348,3840,192,-16384,768,0,3,3072,0,12,0,0
1590 FOR I=0 TO 19:READ EREST%(I):NEXT I
1600 DATA 22,13,0,0,-16384,-15613,768,195,-1024,15360,12,12348,3840,240,-16384,0,192,3,768,0,0,0
1610 FOR I=0 TO 21:READ SREST%(I):NEXT I
1620 DATA 12,14,0,-16384,-4084,-4081,-16321,-16324,-16372,-16372,-4084,-4081,-16321,-16324,12,0
1630 FOR I=0 TO 15:READ SHARP%(I):NEXT I
1640 DATA 14,14,0,48,48,48,48,48,-16333,12348,12336,-16336,51,60,48,0
1650 FOR I=0 TO 15:READ FLAT%(I):NEXT I
1660 DATA 12,15,0,0,48,48,63,63,51,51,51,63,63,3,3,0,0
1670 FOR I=0 TO 16:READ NATURAL%(I):NEXT I
1680 DATA 30,36,0,0,0,0,768,192,3840,240,15360,60,15360,60,15360,60,15360,240,3840,192
1690 DATA 3840,0,16128,0,-256,0,-3325,0,-15613,0,-15601,0,831,0,828,0,828,192,60,192
1700 DATA 60,192,3900,255,15420,-16177,12303,-16189,15,-16189,15,-16189,-16381,207,-4093,252,-256,240,0,48
1710 DATA 0,48,0,48,-1024,48,-1024,48,-256,192,0,0,0,0
1720 FOR I=0 TO 73:READ TREBLE%(I):NEXT I
1730 DATA 30,19,0,0,0,0,-253,192,783,-3856,12,-3844,-16369,60,-16369,60,-16369,-4036,0,-4036
1740 DATA 0,240,0,240,768,192,3840,0,15360,0,-4096,0,-16381,0,15,0,12,0,0,0
1750 FOR I=0 TO 39:READ BASE%(I):NEXT I
1760 DATA 48,3,240,0,-4096,63,0,-16369,-253,-1,252
1770 FOR I=0 TO 10:READ TIED%(I):NEXT I
1780 DATA 26,19,-4093,0,-1009,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-1024,0,-241,192,-241,192
1790 FOR I=0 TO 39:READ ONE%(I):NEXT I
1800 DATA 26,19,-241,0,-193,192,828,192,828,192,768,192,768,192,3840,0,15360,0,-4096,0,-16381,0,15,0,60,0,60,0,60,0,60,0,60,0,828,192,-193,192,-193,192
1810 FOR I=0 TO 39:READ TWO%(I):NEXT I
1820 DATA 26,19,-1009,0,-193,0,3900,0,3840,0,3840,0,3840,0,3840,0,3840,0,-1009,0,-1009,0,3840,0,3840,0,3840,0,3840,0,3840,0,3840,0,3900,0,-193,0,-1009,0
1830 FOR I=0 TO 39:READ THREE%(I):NEXT I
1840 DATA 26,19,16128,0,-256,0,-256,0,-12541,0,-12541,0,3855,0,3855,0,3900,0,3900,0,-1,192,-1,192,3840,0,3840,0,3840,0,3840,0,3840,0,3840,0,3840,0,3840,0
1850 FOR I=0 TO 39:READ FOUR%(I):NEXT I
1860 DATA 26,19,-253,0,-253,0,783,192,783,192,783,192,783,192,783,192,783,192,-253,0,-253,0,783,192,783,192,783,192,783,192,783,192,783,192,783,192,-241,192,-253,0
1870 FOR I=0 TO 39:READ EIGHT%(I):NEXT I
1880 RETURN
1890 PUT(WHERE-4,NOTE*5+25),CURSOR%,XOR:RETURN   'draw cursor for notes
1900 PUT(WHERE+1,NOTE*5+25),CURSOR%,XOR:RETURN   'draw cursor for keys
1910 LOCATE 1,1:PRINT SPACE$(160):LOCATE 1,1:RETURN    'clear top 4 lines
1920 LOCATE 4,1:PRINT SPACE$(39):LOCATE 4,1:RETURN     'clear line 4
1930 FOR I=1 TO 1000:NEXT I:RETURN                     'time waster
1940 GOSUB 2020:GOSUB 2080:GOSUB 2120:RETURN           'draws in screen
1950 IF TIE=1 THEN PUT(WHERE-5,NOTE*5+47),TIED%        'draws ties if needed
1960 IF DOTTED=1 THEN PUT(WHERE-4,NOTE*5+25),DOT%  'draws dotted notes if needed
1970 IF SHARP=1 THEN PUT(WHERE-8,NOTE*5+32),SHARP%     'draws sharps
1980 IF FLAT=1 THEN PUT(WHERE-8,NOTE*5+32),FLAT%       'draws flats
1990 IF NATURAL=1 THEN PUT(WHERE-8,NOTE*5+32),NATURAL% 'draws naturals
2000 RETURN
2010 'DRAW CLEFS***************************************************************
2020 CLS:FOR I=50 TO 150 STEP 10:IF I<>100 THEN LINE(0,I)-STEP(319,0),2
2030 NEXT I:LINE (0,50)-(0,150):PUT(0,50),TREBLE%,OR:PUT(0,115),BASE%,OR:WHERE=10:RETURN
2040 'ADDS BARS, REDRAWS AS NECESSARY******************************************
2050 BEAT=FNCT(L):IF BEAT>=TOP/BOTTOM THEN LINE(WHERE+10,50)-STEP(0,100):BEAT=0
2060 WHERE=WHERE+14+DOTTED*4:TIE=0:DOTTED=0:SHARP=0:NATURAL=0:FLAT=0:IF WHERE>305 THEN GOSUB 1940:NEWPAGE=1:RETURN:ELSE RETURN
2070 'DRAW EXISTING KEY STRUCTURE**********************************************
2080 IF KEYS(0)=0 THEN RETURN
2090 FOR I=1 TO 7:IF KEYS(8-I)=1 THEN FOR N1=I TO 25 STEP 7:PUT(WHERE+4,N1*5+32),SHARP%,OR:NEXT N1:ELSE IF KEYS(8-I)=-1 THEN FOR N1=I TO 25 STEP 7:PUT(WHERE+4,N1*5+32),FLAT%,OR:NEXT N1
2100 NEXT I:WHERE=WHERE+10:RETURN
2110 'DRAW MEASURES************************************************************
2120 I1=0:ON TOP GOSUB 2130,2140,2150,2160,2160,2160,2160,2170:I1=20:ON BOTTOM GOSUB 2130,2140,2150,2160,2160,2160,2160,2170:WHERE=WHERE+20:RETURN
2130 FOR I=50+I1 TO 110+I1 STEP 60:PUT(WHERE+4,I),ONE%,OR:NEXT I:RETURN
2140 FOR I=50+I1 TO 110+I1 STEP 60:PUT(WHERE+4,I),TWO%,OR:NEXT I:RETURN
2150 FOR I=50+I1 TO 110+I1 STEP 60:PUT(WHERE+4,I),THREE%,OR:NEXT I:RETURN
2160 FOR I=50+I1 TO 110+I1 STEP 60:PUT(WHERE+4,I),FOUR%,OR:NEXT I:RETURN
2170 FOR I=50+I1 TO 110+I1 STEP 60:PUT(WHERE+4,I),EIGHT%,OR:NEXT I:RETURN
