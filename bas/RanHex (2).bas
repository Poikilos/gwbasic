10 rem RandomHexDigitProgram
11 rem by KindlyRat 29 Dec 2003
15 dim A$(16)
20 randomize timer
30 A$(1) = "0"
31 A$(2) = "1"
32 A$(3) = "2"
33 A$(4) = "3"
34 A$(5) = "4"
35 A$(6) = "5"
36 A$(7) = "6"
37 A$(8) = "7"
38 A$(9) = "8"
39 A$(10) ="9"
40 A$(11) = "A"
41 A$(12) = "B"
42 A$(13) = "C"
43 A$(14) = "D"
44 A$(15) = "E"
45 A$(16) = "F"
100 for n = 1 to 100
130 for x = 1 to 8
140 r = 1+ int(rnd*16)
150 print A$(r);
160 next x
165 print,
170 next n
180 end
