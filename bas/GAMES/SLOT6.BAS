�d
 �:THE FOLLOWING NEED TO BE CHANGED TO CREATE A NEW MACHINE � � LINES 120 TO 179 ARE THE PAYOFF MULTIPLIERS FOR ALL WINS   THIS VARIABLE DOES NOT EFFECT PAYOFFS IT IS ONLY USED TO DISPLAY PAYOFFS + � LINES 660 TO 700 SETS THE NUMBER OF SPOTS ON EACH REEL r � LINES 725 TO 880 IF ANOTHER REEL WAS ADDED IT WOULD BE DONE HERE � � IF A 4TH LINE IS ADDED DO NOT USE  D  FOR A VARIABLE IT HAS BEEN USED  � IF MORE SPOTS ARE ADDED TO THE REELS LINES  902 TO 906 AND 922 TO 926 AND 960 TO 1080 W" � LINES 2050 TO 2400 MUST BE CHANNGED TO SET NEW PAYOFFS �% � LINES 5072 TO 5190 PRINT ON SCREEN ALL PAYOFFS BEFORE REELS ARE SPUN �( � LINES 5024 AND 5025 SET PLAYER MAX BET �, � LINE 5025 PRINTS MAX BET ON SCREEN '- � LINE 199 SHOWS WHAT SLOT MACHINE THIS IS R0 � LINE 5030 PRINTS ON  SCREEN PAYOUT % �F � �:� ,,:CM�:� :� :� :�:�  ,:� "HOW  FAST  IS  YOUR  COMPUTER" �I �  �J � ,:� "1 - PENTIUM" �L � ,:� "2 - 486" �N � ,:� "3 - 386 OR SLOWER" P � , 'Q QW$��:� ��(QW$)� � Q  @R � QW$�"1" � CM���L VT � QW$�"3" � CM�( od � :� :�:� ��:� , �n SP�:CRE�d:SP$�"MEDIUM" �x P27�2:P26�:P25�:P24�:P23�:P22�:P21�:P20�:P19�:P18�:P8�:P7�:P6�:P5�:P4�:P3�
 � � 
,:� "SLOT  MACHINE  # 6" � SD�X *� SD�SD�� 9� � SD,   � F� SD�SD�d U� � SD,   � i� � SD�H  � �  u� EE�EE� �� � EE� � �  �� SD�� �� SD�SD�� �� � SD,��L| �� SD�SD�d �� � SD,��L| �� � SD�@  � �  �� FF�FF� �� � FF� � �  � GG�GG� #� � GG� � EE�:FF�:� �  ,� SD� :� SD�SD�� I� � SD,   � V� SD�SD�d e� � SD,��L| z� � SD�@   � �  �� HH�HH� �� � HH� � �  �SD�� �SD�SD�� �� SD,��L| �SD�SD�d �� SD,��L| �	� SD�@  �  �
II�II� � II� �  +� ,� ' i�D�:SCOUNT�:RS�SP�d:� ****** CHANGE # IN THIS LINE TO CHANGE REEL SPEED {�R1���(���)� ��R2���(���)�R1�:� *************  HOW LONG THE 2ND AND 3RD REELS TAKE TO  R3���(���)�R1�R2�:� **********  STOP AFTER THE FIRST A���(���)� ]B���(���)�:� ********* THIS IS WHAT THE 3 REELS START AT EACH SPIN nC���(���)� �0AA�A�:BB�B�:CC�C� �D� AA� � AA� �X� BB� � BB� �l� CC� � CC� ��A1�A�:B1�B�:C1�C� ��� A1�
 � A1� ��� B1�
 � B1� �� C1�
 � C1� �� �, ,�� , :� AA =�� , :� BB N�� ,:� CC �� , :� A:� *******  THESE LOCATE LINES ARE THE REELS SPINNING � � , :� B �4� ,:� C �H� , :� A1 �\� , :� B1 �p� ,:� C1 ��� SCOUNT��R1 � � �A�A�:AA�AA�:A1�A1� (�� A�
 � A� ;�� A1�
 � A1� N�� AA�
 � AA� e�� SCOUNT��R2 � � �B�B�:BB�BB�:B1�B1� ��� B�
 � B� ��� B1�
 � B1� ��� BB�
 � BB� ��� SCOUNT��R3 � � ��C�C�:CC�CC�:C1�C1� ��� C�
 � C� �� C1�
 � C1� 8� CC�
 � CC� lLCOUNT�COUNT�CM:�  ****************  DELAY LOOP SO REELS DONT SPIN TO FAST �`� COUNT�RS � L:�  ******************* RS IS WHERE DELAY LOOP ENDS �jCOUNT� �tSCOUNT�SCOUNT�D ~� D� � RS�RS�2:� ** MAKES DELAY LOOP SLOW DOWN *** REELS SLOW DOWN 7�Q$��:� ��(Q$)� � � ��D�:� �: � ********* IF D=1 SPACE BAR HAS BEEN PUSHED TO STOP REELS ��� ��WIN�:PO� �� A�B�C� � WIN�2 �� A�B�C� � WIN� �� A�B�C� � WIN� � � A�B�C� � WIN� *� A�B�C� � WIN� #4� A�B�C� � WIN� :>� A�B�C� � WIN� QH� A�B�C� � WIN� hR� A�B�C� � WIN� \� A�B�C� � WIN� �f� A�B�C�  � WIN� �p� A�B�C�  � WIN� �z� A�B�C�  � WIN� ��� A�B�C�  � WIN� ��� A�B�C�  � WIN� 
�� A�B�C�  � WIN�
 $�	� WIN� � BET�:� � >�	� BET� � WIN�:� � N(
WIN�WIN�BET \2
CRE�CRE� k�
� n,��L} w�
� /u, ��
� �,��L ��
� /u, ��
� , :� "CREDITS -"CRE ��
� , :� "PAYOFF"WIN ��
PO�PO� ��
� PO�WIN � BET�:� � ��
� 2
 ?��  ,:� "COINS IN -"BET:�  **********  BET IS HOW MANY COINS IN a��  , :� "CREDITS -"CRE"   " ��� , :� "REEL SPEED - "SP$ ��� , :� "MAX BET - 5 COINS" ��� ,:� "PAY OUT - 94.38 %" ��� , :� "PAYOFF"WIN"     " 	�� ,:� "R - CHANGES REEL SPEED" 0�� ,:� "SPACE BAR - SPINS REELS" W�� ,:� "SPACE BAR - STOPS REELS" {�� ,:� "Q - TO QUIT THE GAME" ��� ,:� "C - PUTS ONE COIN IN MACHINE" ���  ,:� "ADD TOGETHER" ���  ,:� "THE 3  REELS" ��  ,:� "27 PAYS "P27�BET"  " )��  ,:� "26 PAYS "P26�BET"  " M��  ,:� "25 PAYS "P25�BET"  " q��  ,:� "24 PAYS "P24�BET"  " ���  ,:� "23 PAYS "P23�BET"  " ��� 
,:� "22 PAYS "P22�BET"  " ��� ,:� "21 PAYS "P21�BET"  " �� ,:� "20 PAYS "P20�BET"  " %�� ,:� "19 PAYS "P19�BET"  " I�� ,:� "18 PAYS "P18�BET"  " m�� ,:� " 8 PAYS "P8 �BET"  " ��� ,:� " 7 PAYS "P7 �BET"  " ��� ,:� " 6 PAYS "P6 �BET"  " ��� ,:� " 5 PAYS "P5 �BET"  " � � ,:� " 4 PAYS "P4 �BET"  " !
� ,:� " 3 PAYS "P3 �BET"  " ;PA$��:� ��(A$)� � P RR� A$�"Q" � �"GO",R iS� A$�"q" � �"GO",R �T� A$�"C" � BET� � P �U� A$�"c" � BET� � P �Z� A$�"C" � BET�BET�:CRE�CRE�:� 4,:� � d� A$�"c" � BET�BET�:CRE�CRE�:� 4,:� � #n� A$�"R" � SP�SP�:� @,��L| Ex� A$�"r" � SP�SP�:� @,��L| Y�� SP�� � SP� ��� SP� � SP$�"VERY FAST ": � ******** SP$ SHOWS REEL SPEED ON SCREEN ��� SP� � SP$�"FAST      " ��� SP� � SP$�"MEDIUM    " ��� SP�
 � SP$�"SLOW     "  �� SP� � SP$�"VERY SLOW" - �� A$�" " � � 7 �� � O '� A:� A:� :� :�  U '� � �)� , :� "3":� LINES 10725 TO 10880 IS WHERE SLOT MACHINE � �)� ,
:� "4":� STARTS     GRAPHICS ONLY DOES NOT EFFECT PLAY � *� ,:� "2" � *� , :� "2" !0*� ,
:� "3" !D*� ,:� "1" 0!X*� , :� "1" B!l*� ,
:� "2" T!�*� ,:� "5" �!�*� ( , c)�( &,c),:� **********  11000 AND 11005 DRAWS PAYLINE �!�*� (n, c)�(,c), �!\+� ( , P)�(u,v),,B:� *********  DRAWS BOX AROUND REELS "f+� (�, )�(,, ),,BF "N� � 6"_�               SLOT6   