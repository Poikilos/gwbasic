10 CLS
20 PRINT "RECEIVE BINARY FILE FROM COM1 AT 9600, N, 8, 1 AND WRITE TO A FILE"
25 PRINT "NAMED TEST.BIN. HIT ESCAPE TO CANCEL AND EXIT, OR, PROGRAM WILL"
30 PRINT "SAVE FILE AND EXIT AFTER 2 SECONDS OF NOT RECEIVING MORE CHARACTERS"
35 PRINT "AFTER BEGINNING RECEPTION OF A FILE. FILE SIZE LIMIT IS 10,000 BYTES."
50 PRINT
60 DIM X$(10000)
65 CHARNUM=0
70 OPEN "COM1:9600,N,8,1,CS,DS,CD" AS #1
100 B$=INKEY$:IF B$=CHR$(27) THEN CLOSE #1:END
110 IF NOT EOF(1) THEN 130
120 IF TIMER>T+2 AND FLAG THEN 200
125 GOTO 100
130 A$=INPUT$(1,#1)
140 PRINT ASC(A$);
150 X$(CHARNUM)=A$
155 CHARNUM=CHARNUM+1
160 T=TIMER:FLAG=-1
170 GOTO 100
180 REM
200 CLOSE #1
205 OPEN "TEST.BIN" FOR OUTPUT AS #2
210 FOR CHARLOOP=0 TO CHARNUM
220 PRINT #2,X$(CHARLOOP);
230 NEXT CHARLOOP
240 CLOSE #2
250 END
