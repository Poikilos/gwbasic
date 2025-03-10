��
 :��ANTMATCH - Antenna Matching Networks - 06 FEB 2002 � �:� � � � EX$�""� EX$�"EXIT" �( �� EX$,PROG$ �2 � L(),C(),G() +< � A(,), B(,), X(), NPIVROW(,), NPIVCOL(,) GF PI����()  :��3.141593 XP UL$��(P,�) `Z :�� wd :��.....title page }n � �x � ,, �� � " ANTENNA MATCHING NETWORKS"�B)"by R.J.Dehoney "; �� � ,:� �(P,�); �� � , �� :�� 7� � " This program solves for the element values of a matching network "; M� � "for a dipole " �� � " or monopole antenna. After you enter the highest passband frequen"; �� � "cy and the   " �� � " antenna diamter, the program calculates the lower band edge and Z"; � � "o for trial  " ]� � " values of length, number of poles and SWR. The value of all these"; s� � " elements can" �� � " be changed to arrive at a suitable design." �� �� " The procedure uses an RLC network to simulate the imput impedance"; � " of dipole   " ["� " and monopole antennas. The RLC values are functions of the antenn"; q,� "a length and " �6� " diameter. As an option, measured Zin data can be entered from whi"; �@� "ch the RLC   " J� " values are calculated. The representation is good over a restrict"; 5T� "ed range of  " �^� " L, D and SWR. Within this range, impressive bandwidths can be ach"; �h� "ieved.       " �r� " Outside this range, you must use some other program. e.g., Hamcal"; �|� "c's MATCHBOX " �� " IMPEDANCE TRANSFORMER." D�� , :� ,:� " Program Hints: ":� , ��� " As you 'TUNE' the various parameters, you may hear a 'BEEP' and s"; ��� "ee no further" ��� " change in values. This means you have reached one of the program "; �� "limits, for  " T�� " instance negative matching elements, or SWRmin>SWRmax or too grea"; j�� "t a diameter " ~�� " or length." ���:� , ��� ,:� " Press 1 to continue or 0 to EXIT ":� , ��A$��:� A$�""� � ��� A$�"0"� �:�� EX$  � A$�"1"�  
� � � ,,:� M&� "Is antenna a dipole or a monopole (d/m)? ",A$ u0� A$�"d" � B$�"dipole": KA� :� D �:� A$�"m" � B$�"monopole" :KA� :� � :� & �DNA� :SWRMAX�ff� :SWRMIN� �N� :� 

 ::��Calculate G(n)'s )X� "ENTER: highest operating frequency in MHz ";F0 :FH�F0�
� gb� F0� � � X :� LMAX���(��V��FH�KA)�
 :DMAX�LMAX�KA� �l� :� " Dimension limits: Length..."=
W��LMAX"to"LMAX"meters," �v� "         Maximum Diameter..."DMAX"cm �� :� "Do you have 4 sets of Zin data between"�p=��F0"and"F0"MHz" G�� "for such a ";B$;"? (y/n)";:� " ",A$ o�� A$�"n" � � � :� � A$��"y" � � ��FLAG2� :� � :� * :� FLAG� � �  ��� :� 8 :�  ��� :�� ��� "ENTER: "B$" element diameter ("DMAX"cm or less)";:� " ";D !�� D�DMAX � D�� � �  � :� D�D�d E�L0�LMAX :� :� � :� � :� � j�:��.....subroutine to calc RA-CB v�L�L0�KA ��R�L�D :FLAG� :LX���(�L�D)���(
) ��CB�A��L��(LX��x9�)�̼Y �CA�L�(1d��(LX��L��j\�)��(P{)�̼Y LA���L}�L�(=�=��LX�7����i�)��7m LRA�(eS�LX���
m��(�L�D)����C{�C�h�)�� v :��......subroutine to calc L's & C's �*FL�FH�(G()�LA�RA��PI�FH�) �4BW�FH�FL :BWR��PI�BW :F0���(FH�FL) :W0��PI�F0 �>CP�G()�BWR�RA �HM�CB�(CA�CB�CP) RCC�CB�(M�) :CS�CB�M B\� (�)�NA� � Z0�RA�M�M�SWRMIN :� Z0�RA�M�M�SWRMAX |fL()�G()�RA�BWR :C2��W0�W0�L() :C()�CS�C2�(CS�C2) �p� I� � NA �  �zC(I)�G(I)�RA�BWR�M�M ��L(I)��C(I)�W0�W0 ��� I ��� I� � NA �  ��L(I)�G(I)�RA�BWR�M�M  �C(I)��L(I)�W0�W0  �� I 1 �L()�L()�M�M :C()�C()�M�M Z �� M� � 
 :� C(M)� � CC� � FLAG� e �� M :� m �:�� � �:��.....subroutine to print values � �� � �P$�"Lmax= ###.# m.   �N= ###        �L/Dmin= ###.##" � � � P$;LMAX,NA,2�KA 8!P$�"L=    ###.### m. �D= ###.### cm.�L/D=  #####.##":��;L0,D*100,L/D/KA R!� � P$;L0,D�d,L�D�KA �!$P$�"FL=  ####.### MHz�FH=###.### MHz�BW=   #####.##%" �!.� � P$;FL�
�,FH�
�,BW�F0�d �!8P$�"Zo= #####.### �  �SQRmax= ###.##�SWRmin= ###.##" "B� � P$;Z0�KA,SWRMAX,SWRMIN '"L� :� KA� � � t	 :� � �	 R"V� ,5 :� "���� ANTENNA ELEMENTS ����" ]"`� ,5 �"j� FLAG2� � � "  (calculated from data)" :� � "(calculated from dimensions)" �"t� ,< :� "RA=";� "####.###";RA�KA;:� " ohms" #~� ,< :� "LA=";� "####.###";LA�KA�
�;:� " uH" K#�� ,< :� "CA=";� "####.###";CA�KA���h�;:� " pF" �#�� ,< :� "CB=";� "####.###";�CB���h�;:� " pF" �#�� ,5 :� "���� NETWORK ELEMENTS ����" �#�� ,< :� "CC="� "####.###" ;CC�KA���h�;:� " pF" $�� I� � NA :N$���(��(I),) :� I �()� � PA� :� PA�KA Z$�� �I�,<:� "C"N$"=";� "####.###";C(I)�PA���h�;:� " pF" �$�� �I�,<:�"L"N$"=";�"####.###";L(I)�PA�
�;:� " uH" �$�� I �$�:��Y=CSRLIN :LOCATE Y+1,60 :PRINT "Z0=";USING "####.##";Z0/KA;:PRINT " ohms �$�� (%�:��                   menu when using dimensions g%�� , :� "To change values, press letter as shown below:" �% � "         Length  Diameter  SWRmax   SWRmin  # Poles" �%
C$�"������" :� �
);C$;�);C$;�);C$;�%);C$;�-);C$ &� "Increase  <L>      <D>      <X>      <S>     <N>" P&� "Decrease  <l>      <d>      <x>      <s>     <n>" �&(� "For Zin of "B$" without matching, press <a> �&2� "For Zin of "B$" and matching network, press <v> �&<� "To restart, press <r>.  To quit, press <q> " �&F� ,:� , 3'P� " Press one of the above letters in < > ":� , M'ZA$�� :� A$�"" � � Z o'd� A$�"L" � L0�L0��G� :� �
 �'n� A$�"l" � L0�L0��G� :�  �'x� A$�"D" � D�D��G� :� , �'�� A$�"d" � D�D��G� :� J �'�� A$�"X" � SWRMAX�SWRMAX���L| :� ^ %(�� A$�"x" � SWRMAX�SWRMAX���L| :� r O(�� A$�"S" � SWRMIN�SWRMIN���L| :� � y(�� A$�"s" � SWRMIN�SWRMIN���L| :� � �(�� A$�"N" � NA�NA� :� � �(�� A$�"n" � NA�NA� :� � �(�� A$�"v" � � � :� � :� � �(�� A$�"a" � � > :� � :� � )�� A$�"r" �  9)�� A$�"q" � `	 :�� program end routine q)�� � :� � :��repeats screen for any other entry. y)�:�� �):��                menu when using data �)� , :� "To change values, press letter as shown below:" *� "         SWRMAX        SWRMIN       # Poles" B*"C$�"������":� �
);C$;�);C$;�&);C$ s*,� "Increase  <X>           <S>          <N>" �*6� "Decrease  <x>           <s>          <n>" �*@� "For Zin of the "B$" without matching, enter <a> +J� "For Zin of the "B$" and matching network, enter <v> Y+T� "To restart program, enter <r>.  To end program, enter <q> " s+^� "Enter letter...."; �+hA$�� :� A$�"" � � h �+r� A$�"X" � SWRMAX�SWRMAX���L| :� & �+|� A$�"x" � SWRMAX�SWRMAX���L| :� : ,�� A$�"S" � SWRMIN�SWRMIN���L| :� X 5,�� A$�"s" � SWRMIN�SWRMIN���L| :� v S,�� A$�"N" � NA�NA� :� � q,�� A$�"n" � NA�NA� :� � �,�� A$�"v" � � � :� � �,�� A$�"a" � � > :� � �,�� A$�"r" �  �,�� A$�"q" � `	 :�� program end routine -�� � :��repeats screen for any other entry.  -�:�� C-�:��.....subroutine to find Zin e-�� :� FLAG2� � � 8 :� � � �-� � "This segment will analyze the matched antenna system                                  from a lower to an upper frequency." 5.� FLAG1� � � :�"Use same frequencies <y/n>? ",A$:� A$�"y"         � 0 s.� :� "Enter the lower frequency in MHz ",F1 :� F1� �  �.� "Enter the upper frequency in MHz ",F2 :� F2�F1 � � :�  �.&FS�(F2�F1)�  :FLAG1� �.0� :� , #/:� "Xin and VSWR for matched antenna with Z0="��(
�Z0�KA)�
"ohms ^/D� " Frequency        Rin           Xin           VSWR" z/N� FM�F1 � F2��  � � FS �/XF�FM�
�:W��PI�F �/bRP�RA :BP�W�CA��W�LA :XP���BP �/lDN�RP�RP�XP�XP :RS�RP�XP�XP�DN :XS�XP�RP�RP�DN��W�CB '0vRP�RS�XS�XS�RS :BP��XS�(XS�XS�RS�RS)�W�CC :XP���BP :0�� P� � NA �  }0�DN�RP�RP�XP�XP :RS�RP�XP�XP�DN :XS�XP�RP�RP�DN��W�C(P)�W�L(P) �0�� P��NA � � � �0�RP�RS�XS�XS�RS :BP��XS�(XS�XS�RS�RS)�W�C(P�)��W�L(P�) :XP���BP �0�� P 1�DN�RP�RP�XP�XP :RS�RP�XP�XP�DN :XS�XP�RP�RP�DN E1�REFLCO���(((RS�Z0)��XS�)�((RS�Z0)��XS�)) c1�SWR�(�REFLCO)�(�REFLCO) �1�� � "#####.##      ";F�
�;RS�KA;XS�KA;SWR �1�� FM :� �1�� "To change frequencies, press <f>" �1�� "To review antenna/network values, press <a>" 2�� "To end, press <q>." /2A$�� :� A$�"" �  B2� A$�"f" �  S2� A$�"a" � � h2 � A$�"q" � � `	 r2*�  �24:��.....subroutine to find ZA �2>� :� FLAG2� � � 8 :� � � :��print display K3H� "This segment will analyze the antenna equivalent                                circuit from a lower to an upper frequency." �3R� FLAG1� � � :� "Use same frequencies? <y/n) ",A$:� A$�"y"        � z �3\� :� "Enter the lower frequency in MHz ",F1 :� F1� � \ 4f� "Enter the upper frequency in MHz ",F2 :� F2�F1 � � :� \ 34pFS�(F2�F1)�  :FLAG1� a4z� ZA� � � "Enter trial ZA ",ZA :ZO�ZA�KA {4�:��IF ZA=0 THEN ZO=KA �4�� :� :� "Zin and VSWR for antenna equivalent circuit with ZA="        ��(
�ZO�KA)�
"ohms" 5�� "Frequency         Rin          Xin          VSWR " 15�� FM�F1 � F2��  � � FS I5�F�FM�
� :W��PI�F m5�RP�RA :BP�W�CA��W�LA :XP���BP �5�DN�RP�RP�XP�XP :RS�RP�XP�XP�DN :XS�XP�RP�RP�DN��W�CB �5�RP�RS�XS�XS�RS :XP�XS�RS�RS�XS �5�REFLCO���(((RS�ZO)��XS�)�((RS�ZO)��XS�)) 6�SWR�(�REFLCO)�(�REFLCO) I6�� � "####.##       ";F�
�;RS�KA;XS�KA;SWR R6�� FM r6�� "To change ZA, press <z>" �6	� "To change frequencies, press <f>" �6	� "To review antenna/network values, press <a>" �6	� "To end, press <q>." 7$	A$�� :� A$�"" � $	 7.	� A$�"f" � \ &78	� A$�"a" � � [7B	� A$�"z" � � "Enter new ZA ",ZA :ZO�ZA�KA :� � p7L	� A$�"q" � � `	 z7V	� $	 �7`	:��.....end �7j	� �:� d  �7t	:��.....subroutine to print dipole circuit �7~	� "  ���������CB��*���C2��L2�* * * C4 * L4 * !8�	� "  �  �  �       �         *   * U8�	� "  RA LA CA      CC        C3  L3       INPUT |8�	� "  �  �  �       �         *   * �8�	� "  ���������CB��*���C2��L2�* * * C4 * L4 * �8�	� "  �����dipole�į�����matching network��į�" :� �8�	:�� 9�	:��.....subroutine to print monopole circuit M9�	� "  ���������CB�*��C2��L2�* * * * C4 * L4 * r9�	� "  �  �  �      �        *   * �9�	� "  RA LA CA     CC       C3  L3        INPUT �9�	� "  �  �  �      �        *   * �9�	� "  ������������*���������* * * * * * * * * 0: 
� "  ���monopole������matching network���į�" :� [:

:��.....subroutine to calculate G(n)'s �:
SX�SWRMAX :SM�SWRMIN :� SX� � SX��  � �:
� (SX�SM)� � SX�SX��  � �:(
PMAX�(SX�)�(SX�) :ILMAX��PMAX� �:2
PMIN�(SM�)�(SM�) :ILMIN��PMIN� 
;<
E1���(ILMIN�ILMAX) 9;F
U1���((�PMAX�PMAX)�(PMAX�PMAX�PMIN�PMIN)) H;P
U2�PMIN�U1 c;Z
NA1���(U1���(U1�U1�)) ~;d
NB1���(U2���(U2�U2�)) �;n
A�NA1�NA �;x
B�NB1�NA �;�
HSA�   ��(��(A)���(�A)) �;�
HSB�   ��(��(B)���(�B)) �;�
G()����(PI��NA)�(HSA�HSB) <�
� I� � NA� 5<�
U3����((�I�)�PI��NA)���((�I�)�PI��NA) p<�
U4�HSA�HSA�HSB�HSB���(I�PI�NA)���HSA�HSB���(I�PI�NA) �<�
G(I�)�U3�U4�G(I) �<�
� I �<�
GIN����(PI��NA)�(HSA�HSB)�G(NA) �<�
� �<�
:��.....logic subroutines for dimensions 	=�
:��.....subroutine to check L /=�
� L0�LMAX � � :L0�L0��G� :�  d=� � :� FLAG� � � :L0�L0��G� :�  :� �  �=:��.....subroutine to check l �=� KA�L0�D�2 � � :L0�L0��G� :�  �="� � :� FLAG� � � :L0�L0��G� :�  :� �  >,:��.....subroutine to check D )>6� L�D�2 � � :D�D��G� :�  \>@� � :� FLAG� � � :D�D��G� :�  :� �  ~>J:��.....subroutine to check d �>T� � :� FLAG� � � :D�D��G� :�  :� �  �>^:��.....subroutine to check X #?h� 

 :� �:� FLAG� � �:SWRMAX�SWRMAX���L| :� 

 :       �  :� �  E?r:��.....subroutine to check x �?|� SWRMAX� SWRMIN�w�� � � :SWRMAX�SWRMAX���L| :�  �?�� 

 :� �:� FLAG� � �:SWRMAX�SWRMAX���L| :� 

 :       �  :� �  �?�:��.....subroutine to check S ,@�� SWRMIN�SWRMAX��  � � � :SWRMIN�SWRMIN���L| :�  |@�� 

 :� �:� FLAG� � �:SWRMIN�SWRMIN���L| :� 

 :       �  :� �  �@�:��......subroutine to check s �@�� SWRMIN�w�� � � :SWRMIN�SWRMIN���L| :�  "A�� 

 :� �:� FLAG� � �:SWRMIN�SWRMIN���L| :� 

 :       �  :� �  IA�:��          subroutine to check N hA�� NA� � � :NA�NA� :�  �A�� 

 :� �:� FLAG� � �: NA�NA�:� 

 :�        :� �  �A�:��.....subroutine to check n �A�� NA� � � :NA�NA� :�  /B�� 

 :� �:� FLAG� � �: NA�NA� :� 

 :�       :� �  9B� � MB� :� � :� � �B:��.....logic subroutines for data....................... �B&:��.....subroutine to check X �B0� 

 :�  :� FLAG� � �:SWRMAX�SWRMAX���L| :� � :�     � � C::��.....subroutine to check x PCD� SWRMAX� SWRMIN�w�� � � :SWRMAX�SWRMAX���L| :� � �CN� 

 :�  :� FLAG� � �:SWRMAX�SWRMAX���L| :� � :�     � � �CX:��.....subroutine to check S �Cb� SWRMIN�SWRMAX��  � � � :SWRMIN�SWRMIN���L| :� � 8Dl� 

 :�  :� FLAG� � �:SWRMIN�SWRMIN���L| :� � :�     � � ZDv:��.....subroutine to check s �D�� SWRMIN�w�� � � :SWRMIN�SWRMIN���L| :� � �D�� 

 :�  :� FLAG� � �:SWRMIN�SWRMIN��G�:� � :�     � � �D�:��.....subroutine to check N E�� NA� � � :NA�NA� :� � IE�� 

 :�  :� FLAG� � �: NA�NA�:� � :� � � kE�:��.....subroutine to check n �E�� NA� � � :NA�NA� :� � �E�� 

:�  :� FLAG� � �: NA�NA� :� � :� � � �E�� 

 :�   �E�� :� 8 :�  �E�:�� .F�:��.....subroutine to get data and calculate RA,LA,CA,and CB NF�� :� � :N� :TP���!ͳ�I� �F:��DIM A(8,9), B(8,9), X(8), NPIVROW(8,2),NPIVCOL(8,2) �F� :� :��:GOSUB 3250 ' unasterisk to load preloaded data G� "The program requires 4 sets of <Frequency, Rin, Xin> data. Associate \G � "each set of data with a number from 1 to 4. Enter the data by first �G*� "entering the data point number, then entering the F, Rin, and Xin" �G4� "values. Data will automatically be ordered by frequency, so it can " >H>� "be corrected. Change data by entering the data number, then entering �HH� "the correct data. When all the data is correct, press <CR> �HR� �H\� P� � :� P,:� "                                   ":� P �Hf� , :� "Enter Data Number ";A$ Ip� A$�"1" � A$�"4" � � :� \ :� N���(A$) ?Iz� "Enter Frequency (MHz)...";F(N) eI�� "Enter R (ohms)..........";R(N) �I�� "Enter X (ohms)..........";X1(N) :� �I�� , :� N� �  :� N � "#####.###  ";F(N);R(N);X1(N)          :� N �I�� N� �  :� F(N)� � � \ :� � N J�:��.....sort frequency data -J�� N� �  ;J�� M� �  }J�� F(M)�F(M�) � � F(M),F(M�) :� R(M),R(M�) :� X1(M),X1(M�) �J�� M :� N :� , �J�� , �J�� , :� N� �  :� N � "#####.###  ";F(N);R(N);X1(N)          :� N K�� :� "Is data is OK? <y/n>. ", A$ BK�� , :� "                                     " VK� A$��"y" � \ �K:��                 load matrix values �K� N� �  �K$W(N)�F(N)�TP :GA(N)�R(N)�(R(N)��X1(N)�) :B1(N)��X1(N)�(R(N)��X1(N)�) ?L.B(N,)��W(N)� :B(N,)�W(N) :B(N,)�W(N)��B1(N) :B(N,)��W(N)�GA(N)             :B(N,)�B1(N) LL8� N :N� eLB:��.....solve matrix �LLNC�N� :EPS�̼Y :DET� �LV� K �  � N �L`� J �  � NC �LjA(K,J)�B(K,J) �Lt� J : � K �L~� K �  � N M�:��      Apply complete pivoting strategy M�MAXPIVOT � ��(A(K,K)) >M�NPIVROW(K,)�K: NPIVROW(K,)�K aM�NPIVCOL(K,)�K: NPIVCOL(K,)�K qM�� I � K � N �M�� J � K � N �M�� MAXPIVOT � � ��(A(I,J)) � � �M�MAXPIVOT���(A(I,J)) �M�NPIVROW(K,)�K: NPIVROW(K,)�I N�NPIVCOL(K,)�K: NPIVCOL(K,)�J N�� J:� I ,N�� MAXPIVOT � � EPS � 
 6N � r QN
� NPIVROW(K,)�K � < bN� J � K � NC �N�  A(NPIVROW(K,),J),A(K,J) �N(� J �N2DET�DET�(�) �N<� NPIVCOL(K,)�K � n �NF� I �  � N �NP�  A(I,NPIVCOL(K,)),A(I,K) �NZ� I �NdDET�DET�(�) On� K�N � � � #Ox� I � K� � N >O�MULT � � A(I,K)�A(K,K) TO�� J � NC � K � � rO�A(I,J)�A(I,J)�MULT�A(K,J) zO�� J �O�� I �O�� K �O�:��.....Apply the back-substitution formulas �O�RANK�K� :NMR�N�RANK P�� RANK�N � X(N) � A(N,N�) � A(N,N) :NCOUNT�N�: � � 0P�� ��(A(N,N�)) � EPS � � r WP�� JJ� � NMR : X(N��JJ) � : � JJ gP�NCOUNT�RANK �P�� I � NCOUNT �  � � �PSUM �  �P� J � I� � N �PSUM � SUM � A(I,J) � X(J) �P"� J �P,X(I) � (A(I,N�) � SUM) � A(I,I) �P6� I ;Q@:��.....interchange order of unknowns to correct for column pivoting NQJ� K�N �  � � uQT� X(NPIVCOL(K,)), X(NPIVCOL(K,)) �Q^� K :� � :� :��  solve for RA,LA,CA,CB and return �Qh:�� �Qr� "Either there's an error in the data or this antenna cannot be " "R|� "analyzed by this program. " :� mR�:��------------------------------------------------------------------- �R�:��.....subroutine to get RA ,LA ,CA, and CB values �R�AA�X() :CB�X() :DD�X(): EE�X() �R�:��AA=CA*LA*GA, DD=LA*(CA+CB), EE=LA*GA 6S�CA�AA�DD�CB�(CB�AA�DD) :LA�DD�(CA�CB) :GA�EE�LA :RA�KA�GA jS�CA�CA��7m�KA : LA�KA�LA��7m :CB�CB��7m�KA �S�� CA� � CB� � RA� � LA� � � r �S�� �S�:��---------------------------------------------------------------------- 8T�:��.....subroutine to preload data (to activate, add "GOTO xxxx" after intro) ]T�F()�I :R()�aT� :X1()���8� �T�F()� �� :R()�ä� :X1()�f3� �T�F()���(� :R()�8�A� :X1()�|aY� �TF()�Z :R()���m� :X1()��� �T�  OU� FLAG� � � :� :� "Reqires negative elements. This program not useful for this antenna. Press <CR>.",A$ :� :� WU&:�� �U0:��                         Program Notes �U::��After the intro, the program loads starting values of SWR & L, then calcs $VD:��G(N)'s. It then goes into either a data or dimension mode. If data, it uVN:��goes to a SR to load data and calc RA..CB then returns to calc L's & C's. �VX:��It then prints the data screen and goes to the data menu. If dimension Wb:��was selected, the program asks for D, then calc RA...C(n), prints the aWl:��dimension screen, then goes to the dimension menu. The menus are similar. �Wv:��They allow parameters to be "tuned" within limits, and provide ways to �W�:��calc Zin or ZA. Because of all the subroutines, a CLEAR statement had to IX�:��be used to increase stack space to avoid an "OUT OF MEMORY" error. �X�:��Extensive "tuning" might still cause the error. �X�:�� �X�:��.....PRT �X�� �:� �:� ,:� , �X�� " Send this page to:(1)Printer Queue? (2)Printout? "; Y�� "(3)Next page? (1/2/3)";:� , <Y�Z$��:� Z$�"1"� Z$�"3"� � :� � � LY�� Z$�"3"� � �Y�� I%� � :� J%� � P:� ��(�(I%,J%));:� J%:� I% �Y�� Z$�"2"� � ��() :� � �Y�� ,:� �(P, );:�   