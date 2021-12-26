10 PRINT TAB(33);"LUNAR"
20 PRINT:PRINT:PRINT
30 PRINT "this is a computer simulation of an apollo lunar"
40 PRINT "landing capsule.":PRINT:PRINT
50 PRINT "the on-board computer has failed (it was made by IBM)"
60 PRINT "so you will have to land the capsule manually."
70 PRINT:PRINT "set burn rate of retro rockets to any value between"
80 PRINT "0 (free fall) and 200 (maximum burn) pounds per second."
90 PRINT "set new burn rate every 10 seconds.":PRINT
100 PRINT "capsule weight 32,500 lbs: fuel weight 16,500 lbs."
110 PRINT:PRINT:PRINT:PRINT "good luck"
120 L=0
130 PRINT:PRINT "sec","mi + ft","mph","lb fuel","burn rate":PRINT
140 A=120:V=1:M=33000!:N=16500:G=.001:Z=1.8
150 PRINT L,INT(A);INT(5280*(A-INT(A))),3600*V,M-N,:INPUT K:T=10
160 IF M-N<.001 THEN 240
170 IF T<.001 THEN 150
180 S=T: IF M>N+S*K THEN 200
190 S=(M-N)/K
200 GOSUB 420: IF I<=0 THEN 340
210 IF V<=0 THEN 230
220 IF J<0 THEN 370
230 GOSUB 330: GOTO 160
240 PRINT "fuel out at";L;"seconds":S=(-V+SQR(V*V+2*A*G))/G
250 V=V+G*S:L=L+S
260 W=3600*V:PRINT "on moon at";L;"seconds - impact velocity";W;"mph"
270 IF W<=1.2 THEN PRINT "perfect landing!": GOTO 440
280 IF W<=10 THEN PRINT "good landing (could be better)":GOTO 440
282 IF W>60 THEN 300
284 PRINT "craft damage... you're stranded here until a rescue"
286 PRINT "party arrives.  hope you have enough oxygen!"
288 GOTO 440
290 IF W>60 THEN 300
300 PRINT "sorry ther were no survivors. you blew it!"
310 PRINT "in fact you blasted a new lunar crater";W*.277;"feet deep!"
320 GOTO 440
330 L=L+S: T=T-S: M=M-S*K: A=I: V=J: RETURN
340 IF S<5.000001E-03 THEN 260
350 D=V+SQR(V*V+2*A*(G-Z*K/M)):S=2*A/D
360 GOSUB 420: GOSUB 330:GOSUB 340
370 W=(1-M*G/(Z*K))/2: S=M*V/(Z*K*(W+SQR(W+SQR(W*W+V/Z))))+.05:GOSUB 420
380 IF I<=0 THEN 340
390 GOSUB 330: IF J>0 THEN 160
400 IF V>0 THEN 370
410 GOTO 160
420 Q=S*K/M: J=V+G*S+Z*(-Q-Q*Q/2-Q^3/3-Q^4/4-Q^5/5)
430 I=A-G*S*S/2-V*S+Z*S*(Q/2+Q^2/6+Q^3/12+Q^4/20+Q^5/30):RETURN
440 PRINT:PRINT:PRINT:PRINT "try again??":GOTO 70
