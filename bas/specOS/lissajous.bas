ZXASCII
AUTO -1
PROG lissajous.bas
5 LET p=1.0
10 INPUT "Param (0.7 to 1.3): ";p: CLS 
20 INK 7: PAPER 0
25 LET t=0
30 REM FOR i=0 TO 10000
40 LET t=t+.1
50 LET x=50*(1+SIN p*t)
60 LET y=50*(1+COS t)
70 PLOT x+50,y+50
80 REM NEXT i
90 GO TO 40
