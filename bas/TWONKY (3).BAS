��
 �:��);"Twonky" � ��);"Creative Computing"  ��);"Morristown, New Jersey" ( �:�:� )� � � 8� � A(,) A� R9� K� � & y� � "-------------------------------------" � � �� � � �� � �� � "Move or Shoot"; �� � Q8$ �� � ��(Q8$,)�"m" �  �� � ��(Q8$,)�"s" � � �� �  � "Which way (F/B/R/L) "; � Q$ ."� ��(Q$,)�"f" � T G,� ��(Q$,)�"b" � r `6� ��(Q$,)�"r" � � y@� ��(Q$,)�"l" � � �J� �  �TX5�X �^Y5�Y� �h� � �rX5�X �|Y5�Y� ��� � ��X5�X� ��Y5�Y ��� � ��X5�X� ��Y5�Y �� X5� � � �� X5� � � %�� Y5� � � 7�� Y5� � � A��  n�� "That move takes you out of the Maze." �� "Move not allowed." �� � �� (A(X5,Y5)�) � &,l,v,�,�, ,� �&� *** EMPTY SPACE *** �0A(X,Y)� �:A(X5,Y5)� DX�X5 NY�Y5 !X� "Move allowed." +b� � Ll� *** IMPOSSIBLE TO GET HERE lv� *** BLOCKED SPACE ROUTINE ��� "That space is blocked." ��� � ��� *** RELOCATION ROUTINE ��� "You've been  R E L O C A T E D  ! ! !" ��� �
 ��� A(Z,W)� �  �� A(Z,W)�� � � "�A(Z,W)� /�A(X,Y)� 7�X�Z ?�Y�W I�� � k�� *** CHANGE ALL, SUPER TRAP. �� "   You hit the Super Trap!!  You get a new Maze." �� & �� � � � *** HE WON! *** �*� 4� "I don't believe it but you won the game!" ->� "You got to the Objective before" MH� "   the Twonky got you!!" SR� Y\� {f� "Do you want to try again"; �p� Q$ �z� ��(Q$,)�"y" � �  ��� ��(Q$,)�"n" � �
 ��� f ��� *** HE LANDED ON TWONKY!] �� "You stepped on the Twonky!" �� � %�� *** SHOOT ROUTINE C�� "Which way (F/B/R/L) "; L�� Q$ e�� ��(Q$,)�"f" �  ~�� ��(Q$,)�"b" � $ ��� ��(Q$,)�"r" � ` ��� ��(Q$,)�"l" � B ��� �  �S1� �S2�� �� t �$S1� �.S2� �8� t �BS1�� LS2� V� t `S1� "jS2� +tR1�X 4~R2�Y A�R1�R1�S1 N�R2�R2�S2 `�� "Z A P --"; ��� R1� � R1� � R2� � R2� � � ���   ��� "FIZZLE . . ." ��� "Shot left Maze." ��� "Shot missed." ��� � � � A(R1,R2)�� � 2 
� "BLAST!!!!" � "You hit wall." 3� "Shot missed." =(� � U2� A(R1,R2)�� � � e<� " Ouch!!" ~F� "Twonky retreats." �PA(R1,R2)�R9 �Z� �
 �d� A(Z,W)�� � Z �nA(Z,W)� ��X1�Z ��Y1�W ��� � ��� " �� *** PRINT TWONKY AND OBJECTIVE DISTANCE �� ,�� "The Twonky is"; L�D���(��((X2�X)��(Y1�Y)�)) T��D; h�� "Units away." ��� "The Objective is"; ��D1���(��(X2�X)��(Y2�Y)�) ���D1; �� "Units away." �� �� �"� *** TWONKY'S LOGIC �,� D� � � �6Z2�Y1 @Z1�X1 J� X�X1 � � )T� X�X1 � � :^� Y�Y1 � | FhZ2�Y1� Pr� � \|Z2�Y1� f�� � r�Z1�X1� |�� � ��Z1�X1� ��A(X1,Y1)�R9 ��R9�A(Z1,Z2) ��A(Z1,Z2)� ��X1�Z1 ��Y1�Z2 ��� "Twonky Moves...." ��� � ��� D�� � �  �� &� "> > > SCHLOORP !!! < < <" \� "The Twonky has just absorbed you!!  You lose." f� R �&� *** SET UP NEW MAZE ROUTINE �0� *** 1=PLAYER, 2=BLOCKED SPACES �:� *** 3=RELOCATIONS, 4=SUPER TRAP �D� *** 5=OBJECTIVE, 6=TWONKY N� *** 0=EMPTY SPACES !X� *** CLEAR MAZE 1[� B0� �  A]� B1� �  PbA(B0,B1)� Ye� B1 bg� B0 qv� I� �  {�� �
 ��� A(Z,W)�� � � ��A(Z,W)� ��� I ��� *** PLACE RELOCATIONS ��� I� �  ��� �
 ��� A(Z,W)�� � � ��A(Z,W)� �� I '�� *** PLACE THE SPECIAL TRAP 1�� �
 G�� A(Z,W)�� � � TA(Z,W)� o� *** PLACE THE PLAYER y� �
 � � A(Z,W)�� �  �*A(Z,W)� �4X�Z �>Y�W �H� *** PLACE THE OBJECTIVE �R� �
 �\� A(Z,W)�� � R �fA(Z,W)�  pX2�Z 	zY2�W $�� *** PLACE THE TWONKY .�� �
 D�� A(Z,W)�� � � Q�A(Z,W)� Z�X1�Z c�Y1�W i�� o�� �	� "Do you want Instructions"; �	� Q$ �	� ��(Q$,)�"n" � �
 �.	�:�:� �L	� "This is the game of Twonky." j	� "You have landed on the Planet of Twinky and" Jt	� "its King (Kong: Their King is King Kong) has" ~	� "captured you.  He has put you in a Maze that" ��	� "is 15 x 15 units long.  You are in the dark" ��	� "and cannot see...  You must get to the objec-" �	� "tive square and be set free." �	� 2�	� "     Hazards Include:" `�	� "Squares that you cannot go into (30)." ��	� "Squares that randomly throw you around the Maze (22)." ��	� "Square that sets up a new Maze and all that's in it (1)." �	� "Monster called Twonky that chases you and will" L�	� "    absorb you if the distance it is from you" m�	� "    falls below 2 units." ��	� "    Twonky is also immune to all traps including" � 
� "      walls." �

� �
A$��:� A$�"" � 
 �
� "    You can:" % (
� "Move one square at a time to find the Objective" M 2
� "     or escape from the Twonky." � <
� "Shoot at the Twonky one direction at a time." � F
� "  If the Twonky is hit, he will be replaced in" � P
� "        the Maze randomly." � U
� !Z
� "If the Twonky absorbs you...You lose." F!d
� " If you land on the Objective Square you win." L!n
� _!x
� "Good Luck!" e!�
� k!�
� �!�
� *** SUBROUTINE TO GET 2 RANDOM NUMBERS �!�
�(��(��(��,))) �!�
Z���((���)��) �!�
�(��(��(��,))) �!�
W���((���)��) �!�
� �!�
�   INE TO GET 2 RANDOM NUMBERS �!�
�(��(��(��,))) �!�
Z���((���)�