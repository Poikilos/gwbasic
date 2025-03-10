10 ' Lister, to list BASIC program saved in ,A format.
20 ON ERROR GOTO 0:CLS:KEY OFF          ' Listdisk.Bas - Febr. 17, 2003
30 ' Announce us
40 COLOR 14,0
50 PRINT " ��������������������������������������������������������"
60 PRINT "�                                                        �"
70 PRINT "� A Lister for GwBasic programs:  saved in ASCII format. �"
80 PRINT "� File is listed to screen and saved as a txt disk-file. �"
90 PRINT "� Edit and print the file with your super wordprocessor. �"
100 PRINT "�                                                        �"
110 PRINT " �������������������������������������������������������� "
120 PRINT:COLOR 13,0
130 PRINT "��������������������������������������������ͻ"
140 PRINT "� Left  Margin is fixed at 1                 �"
150 PRINT "� Right Margin is set   at 94 ( 80 .. 132 )  �"
160 PRINT "� Enter filename: extension .bas is optional �"
170 PRINT "��������������������������������������������ͼ"
180 PRINT:COLOR 12,0
190 PRINT "������������������������������Ŀ"
200 PRINT "� Press any key to continue... �"
210 PRINT "��������������������������������"
220 IF INKEY$="" THEN 220
230 SCREEN 0,0,0:CLS:DEFINT A-Z
240 DIM PREFER$(20):TODAY$=DATE$:COLOR 7,0
250 ' Set initial parameters.
260 LMGN=1:RMGN=94:BMGN=5:LNSPA=1:PGLEN=66
270 FLNM$="":HEADER$="":INDENT$=SPACE$(8)
280 ' Define F-keys.
290 KEY 1,"Preview"+CHR$(13)
300 KEY 2,"Rt margin at :"
310 KEY 3,"Files"+CHR$(13)
320 KEY 4,"Exit"+CHR$(13)
330 KEY 5,"Single spaced"+CHR$(13)
340 KEY 6,"Double spaced"+CHR$(13)
350 KEY 7,"P'gram name: "
360 KEY 8,"Header: "
370 KEY 9,"Review"+CHR$(13)
380 KEY 10," Begin"
390 KEY ON:LOCATE 23,1
400 ' Call attention to F-keys.
410 ARROW$=STRING$(20,"-"):COLOR 11,0
420 PRINT ARROW$;
430 PRINT " Use F-keys to set the listing format ";:COLOR 11,0:PRINT ARROW$
440 RESTORE:FOR I=0 TO 9:READ FKEY$(I):NEXT
450 DATA Pr,Rt,Fi,Ex,Si,Do,P',He,Re," B"
460 ' Set up list of preferred breakpoints. 0 to 13 Sites.
470 FOR IP=0 TO 20:READ Z$:PREFER$(IP)=Z$:NEXT IP:IP=IP-1
480 DATA " ELSE ", " THEN ", ": ", " PRINT "    : ' 0  1  2  3
490 DATA " IF ", "  '", " OR ", " AND ",  ";"   : ' 4  5  6  7  8
500 DATA "=", " ", "+", "*", ","                : ' 9  10 11 12 13
510 DATA "", "", "", "", "", "", ""             : ' 14 15 16 17 18 19 20
520 ' Init filename
530 Z$="P'gram name: ListDisk":GOTO 710
540 ' Loop for adjusting runtime parameters.
550 LINE INPUT Z$
560 FOR I=0 TO 9:IF LEFT$(Z$,2)=FKEY$(I) THEN 580
570 NEXT:GOTO 550
580 ON I+1 GOTO 600,610,640,850,680,690,710,660,870,970
590 ' Preview, Right margin-setting routine, list files
600 COLOR 12,0:PRINT"Press <Esc> to exit screen listing":COLOR 11,0:SW=0:GOTO 980
610 GOSUB 1610:RMGN=NUMBA
620 IF RMGN <80 OR RMGN>132 THEN BEEP:PRINT "Use only a value from 80 to 132...":RMGN=94
630 PRINT:GOTO 550
640 PRINT:FILES "*.bas":GOTO 550
650 ' Establish page header.
660 HEADER$=MID$(Z$,9):GOTO 550
670 ' Single- or double-space output.
680 LNSPA=1:GOTO 550
690 LNSPA=2:GOTO 550
700 ' Get name of program to be listed.
710 FLNM$=MID$(Z$,13)
720 IF LEFT$(FLNM$,1)=" " THEN FLNM$=MID$(FLNM$,2):GOTO 720
730 ET=LEN(FLNM$):FLNM2$="":EC$=""
740 FOR I=1 TO ET
750   EC$=MID$(FLNM$,I,1):IF EC$="." THEN 800
760   FLNM2$=FLNM2$+EC$
770 NEXT I
780 ' Save filename as a txt file
790 FLNM$= FLNM2$ + ".bas"
800 FLNM2$=FLNM2$ + ".txt"
810 ' If there's no header yet, fake it with the file name.
820 IF HEADER$="" THEN HEADER$=CHR$(34)+FLNM$+CHR$(34)
830 GOTO 550
840 ' Exit Lister
850 FLNM$="Listdisk.bas":CLS:GOTO 1670
860 ' Display the current parameters.
870 PRINT:PRINT"Left  margin at";LMGN
880 PRINT "Right margin at";RMGN:PRINT
890 IF LNSPA=2 THEN PRINT "Double"; ELSE PRINT "Single";
900 PRINT " line spacing"
910 PRINT "Program name: ";: IF FLNM$="" THEN GOSUB 1650 ELSE PRINT FLNM$
920 PRINT "Header: ";: IF HEADER$="" THEN GOSUB 1650 ELSE PRINT HEADER$
930 PRINT
940 GOTO 550
950 ' Check parameters before actually trying to list the program.
960 ' List to screen or disk
970 SW=1
980 LNLEN=RMGN-LMGN+1
990 ' Open the disk file, complain if not possible to do it.
1000 ON ERROR GOTO 1570
1010 OPEN FLNM$ FOR INPUT AS #1
1020 IF SW=1 THEN OPEN "O",#2,FLNM2$
1030 ON ERROR GOTO 0
1040 ' Title the first page with the header and -if available- the date.
1050 PRINT
1060 PRINT    TAB(LMGN); HEADER$;:PRINT    ", listed "; TODAY$
1070 IF SW=1 THEN 1080 ELSE 1090
1080 PRINT #2,TAB(LMGN); HEADER$;:PRINT #2,", listed "; TODAY$
1090 PRINT:IF SW=1 THEN PRINT #2,""
1100 ' Get the next BASIC line, quit if end of file.
1110 PGNUM=1:LNCNT=3
1120 IF EOF(1) THEN CLOSE:GOTO 550
1130 LINE INPUT #1, DISK$:IF DISK$="" THEN 1130
1140 ' Right-justify the line number.
1150 DISK$=SPACE$(6-INSTR(DISK$," "))+DISK$
1160 ' CMNTSW governs the blank line ahead of comment lines.
1170 IF MID$(DISK$,7,1)<>"'" THEN CMNTSW=0
1180 ' Break the BASIC line into printer lines.
1190 FOR J=0 TO 9
1200   IF CMNTSW=0 AND MID$(DISK$,7,1)="'" THEN LN$(J)="":J=J+1:CMNTSW=1
1210 ' It's easy if the whole line fits at once.
1220   IF LEN(DISK$)<=LNLEN THEN LN$(J)=DISK$:GOTO 1390
1230 ' Else, check for preferred breakpoints.
1240   FOR K=0 TO IP
1250     SITE=0:K$=PREFER$(K)
1260     HISITE=SITE: IF SITE<13 THEN SITE=13  ' 13 was 9 before
1270     SITE=INSTR(SITE+1,DISK$,K$)
1280     IF SITE>0 AND SITE<=LNLEN THEN 1260
1290     IF HISITE=0 THEN 1300 ELSE 1310
1300   NEXT K
1310   IF HISITE=0 THEN HISITE=LNLEN
1320 ' HISITE now points to the rightmost, best breakpoint.
1330 ' Split the line there and indent all but the first one.
1340   LN$(J)=LEFT$(DISK$,HISITE)
1350   DISK$=MID$(DISK$,HISITE+1)
1360   DISK$=INDENT$+DISK$
1370 NEXT J
1380 ' If the first BASIC line is a comment, then skip blank line
1390 IF CMNTSW=1 AND LNCNT=3 THEN Z=1 ELSE Z=0
1400 IF Z=1 AND J=0 THEN Z=0
1410 ' Everything is guaranteed to fit. Print it all.
1420 FOR L=Z TO J
1430   LNCNT=LNCNT+1
1440   PRINT    TAB(LMGN); LN$(L):IF SW=1 THEN PRINT #2,TAB(LMGN); LN$(L)
1450   IF LNSPA=2 THEN LNCNT=LNCNT+1:PRINT:IF SW=1 THEN PRINT #2,""
1460 NEXT L
1470 ' Pressing <Esc> exits screen list
1480 IF SW=1 THEN 1120
1490 W$=INKEY$:IF W$="" THEN 1490
1500 IF W$=CHR$(27) THEN CLOSE:PRINT:SW=0:GOTO 550
1510 ' Cycle again
1520 GOTO 1120
1530 ' The operator-alert for an off-line printer
1540 PRINT:BEEP:PRINT "The line printer isn't ready. Check it...":PRINT
1550 PRINT:GOTO 1580
1560 ' The operator-alert for a lack of disk data:
1570 CLOSE:PRINT:BEEP:PRINT "The file ";FLNM$; " can not be found..."
1580 PRINT "Press any key to restart..."
1590 IF INKEY$="" THEN 1590 ELSE RUN
1600 ' Subroutine to decode a numeric parameter input.
1610 NUMBA=VAL (MID$(Z$,15))
1620 IF NUMBA=0 THEN BEEP:PRINT "<< Number required >>"
1630 RETURN
1640 ' Subroutine to note the lack of a file or a header.
1650 COLOR 0,11:PRINT " None specified  ";:COLOR 11,0:PRINT :RETURN
1660 ' Orderly exit. Reset the printer & F-keys, then exit.
1670 PRINT:BEEP:CLOSE:KEY OFF:COLOR 7,0
1680 KEY 1,"LIST ":KEY 2,"RUN"+CHR$(13):KEY 3,"LOAD"+CHR$(34):KEY 4,"SAVE"+CHR$(34):KEY 5,FLNM$:KEY 6,CHR$(34)+",a"
1690 KEY 7,"TRON"+CHR$(13):KEY 8,"TROFF"+CHR$(13):KEY 9,"KEY ":KEY 10,"SCREEN 0,0,0"+CHR$(13)
1700 KEY ON:KEY LIST:PRINT:END
1710 ' Program by Paul F. Doering - Creative Computing, Sept 1982
1720 ' Program originally written for a cassette-based IBM PC & Epson MX-80
1730 ' Rewritten for PC computers by Eric F. Tchong - Aruba - April 13, 1992
1740 ' Mods Screen printing - August 15, 1997
1750 ' Millennium Edition - February 14, 2003 (Valentine's Day)
1760 '
1770 ' Values for WordPerfect
1780 ' Load the txt file as an ASCII DOS Text file
1790 ' Page setup:      Letter Type
1800 ' Font:            Courier New 9
1810 ' Left Margin:     0.4" (adjust if necessary from 0.25" to 0.3")
1820 ' Select all:      Bold
1830 ' Page:            Numbering, Bottom Right, Bold
1840 ' Filename:        Listdisk.wpd