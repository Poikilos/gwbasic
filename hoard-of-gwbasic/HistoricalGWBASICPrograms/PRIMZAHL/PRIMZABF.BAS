10 CLS
20 INPUT"Geben Sie den Maximalwert f�r die Primzahlen an:",MAX
30 CLS
40 B=5
50 C=1
60 A=1
70 FOR Z=1 TO A
80 Y=A/Z
90 LOCATE 1,1:PRINT Y;"              "
100 LOCATE 2,1:PRINT A;"              "
110 IF Y=INT(Y) THEN X=X+1
120 NEXT Z
130 IF X=2 OR A=1 THEN GOSUB 190
140 X=0
150 A=A+1
160 IF A>MAX THEN LOCATE 23,1:END
170 IF W=1 THEN GOSUB 250:W=0
180 GOTO 70
190 REM Unterroutine
200 LOCATE 3,1:SOUND 2000,.5
210 COLOR 12,0,0:PRINT"Primzahl gefunden...":COLOR 14,0,0
220 X=0:LOCATE B,C:PRINT A:C=C+5:IF C>75 THEN C=1:B=B+1
230 COLOR 15,0,0:LOCATE 3,1:PRINT"Primzahl gefunden..."
240 RETURN
250 REM Unterroutine
260 COLOR 15,0,0:LOCATE 3,1:PRINT"Primzahl gefunden..."
270 RETURN
