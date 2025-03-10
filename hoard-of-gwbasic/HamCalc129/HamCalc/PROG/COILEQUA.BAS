��
 :��COILEQUA - Coil Equation Calculator - 30 NOV 95 rev. 05 JUN 2006 � �:� � � � EX$�""� EX$�"EXIT" �( � PROG$�""� GO$�EX$ :� GO$�PROG$ 2 PROG$�"coilequa" H< �� EX$,PROG$,L,D,F,FQ,UH,LD,MIN,MAX,QQ,T,NT,WW,W TF � ,, uP PI����()     :��(3.141593) �Z � GA(() �d UL$��(P,�) �n A$�"#####.###" �x B$�"########.###" �� C$�"#####.### in.= ####.## cm" �� :�� �� :��.....start �� � 
� � , M� � " COIL EQUATION CALCULATOR";�9);"by George Murphy VE3ERP "; c� � ,:� �(P,�); m� � , �� � GO$�"tunecct"� GO$�"resicop"� GO$�"trapcalc"� LN�:� * �� :�� �� � " Press <1> for Wheeler equation program" )� � " Press <2> for Meyer/Miller/Nagaota/Dehoney equation program" D� � " Press <0> to EXIT" [� Z$� �:� Z$�""� �  q� � Z$�"0"� �:� GO$ �� Z$�"1"� LN�:� �:� LN:� , �� Z$�"2"� �:�� "coilnew" ��  �":�� �,:��.....start �6TB� �@� �TB�); 4J� "This program solves the basic equation for close-wound single-" @T� �TB); �^� "layer air-core coils as it appears in recent editions of the ARRL" �h� �TB); �r� "HANDBOOK. This equation was formulated by Harold A. Wheeler in 1928." �|� �TB); <�� "A more accurate equation presented by Mr. Wheeler circa 1982 is also" H�� �TB); ��� "used in the program to show the difference between the two (most" ��� �TB); ��� "apparent when coil length-to-diameter ratio is less than 0.4:1." ��� �TB�); +�� "In this program ";��(");"coil diameter";��("); W�� " is the diameter of the axis of the" c�� �TB); ��� "conductor (i.e., the pitch circle diameter). This is equal to the" ��� �TB); ��� "sum of the outside diameter of the coil form and the outside" 
�� �TB); G� "diameter of the conductor, including its insulation." U� �TB�); �� "The length of the coil is the distance between centres of the wire" �&� �TB); �0� "at each end of the coil for coils with an integral number of turns," :� �TB); MD� "or the number of turns multiplied by the pitch (i.e., centre-to-" YN� �TB); �X� "centre spacing between turns)." �b� �TB�); �l� "The program also computes coil self-capacitance and Q. �v� UL$; ��� " Press number in < > to: �� UL$; 8�� "   < 1 > Analyze a single-layer air-core coil" W�� U � � , :� � ,:� � `�� , ��� " < 2 > Run Coil Designer program"; ��� U � � �" for a ###.### �H, ##.###:1 L/d coil ";U,LD; ��� ,:� "" ��� "   < 0 > EXIT"; �� GO$�PROG$ � GO$�"\hamcalc\menu\hcal" �Z$�� 6�� Z$�"0"� �:�� GO$ S�� Z$�"1"� X�:LN�:� * c� U� �  �� Z$�"2"� �:� �	:FQ�F:UH�U:PROG$�"coilequa":�� "coildsgn" �� � � :�� �*:��.....start �4� , �>�� � LN � :�:�� �:� LN: H� GO$�"trapcalc"� � JR� " Press number in < > to choose standard units of measure:" U\� UL$; nf� "   < 3 >  Metric" �p� "   < 4 >  U.S.A./Imperial" �zZ$�� ��� Z$�"3"� UM�\�"�:UM$�" cm ":� � ��� Z$�"4"� UM�:UM$�" in.":� � ��� z 
��� �  � :�:�� �:�  �:�� )�:��.....data input N�� GO$�"coilq"� � �:� :�:� � u�� GO$�"resicop"� � �:� :�:� � ��� GO$�"trapcalc"� � �:� :�:� � ��� GO$�"tunecct"� � � ��:�� ��U�:R�:D�:L�:N�:T�:S�:F�:W�:WW� /�� " ENTER known factors ( if factor unknown, press <ENTER> )" :� UL$; H� U � $ �� " ENTER: Inductance (�H).........................";U:� � �$� D � B �.� " ENTER: Coil Pitch Circle Diameter (";UM$;")......."; �8� D:D�D�UM:� � �B� T � V 8 L� " ENTER: Turns per inch (2.54 cm.)...............";T:� � F V� N � j � `� " ENTER: Number of turns.........................";N:� � � j� L � � � t� " ENTER: Coil length (";UM$;")......................"; � ~� L:L�L�UM:� � � �� R � � 6!�� " ENTER: Length-to-diameter (L/d) ratio..........";R:� � @!�� � a!��� �  � :�:�� �:� :�  i!�:�� �!�:��.....find length �!�L�
:X� �!�N���(U�(�D�(�L))�D �!�� ��(T�N�L)���'p � � �!�� ��(N�L�T)����(X)� X��X�
 �!�L�L�X:� � �!�� " :�� "
:��.....find diameter P"D�
:X�               :��initial coil diameter ~"Y���(U�(�D�(�L))�D  :��number of turns �"(� ��(Y�N)���'p � F �"2� ��(Y�N)����(X)� X��X�
 �"<D�D�X:�  �"F� �"P:�� �"Z:��.....find diameter "#dD�
:X�               :��initial coil diameter 2#nL�R�D:N�L�T `#xY���(U�(�D�(�L))�D  :��number of turns z#�� ��(Y�N)��Qs � � �#�� ��(Y�N)����(X)� X��X�
 �#�D�D�X:� n �#�� �#�:�� �#�:��.....calculate �#�� NT � N�NT &$�� U� � D�L�N� � U�(D��N�)�(�D�(�L)    :��Wheeler 1928 equation Z$�� L� � U�D�N� � L�((D��N��U)��D)�(:� � |$�� L� � U�D�T� � � �:� � �$�� D� � U�L�N� � � 
:� � �$�� D� � R�U�T� � � Z:� � �$�� N� � U�D�L� � N���(U�(�D�(�L))�D:� � %� R� � L�D�   � R�L�D:� � 6%� L� � R�D�   � L�R�D:� � X%� D� � L�R�   � D�L�R:� � z%"� S� � L�N�   � S�L�N:� � �%,� T� � N�L�   � T�N�L:� � �%6� L� � N�T�   � L�N�T:� � �%@� N� � T�L�   � N�T�L:� � �%J� U�D�L�N�R�S�T� � � &T� ��(L)�� � h &^� V&h�:� ,:� " NOT POSSIBLE! . . . press any key . . .":� , f&r� ��""� r �&|�� �  � :�:�� �:� :� � �&�:�� �&�:��.....print �&�  A�D��\�"�     :��radius in cm. �&�  B�L�\�"�       :��length in cm. '�  LD�R           :��Lgth.dia. ratio >'�  F1��PI�
���N��A         :�ٿ �'�  F2���(�PI�A�B)            :��� Wheeler 1982 equation by Gary Bold, ZL1AN �'�  F3�33����L��B�A��Ga�(B�A)�  :�ٳ �'�  I�F1�(F2��F3)              :��� inductance in �H �'�:�� (��:� ,:� UL$;:� , A(�� " COIL EQUATION CALCULATOR ":� ,, p(�� U� � U1�U�
�:H$�" nH":� U1�U:H$�" �H" �(� " INDUCTANCE (Wheeler 1928 equation)...";� A$;U1;:� H$; �(� "  ( most ARRL Handbooks )" �(� I� � I1�I�
�:H$�" nH":� I1�I:H$�" �H" <)&� " INDUCTANCE (Wheeler 1982 equation)...";� A$;I1;:� H$ U)0ACC�d�(I1�U1)�I1�d �):� " Accuracy of 1928 equation............";� A$;ACC;:� "%" �)D� " Pitch circle diameter................";� C$;D,D�\�"� *N� " Length...............................";� C$;L,L�\�"� O*X� " Length-to-diameter ratio.............";� A$;LD;:� ":1" �*b� " Number of turns......................";� A$;N �*l� " Pitch (i.e., turn spacing)...........";� C$;S,S�\�"� �*v� " Turns per inch/25.4mm................";� A$;T +�WL�PI�D�N G+�� " Amount of wire in coil...............";� C$;WL,WL�\�"� P+�LN�� V+�� ^+�:�� +�� GO$�"resicop"� � ��:� � �+�� GO$�"trapcalc"� � ��:� �	 �+�:�� �+�� ,:� " Want to change coil length & pitch?  (y/n) " �+�� , ,�Z$��:� Z$�""� � ),�� Z$�"n"� � LN:� �(P, );:� f ;,�� Z$�"y"�  E,� � M,:�� g,:��.....change specs. �, �� �  � :�:�� �:�  �,*U�:L�:R�:S�:T� �,4� " ENTER: Coil length (";UM$;")......................"; �,>� L:� L� �   �,HL�L�UM:� � -R� 
-\:�� !-f:��.....estimate Q 2-p� LN�:� , k-z� " Want to compute Self-Capacitance and Q?  (y/n) " u-�� , �-�Z$��:� Z$�""� � �-�� Z$�"y"� � �:� LN:� � �-�� Z$�"n"� � �:� LN:� � �-�� � �-�:�� �-�:��.....calculate Q .�MIN�S�fff:MAX�S�333�:ZZ�� !.�Q�:ZZ�� /.�� F � 	 b.�� ,:� " ENTER: Frequency in MHz....";F:� , x.�� WW � W�WW:� 

 �.�� F� � �:� ZZ:� � �.	� � " Min./Max. wire size: ##.#### / ##.####";MIN�UM,MAX�UM; �.	� UM$;" dia. "��(,".") /	WWIN��:LN�WWIN 
/$	:�� %/.	:��.....AWG calculator [/8	K�(�k�
�#y)�(�')    :��increment multiplier k/B	� WG� � ( v/L	N�WG� �/V	GA(WG)��k�K�N �/`	� WG �/j	LN� �/t	   � WG�( �  � � �/~	� GA(WG)�MIN � GA(WG)�MAX � �	 �/�	LN�LN� �/�	� LN,< 0�	� � "AWG ## =##.#### "�UM$;WG,GA(WG)�UM *0�	   � WG 50�	� WWIN =0�	:�� _0�	� GO$�"trapcalc" � W�WW:� <
 g0�	:�� �0�	� ,:� " ENTER: Wire dia.(";UM$;")............";:� WW �0�	� , �0�	� Z$�"2"� W�WW:� �0�	:�� �0 
� GO$�"trapcalc"� W�WW :� W�WW�UM 1

� W��MIN � W��MAX � 2
 H1
�:� ,:� "In order to calculate Q, wire size must be"; z1
� "within the range of suggested sizes shown" �1(
� �	 �12
LN�ZZ:� �:� ZZ �1<
� " Frequency............................";� A$;F;:� " MHz" 2F
� " Wire diameter........................";� C$;W,W�\�"�; I2P
� � " = AWG ##.##";��(�k�W)�(��(0��))� X2Z
SW�S�WW�UM �2d
IHC���(SW���(SW��))  :��inverse hyperbolic cosine �2n
CO�PI�D�\�"��(fff��IHC)   :��distributed capacitance 3x
� " Self-capacitance.....................";� A$;CO;:� " pF" 13�
JJ��(�PI�)�
�    :��25330.29 D3�
FS���(JJ�CO�U) �3�
� " Self-resonant frequency..............";� A$;FS;:� " MHz" �3�
CR�JJ�(F��U) :��capacitance required to resonate �3�
C�CR�CO 4�
� " Added capacity required to resonate..";� A$;C;:� " pF" 4�
AU�U�(�CO�C) X4�
� "  Apparent inductance.................";� A$;AU;:� " �H" �4�
QT���(F�
�)�(��\��A���,��B)    :��true Q �4�
RT��PI�F�U�QT   :��true resistance �4�
RA�RT�(�CO�C)� 5�
� " True total resistance................";� A$;RT;:� " ohms" J5�
� "  Apparent total resistance...........";� A$;RA;:� " ohms" a5XT�
��(�PI�F�U) �5� " True reactance at resonance..........";� A$;XT;:� " ohms" �5X��PI�F�AU �5"� "  Apparent reactance at resonance.....";� A$;X;:� " ohms" 46,� " True Q...............................";� "#####";��(QT) G66AQ�QT�(�CO�C) �6@� "  Apparent Q..........................";� "#####";��(AQ) �6J:�� �6T� FS�F � � :� �  �6^�  �6h� " WARNING: Q Calculations NOT VALID at frequencies above self-"; 7r� "resonance !" 7|W$�"������!" .7�� ,5:� W$ ?7�� ,5:� W$ I7�� , U7�� ,
 �7�� "Ref. RADIOTRON DESIGNERS' HANDBOOK, 4th edition, pp. 451-464"; �7�QQ�Q:Q�:� � �7�:�� �7�:��.....clear screen �7��� � LN � :�:�� � �7�� �7�:�� 8�:��.....end 8�� : ,8� GO$�"tunecct"� �:� � I8� GO$�"resicop"� �:� � g8� GO$�"trapcalc"� �:� � y8&� ,,:� �  �80:�� �8::��PRT �8D� �:� �:� ,:� , �8N� " Send this page to:(1)Printer Queue? (2)Printout? "; 9X� "(3)Next page? (1/2/3)";:� , 09bZ$��:� Z$�"1"� Z$�"3"� b :� � � @9l� Z$�"3"� � v9v� I%� � :� J%� � P:� ��(�(I%,J%));:� J%:� I% �9�� Z$�"2"� � ��() :� D �9�� ,:� �(P, );:�   