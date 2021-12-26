100 REM **********************************************************************
110 REM FILE NAME  - QUIZ.BAS
120 REM
130 REM WRITTEN BY - GARY PEEK
140 REM              3201 HIGHGATE
150 REM              ST. CHARLES, MO.  63301
160 REM              314 946-5272
170 REM
180 REM LAST UPDATE - 11/20/88
190 REM
200 REM DESCRIPTION - RUNS A MULTIPLE CHOICE QUESTION QUIZ
210 REM
220 REM PLEASE NOTE - PERMISSION IS GRANTED TO COPY THIS PROGRAM ONLY IF
230 REM               COPIED IN ITS ENTIRETY INCLUDING THIS HEADING.
240 REM
250 REM
260 REM FORMAT -     QUIZ FILES ARE NAMED "FILENAME.QIZ"
270 REM              AND ARE ARRANGED AS FOLLOWS. EACH LINE
280 REM              ENDS WITH A LINE FEED AND CARRIAGE RETURN
290 REM              AND NO COMMAS ARE ALLOWED IN THE FILE!
300 REM              THE LINES OF HYPHENS ARE DUMMY LINES TO
310 REM              SEPARATE QUESTIONS FOR READABILITY.
320 REM
330 REM              QUIZ NAME
340 REM              --------
350 REM              QUESTION 1
360 REM              CHOICE A
370 REM              CHOICE B
380 REM              CHOICE C
390 REM              CHOICE D
400 REM              A
410 REM              EXPLANATION IF WRONG ANSWER
420 REM              --------
430 REM              QUESTION 2
440 REM              CHOICE A
450 REM              CHOICE B
460 REM              CHOICE C
470 REM              CHOICE D
480 REM              A
490 REM              EXPLANATION IF WRONG ANSWER
500 REM              --------
510 REM              ETC.
520 REM
530 REM **********************************************************************
540 REM
550 CLS:KEY OFF:FOR A=1 TO 10:KEY A,"":NEXT A:COLOR 7,0
560 EXT$="QIZ":GOSUB 1550:REM GET FILE NAMES
570 IF NUMFILES>=1 THEN 610
580 MSG$="Sorry, There Are No Quizes On File"
590 ROW=1:COL=1:GOSUB 1270
600 IN$=INKEY$:IF IN$="" THEN 600 ELSE CLS:END
610 MSG$="QUIZ PROGRAM - Select Quiz Name (or Hit (ESC)ape to Exit):"
620 ROW=1:COL=1:GOSUB 1270
630 ROW=3:GOSUB 1850:REM SELECT FILE NAME
640 IF FILE$=CHR$(27) THEN CLS:END
650 QNUM=0:RNUM=0:WNUM=0:LOWTONE=178:HIGHTONE=710
660 REM ---------- READ FILE ----------
670 ON ERROR GOTO 1160
680 OPEN FILE$+".QIZ" FOR INPUT AS #1
690 INPUT #1,QUIZNAME$
700 INPUT #1,DUMMY$
710 REM ---- LOOP ----
720 IF EOF(1) THEN 1030
730 CLS:MSG$="********** "+QUIZNAME$+" QUIZ **********":ROW=1:COL=1:GOSUB 1270
740 INPUT #1,QUESTION$
750 INPUT #1,ANSWERA$
760 INPUT #1,ANSWERB$
770 INPUT #1,ANSWERC$
780 INPUT #1,ANSWERD$
790 INPUT #1,RIGHTANSWER$
800 INPUT #1,EXPLANATION$
810 INPUT #1,DUMMY$
820 QNUM=QNUM+1:QNUMBER$=STR$(QNUM)
830 MSG$="Question Number"+QNUMBER$+" -":ROW=3:COL=1:GOSUB 1270
840 MSG$=QUESTION$:ROW=5:COL=1:GOSUB 1270
850 MSG$="A. "+ANSWERA$:ROW=8:COL=1:GOSUB 1270
860 MSG$="B. "+ANSWERB$:ROW=11:COL=1:GOSUB 1270
870 MSG$="C. "+ANSWERC$:ROW=14:COL=1:GOSUB 1270
880 MSG$="D. "+ANSWERD$:ROW=17:COL=1:GOSUB 1270
890 MSG$="Enter A,B,C, or D":ROW=20:COL=1:GOSUB 1270
900 TEMP$="":ROW=20:COL=20:LNG=1:GOSUB 1320
910 IF TEMP$="" THEN 900
920 IF TEMP$<> "A" AND TEMP$<> "a" AND TEMP$<> "B" AND TEMP$<> "b" AND TEMP$<>      "C" AND TEMP$<> "c" AND TEMP$<> "D" AND TEMP$ <> "d" THEN GOTO 900
930 IF TEMP$=RIGHTANSWER$ THEN 970
940 WNUM=WNUM+1:MSG$="WRONG, The Correct Answer is "+RIGHTANSWER$
950 ROW=20:COL=30:GOSUB 1270:SOUND LOWTONE,10
960 MSG$=EXPLANATION$:ROW=22:COL=1:GOSUB 1270:GOTO 980
970 RNUM=RNUM+1:MSG$="You Are CORRECT":ROW=20:COL=30:GOSUB 1270:SOUND HIGHTONE,5
980 MSG$="Hit Any Key to Continue":ROW=25:COL=1:GOSUB 1270
990 LOCATE ,,0
1000 IN$=INKEY$:IF IN$="" THEN 1000
1010 LOCATE ,,1:GOTO 720
1020 REM ------- END OF QUIZ -------
1030 CLOSE #1:ON ERROR GOTO 0
1040 CLS:MSG$="End of "+QUIZNAME$+" Quiz":ROW=1:COL=1:GOSUB 1270
1050 MSG$="There Were"+QNUMBER$+" Questions on This Quiz-":ROW=3:COL=1:GOSUB 1270
1060 CORRECT$=STR$(RNUM):WRONG$=STR$(WNUM)
1070 MSG$="You Got"+CORRECT$+" Question(s) Correct and":ROW=5:COL=1:GOSUB 1270
1080 MSG$="       "+WRONG$+" Question(s) Wrong.":ROW=6:COL=1:GOSUB 1270
1090 X=RNUM*100:Y=X/(RNUM+WNUM):PERCENT$=STR$(Y)
1100 MSG$="Your Score is"+PERCENT$+"%":ROW=8:COL=1:GOSUB 1270
1110 MSG$="Hit Any Key to Continue":ROW=10:COL=1:GOSUB 1270
1120 LOCATE ,,0
1130 IN$=INKEY$:IF IN$="" THEN 1130
1140 LOCATE ,,1:GOTO 550
1150 REM -----------
1160 IF ERR=53 THEN MSG$="That Quiz Was Not Found":ROW=5:COL=1:GOSUB 1270
1170 MSG$="Hit Any Key to Continue":ROW=7:COL=1:GOSUB 1270
1180 LOCATE ,,0
1190 IN$=INKEY$:IF IN$="" THEN 1190
1200 LOCATE ,,1:CLOSE #1:RESUME 1210
1210 ON ERROR GOTO 0:GOTO 550
1220 END
1230 REM ************************************************************
1240 REM
1250 REM -------- PRINT STRING - ENTER WITH MSG$, ROW, COL -----------
1260 REM
1270 LOCATE ROW,COL:PRINT MSG$;:RETURN
1280 REM
1290 REM ----------- EDIT STRING ---------- USES IN$, A --------------
1300 REM ----- ENTER WITH TEMP$, ROW, COL, LNG - EXIT WITH TEMP$ -----
1310 REM
1320 LOCATE ROW,COL,1:COLOR 0,7:PRINT TEMP$;        :REM  PRINT STRING
1330 FOR A=1 TO LNG-LEN(TEMP$):PRINT " ";:NEXT      :REM  REVERSE VIDEO FIELD
1340 FOR A=1 TO LNG-LEN(TEMP$):PRINT CHR$(29);:NEXT :REM  BACK UP TO LAST CHAR
1350 IN$=INKEY$:IF IN$="" THEN 1350                 :REM  WAIT FOR KEY
1360 IF IN$=CHR$(13) THEN 1480                      :REM  RETURN KEY
1370 IF IN$=CHR$(8) THEN 1440                       :REM  BACKSPACE KEY
1380 IF IN$=CHR$(27) THEN TEMP$=CHR$(27):GOTO 1480  :REM  ESCAPE KEY
1390 IF ASC(IN$)<32 OR ASC(IN$)>126 THEN 1350       :REM  ILLEGAL CHARACTER
1400 IF LEN(TEMP$)>LNG-1 THEN BEEP:GOTO 1350        :REM  NO MORE CHARS ALLOWED
1410 PRINT IN$;:TEMP$=TEMP$+IN$                     :REM  GOOD CHARACTER
1420 IF LEN(TEMP$)=LNG THEN PRINT CHR$(29);         :REM  MOVE CURSOR IF LAST
1430 IF LNG=1 THEN GOTO 1480 ELSE GOTO 1350         :REM  RETURN IF LNG=1
1440 IF LEN(TEMP$)=0 THEN BEEP:GOTO 1350            :REM  BAD BS - NO CHARS
1450 TEMP$=LEFT$(TEMP$,LEN(TEMP$)-1)                :REM  IF GOOD BACKSPACE
1460 IF LEN(TEMP$)<>LNG-1 THEN PRINT CHR$(29);      :REM  MOVE CURSOR IF LAST
1470 PRINT " ";CHR$(29);:GOTO 1350                  :REM  IF GOOD BACKSPACE
1480 COLOR 7,0:RETURN                               :REM  COMMON EXIT
1490 REM
1500 REM
1510 REM ------ STORE FILE NAMES OF A SPECIFIED EXTENSION IN AN ARRAY ------
1520 REM ---------------- TO BE USED BY THE NEXT ROUTINE. ------------------
1530 REM -------------- ENTER WITH EXT$, EXIT WITH NUMFILES ----------------
1540 REM
1550 DIM FILENAME$(256,8)
1560 SHEL$="DIR *."+EXT$+" > FILES.TMP"
1570 SHELL SHEL$
1580 OPEN "FILES.TMP" FOR INPUT AS 1
1590 NUMFILES=0:FROW=1:FCOL=1:MAXROW=1:MAXCOL=1
1600 IF EOF(1) THEN 1740
1610 INPUT #1,FILE$
1620 EXTPOS=INSTR(FILE$," "+EXT$)-1
1630 IF EXTPOS<1 OR LEN(FILE$)=0 THEN 1730
1640 FILE$=LEFT$(FILE$,EXTPOS)
1650 SPCPOS=INSTR(FILE$," ")-1
1660 IF SPCPOS<1 OR LEN(FILE$)=0 THEN 1680
1670 FILE$=LEFT$(FILE$,SPCPOS)
1680 FILENAME$(FROW,FCOL)=FILE$
1690 NUMFILES=NUMFILES+1
1700 FCOL=FCOL+1
1710 IF FCOL=9 THEN FCOL=1:FROW=FROW+1
1720 IF FCOL>MAXCOL THEN MAXCOL=FCOL
1730 GOTO 1600
1740 MAXROW=FROW:IF MAXROW=1 THEN MAXCOL=MAXCOL-1
1750 CLOSE 1:KILL "FILES.TMP"
1760 RETURN
1770 REM
1780 REM --------- DISPLAY AND SELECT FILE NAME FROM NAMES STORED --------
1790 REM -------------- IN AN ARRAY BY THE PREVIOUS ROUTINE --------------
1800 REM ------ ENTER WITH ROW (ON WHICH TO START DISPLAYING FILES) ------
1810 REM ------- EXIT WITH FILE$ (CHR$(27) IF ESCAPE KEY WAS HIT) --------
1820 REM ----- MOVE TO NAME WITH ARROW KEYS, SELECT FILE WITH RETURN -----
1830 REM
1840 REM ----- DISPLAY FILE NAMES
1850 FOR DROW=1 TO FROW
1860  FOR DCOL=1 TO MAXCOL
1870   LOCATE DROW-1+ROW,((DCOL-1)*10)+1
1880   PRINT FILENAME$(DROW,DCOL)
1890  NEXT DCOL
1900 NEXT DROW
1910 REM ----- MOVE THROUGH FILE NAMES AND SELECT ONE
1920 LOCATE ,,0:FROW=1:FCOL=1:OLDFROW=FROW:OLDFCOL=FCOL
1930 LOCATE FROW-1+ROW,FCOL
1940 COLOR 0,7:PRINT FILENAME$(FROW,FCOL):COLOR 7,0
1950 LOCATE FROW-1+ROW,FCOL
1960 IN$=INKEY$:IF IN$="" THEN 1960
1970 IF IN$=CHR$(13) THEN 2190
1980 IF IN$=CHR$(27) THEN FILE$=CHR$(27):GOTO 2200
1990 IF IN$=CHR$(0)+CHR$(75) THEN 2040:REM LEFT
2000 IF IN$=CHR$(0)+CHR$(77) THEN 2060:REM RIGHT
2010 IF IN$=CHR$(0)+CHR$(72) THEN 2080:REM UP
2020 IF IN$=CHR$(0)+CHR$(80) THEN 2100:REM DOWN
2030 GOTO 1960
2040 IF FCOL>1 THEN OLDFROW=FROW:OLDFCOL=FCOL:FCOL=FCOL-1
2050 GOTO 2120
2060 IF FCOL<MAXCOL THEN OLDFROW=FROW:OLDFCOL=FCOL:FCOL=FCOL+1
2070 GOTO 2120
2080 IF FROW>1 THEN OLDFROW=FROW:OLDFCOL=FCOL:FROW=FROW-1
2090 GOTO 2120
2100 IF FROW<MAXROW THEN OLDFROW=FROW:OLDFCOL=FCOL:FROW=FROW+1
2110 GOTO 2120
2120 IF FILENAME$(FROW,FCOL)<>"" THEN 2140
2130 FROW=OLDFROW:FCOL=OLDFCOL
2140 LOCATE OLDFROW-1+ROW,((OLDFCOL-1)*10)+1
2150 PRINT FILENAME$(OLDFROW,OLDFCOL)
2160 LOCATE FROW-1+ROW,((FCOL-1)*10)+1
2170 COLOR 0,7:PRINT FILENAME$(FROW,FCOL):COLOR 7,0
2180 GOTO 1960
2190 FILE$=FILENAME$(FROW,FCOL)
2200 ERASE FILENAME$:LOCATE ,,1:RETURN

