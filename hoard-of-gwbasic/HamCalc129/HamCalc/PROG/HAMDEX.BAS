��
 :��\hamcalc\prog\HAMDEX - 18 FEB 94 rev. 21 NOV 2009 � EX$�"\hamcalc\prog\hamdex" � �� EX$ �( �:� � �2 � ,,:� , �< T��� 6F � " LOADING AND SORTING A LARGE FILE . . . PLEASE WAIT " MP � ���T�   � � P  [Z � � � � gd � ,, �n � A$(�,),F$( ,) �x UL$��(P,�) �� :�� �� :��.....load file �� � "I",,"\hamcalc\index\hamdex.fil" �� N� �� � ��()� �  � N�N�:� Y� �  � �# ,A$(N,Y):� Y $� � �  *� � :� � � :� | B� :�� R� :��....sort [� SN�N eSM�SN �SM���(SM�):� SM� � h �SK�SN�SM:SJ� �"SI�SJ �,SL�SI�SM �6� A$(SI,)�A$(SI,)��A$(SL,)�A$(SL,)� T @� Z� � :� A$(SI,Z),A$(SL,Z):� Z JSI�SI�SM:� SI� � , 5TSJ�SJ�:� SJ�SK �  ?^� " Eh� Mr:�� _|:��.....start e�� |�� ,:� �(P, ); ��� ��,:� "A L P H A B E T I C A L   I N D E X" ��� ,:� �(P,�); ��� , ��� ,$ ��� �
  :��preface �� �	  :��start a page �� `  �:�� (��:� F�� "Error";�;"in line";�:� N�:�� e:��.....Index menu t�:�:� :� �� " EDITING SHOULD NOT BE ATTEMPTED BY THE USER!":�  �&� �0� "   . . . . . . . press any key . . . . . . . " :Z$��:� Z$�""� : :� D D� Z$��""� �� EX$ ?N:�� to edit, CLS then goto 590 IX� MN$ Tb� UL$; tl� "Press letter in ( ) to:" v� UL$; ��� "  (a) ADD a listing to the Index" ��� "  (b) LOOK UP an Index listing" ��� "  (c) DISPLAY/PRINT Index" �� "  (d) Return to Index Menu" �Z$�� 3�� Z$�"a"� �:� $ I�� Z$�"b"� �:� d _�� Z$�"c"� �:� ` v�� Z$�"d"� �:�� EX$ ��� � ��:�� ��:��.....save data ��� �� "O",,"\hamcalc\index\hamdex.fil" �� Z� � N �# ,A$(Z,),A$(Z,),A$(Z,),A$(Z,)  � Z *� 4�:� | %>:�� GH:��.....convert to upper case vR� U� � ��(I$):V���(��(I$,U,)):� V�, � � �\� V�` � V�{ � ��(I$,U,)���(V� ) �f� U:� �p:�� �z:��.....inputs ��� � "ENTER Word or Heading..............? ";I$:� H �� 
�:�� =�� � "ENTER Subheading...................? ";I$ N�� I$�""� � ]�I$�", "�I$ c�� k�:�� ��� � "ENTER Supplementary note, if any...? ";I$ ��� I$�""� � ��I$�", "�I$ ��� ��:�� � � "ENTER Program Filename............ ? ";I$:� H � :�� +$:��.....new listing 5.N�N� K8� "NEW LISTING":� zB� Z� � :� Z � �,�,�,:A$(N,Z)�I$ �L� Z:�:Z�N:� v �V:�� �`:��.....screen display �j� �t� Z�� � A�Z� :� A� �~LN�:C�   :��line number,counter �  � Z�A � N �LN�LN�:C�C� +�  � Z� � � ;�Z$���(C�`) K�� Z� � Z� _�F$(C,)�A$(Z,) t�� " <";Z$;">  "; ��� ,:� A$(Z,); ��� ,:� A$(Z,);A$(Z,); ��� LN� � � "":�   ��� f     :��command line ���:LN�:C�   :��clear screen 	   � Z '
� f     :��command line 1� ` 9:�� T(:��.....return to menu �2�:�:� "There is nothing starting with ";I$;" on file......" �<�:� "Press SPACE BAR to return to Menu �FZ$��:� Z$�" "� �:� l �P� F �Z:�� �d:��.....search 3n� "ENTER first 1 or 2 letters of word";I$:� H DxL���(I$):F� R�� Z� � N q� � ��(A$(Z,),L)��I$ � � �� F�F�:F$(F,)�A$(Z,)�A$(Z,)�A$(Z,):F$(F,)���(Z):F$(F,)�A$(Z,) ��F$(F,)���(Z) ��� Z ��� F� � (  ��:��:IF F<=22 THEN 1170  �� F� � Z���(F$(F,)):� | C�ROW�     :��screen row number Q�� Z� � F _�ROW�ROW� s� � ROW� � " ~� � , � � ,:� "......press any key for more......"; � � , � � ��""�  :� ROW�:� �"� Z�
 � � " ";  ,� Z;"   ";F$(Z,);  6� ROW� � � "" ! @� Z + J� , X T� " ENTER item no. to select listing ";J b ^� , t hZ���(F$(J,)) z r� � |� "You have just looked up ";:� , � �� " ";:� Q� � :� A$(Z,Q);:� Q:� " " � �� , � �� UL$; !�� "Press number in ( ) to:" !�� UL$; ?!�� "(1) RUN program pertaining to this listing" X!�� "(2) EDIT Listing" s!�� "(3) DELETE Listing" �!�� "(4) Return to menu" �!�Z$�� �!�� Z$�"1"� �:X$�A$(Z,):�� X$ �!�� Z$�"2"� �:� � �!�� Z$�"3"� � �!� Z$�"4"� �:� l  "� � ":�� "&� UL$; B"0� "Line 1: Main Heading..........";A$(Z,) q":� "Line 2: Sub-Heading...........";A$(Z,) �"D� "Line 3: Supplementary note....";A$(Z,) �"N� "Line 4: Program filename......";A$(Z,) �"X� UL$; �"b� �"l:�� #v:��.....edit listing ##�� Q� � :� A$(Z,Q);:� Q:� "" T#�� &:� "Press number in ( ) for next step:" _#�� UL$; �#�� Y� � :� "(";Y;")  Change Line";Y:� Y �#�� "( 5 )  O.K. as is":� �#�Z$��:Q���(Z$):� Q� � Q� � � �#�� Z$�"1"� � �:A$(Z,)�I$:�:� v $�� Z$�"2"� � �:A$(Z,)�I$:�:� v A$�� Z$�"3"� � �:A$(Z,)�I$:�:� v h$�� Z$�"4"� � :A$(Z,)�I$:�:� v �$�� Z$�"5"� �:� � :� �                      :��sort and save �$�� � �$�:�� �$:��.....delete listing %�:� "Are you sure you want this listing deleted ?  (y/n) %Z$�� 3% � Z$�"n"� �:� � E%*� Z$�"y"� > O%4�  t%>� X�Z � N:� ,(:� N�X:� Y� �  �%HA$(X,Y)�A$(X�,Y):� Y:� X:N�N� �%R� � :� �     :��sort & save �%\:�� �%f:��.....command line 25 �%p� ,:� , 7&z� "ENTER < >  or press�1-NEXT PAGE �2-PREVIOUS PAGE �3-ANOTHER "; U&�� "PAGE �4-EXIT �5-EDIT"; _&�� , x&�  Z$��:� Z$�"" � � �&�� Z$�"0"�  �&�� (Z$�"1") � Z��N � Z�:� $	 �&�� Z$�"1" � $	 �&�� Z$�"2" � Z�Z�0:� $	 �&�� Z$�"3" � �:� �	 '�� Z$�"4" � � � :� � $'�� Z$�"5" � �:� N 4'�R���(Z$)�` R'�� R�`�a � R�C � �:� f a'�R$�F$(R,) }'	� R$�M$ � � A$,F$:� 
  �'	�:�� R$ �'	  � � �'$	� �'.	:�� �'8	� ,
:� ,:� �'B	� " Options shown below are accessible only from an index page." (`	� , (t	� :� �	 (~	:�� -(�	:��.....find ?(�	� ,:� , �(�	� " PRESS A LETTER AT WHICH YOU WANT AN INDEX PAGE TO BEGIN " �(�	� �(�	� ,%:� " - or - " �(�	� �(�	� ,:� " Press 0 to return to main menu " �(�	� , �(�	� �(�	� UL$; )�	I$��:� I$�""� �	 4)�	� I$�"0"� �:EX$�"\HAMCALC\MENU\HCAL":�� EX$ k) 
� ��(I$)��a � ��(I$)��z � I$���(��(I$)� ):� 
 �)

� ��(I$)��1 � ��(I$)��5 � ��(I$)�5 � 8	 �)
� �)
� Y� � N �)(
� ��(A$(Y,),)�I$ � Z�Y�:� �)2
� Y �)<
�:� , *F
� "There is nothing in the Index starting with "; ?*P
� ,:� " ";I$;" ";:� ,:�"." g*Z
� ,:� "Press any key.........." w*d
� ��""� d
 �*n
�:�:� 
  �*x
:�� �*�
:��.....preface �*�
S�:T� �*�
� �S�); +�
� "Each page has a prompt line to select one of the following options:" +�
� �S);  +�
� �(D,�) T+�
� �T�);"Prompt                         Option" _+�
� �S); n+�
� �(D,�) w+�
T� �+�
� �T); �+�
� "< > RUN PROGRAM       Press any letter in < > to RUN a PROGRAM" �+�
� �T); ,� "  1-NEXT PAGE         Press 1 to display NEXT index page"  ,� �T); f,� "  2-PRECEDING PAGE    Press 2 to display PRECEDING index page" q,"� �T); �,,� "  3-ANOTHER PAGE      Press 3 to display ANOTHER index page" �,6� �T); �,@� "  4-EXIT              Press 4 to EXIT"; �,J� �T); ;-T� "  5-listings          Press 5 to add a or edit a listing" C-^:�� I-h� Q-r�  �-|� " Options 1 to 4 below are accessible only from and index page." �-�� " To select an index page or return to menu, follow instructions "; �-�� "above. �-�� �	  .��   