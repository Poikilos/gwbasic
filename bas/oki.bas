10 DEF SEG=0:POKE &H478,1:POKE &H479,1:POKE &H47A,1:POKE &H47B,1:DEF SEG
20 CLS:PRINT "OKIDATA 182 printer options - 11/24/94":PRINT
30 PRINT "Printer must be power cycled to reset print options":PRINT
40 PRINT "1. 132 CHARACTERS PER LINE     (COMPRESSED)"
50 PRINT "2. PAPER SAVING MODE           (24/216 LINE SPACING)"
60 PRINT "3. VERY SMALL PRINT            (COMPRESSED, SUPERSCRIPT, 15/216 LS)"
70 PRINT "4. LARGE PRINT (66 CPL)        (DOUBLE STRIKE, COMPRESSED,EXPANDED)"
80 PRINT "5. VERY LARGE PRINT (41 CPL)   (DOUBLE-STRIKE, EMPHASIZED, EXPANDED)"
90 PRINT "6. DOUBLE WIDTH VERTICALLY     (ENHANCED)"
100 PRINT "7. DOUBLE WIDTH HORIZONTALLY   (EMPHASIZED)"
110 PRINT "8. NEAR LETTER QUALITY"
120 PRINT "9. EXIT"
130 LOCATE 14,1:PRINT "SELECT 1-9        ";
140 LOCATE 14,14:INPUT OPT$
150 IF VAL(OPT$)=0 OR VAL(OPT$)>9 THEN GOTO 130
160 ON ERROR GOTO 300
170 ON VAL(OPT$) GOSUB 190,200,210,220,230,240,250,260,270
180 PRINT:PRINT "Option ";OPT$;" Selected":PRINT:END
190 LPRINT CHR$(15);:RETURN
200 LPRINT CHR$(27);"3";CHR$(24);:RETURN
210 LPRINT CHR$(15);CHR$(27);"S0";CHR$(27);"3";CHR$(15);:RETURN
220 LPRINT CHR$(27);"G";CHR$(15);CHR$(27);"W1";:RETURN
230 LPRINT CHR$(27);"G";CHR$(27);"E";CHR$(27);"W1";:RETURN
240 LPRINT CHR$(27);"G";:RETURN
250 LPRINT CHR$(27);"E";:RETURN
260 LPRINT CHR$(27);"I3";:RETURN
270 CLS:END
280 REM -----
300 RESUME 310
310 ON ERROR GOTO 0
320 PRINT:PRINT "Printer Not Responding":PRINT:END

