��l
 � �l �:��26)"PUZZLE" �l �:�:� m( �"  THIS PROGRAM IS A WORD SEARCH PUZZLE GENERATOR!!" Lm2 �"THE PROGRAM TAKES A SET OF INPUT STRINGS,PURGES ALL" �m< �"NON-ALPHABETIC CHARACTERS OUT OF THEM, AND INCORPORATES" �mF �"THEM INTO A WORD SEARCH PUZZLE." �mP � �mZ � K�1 � 5000:� K �md � nn �"  IN THE COURSE OF MAKING THE PUZZLE, THE MACHINE MAY" Nnx �"FIND THAT IT CAN'T PUT A PARTICULAR WORD ANYWHERE, AND" �n� �"SO WILL ASK YOU IF IT SHOULD START THE WHOLE PUZZLE" �n� �"OVER.  IF YOU DON'T WANT IT TO START OVER, TYPING 'NO'" o� �"WILL THROW AWAY THAT PARTICULAR WORD.  IF THIS PERSISTS," Ho� �"TRY EITHER GIVING LESS WORDS OR BIGGER PUZZLE DIMENSIONS!" Po� �:� \o� � 15000 so� ��A(Z)��(�(0)�Z�1) �o� �"HOW MANY COLUMNS DOES YOUR PRINTER HAVE";TW �o� �"DO YOU WANT A SOLUTION PRINTOUT";X$ p� �"WHAT IS TO BE THE WIDTH OF THE PUZZLE";W:MD�W p� � W�2��TW � 250   Kp� �"THAT WILL NOT FIT IN";TW;" COLUMNS.":�220   ]p� � W�1 � 220   ~p�"THE LENGTH";L:� L�W � MD�L �p� L�1 � 260   �p�"WHAT IS THE MAXIMUM NUMBER OF WORDS IN THE PUZZLE";M �p"� M��2 � 310   q,�"SORRY; THERE MUST BE AT LEAST 2 WORDS.";�280   q6� -q@� A$(L,W),W$(M) JqJ� W(M,3),DXY(8,2),DD(28) �qT�"NOW ENTER A HEADING THAT WILL BE PRINTED OVER THE PUZZLE:" �q^�"(";TW;" CHARACTERS MAXIMUM )" �qh� XY$ �qr�"OK . . . ENTER A WORD AT EACH QUESTION MARK."  r|�"TO REDO THE PREVIOUS WORD,TYPE A HYPEN (-)." Tr��"WHEN YOU RUN OUT OF WORDS, TYPE A PERIOD (.)" br�� I�1 � M �r�� T$:� T$�"-" � I�I�1:�"REDO ";W$(I);". . .":�410  :�420   �r�� T$�"." � M�I�1:�620  :� 430   �r�� �(T$)�0 � �"INPUT ERROR; REDO:":�410  :�440   s�J�1 1s�TE$��(T$,J,1):� TE$��"A" � TE$��"Z" � 520   Qs�� TE$�"A" � TE$�"Z" � 480   vs��(T$,J,1)��(�(�(T$,J,1))):�520   �s�� TE$�T$ � T$�"":�430  :�490   �s�� J��(T$) � T$��(T$,J�1):�530  :�500   �s�� J�1 � T$��(T$,�(T$)�1):J�J�1:�520  :�510   t�T$��(T$,J�1)��(T$,�(T$)�):J�J�1 6tJ�J�1:� J���(T$) � 450   Ft�"-";T$;"-" ^t� �(T$)��MD � 570   �t&�"THAT'S TOO LONG, I'M AFRAID."; �t0�" TRY ANOTHER ONE:":�410   �t:� IZ�1 � I�1:� W$(IZ)��T$ � �:�590  :�580   uD�"YOU ENTERED THAT ONE ALREADY.  TRY ANOTHER:":�410   uNW$(I)�T$ "uX� I Dub�"THAT'S IT . . .";M" WORDS." lul�"NOW LET ME PONDER THIS . . . . ." |uv� I�1 � M�1 �u�� J�I�1 � M �u�� �(W$(I))��(W$(J)) � HZ$�W$(I):W$(I)�W$(J):W$(J)�HZ$ :� 660   �u��:� �u�� I�1 � 8:� DXY(I,1),DXY(I,2):� v�� I�1 � 28:� DD(I):� @v�� 0,1,1,1,1,0,1,-1,0,-1,-1,-1,-1,0,-1,1 ~v�� 2,4,6,8,2,4,6,8,2,4,6,8,2,4,6,8,2,4,6,8,2,4,6,8,1,3,5,7 �v�� I�1 � M �v�LN��(W$(I)) �v�NT�0 �v�SD�DD(�(27)�1) �v�SXվA(W):X1�SX�(LN�1)�DXY(SD,1):� X1�1 � X1�W � 740   ,w�SYվA(L):X1�SY�(LN�1)�DXY(SD,2):� X1�1 � X1�L � 740   LwNT�NT�1:� NT��W�L�2 � 820   {w�"COULDN'T FIT '";W$(I);"' IN THE PUZZLE." �w�"DO YOU WANT ME TO START OVER";A$ �w � �(A$,1)�"Y" � 710   �w*W$(I)�"":�900   �w4J�SY:K�SX �w>� P�1 � LN xH� �(A$(J,K)) � A$(J,K)���(W$(I),P,1) � 750   BxRJ�J�DXY(SD,2):K�K�DXY(SD,1):� P Px\J�SY:K�SX txf� P�1 � LN:A$(J,K)��(W$(I),P,1) �xpJ�J�DXY(SD,2):K�K�DXY(SD,1):� �xzW(I,1)�SX:W(I,2)�SY:W(I,3)�SD �x�� I �x�� I�1 � L �x�� J�1 � W y�� A$(I,J)�"" � A$(I,J)��(�(26)�64) y��:� 'y�� I�1 � M�1:� J�I�1 � M By�� W$(I)��W$(J) � 990   fy�HZ$�W$(I):W$(I)�W$(J):W$(J)�HZ$ �y�� K�1 � 3:HZ�W(I,K):W(I,K)�W(J,K):W(J,K)�HZ:� K �y�� J:� I �y��"HOW MANY COPIES OF THIS PUZZLE DO YOU WANT";N z�� "POSITION PAPER AT TOP OF FORM.  PRESS ANY KEY WHEN
READY.": 8z�HT$��:� HT$�"" � 1020  gz� C�1 � N:� 16425,0:�1040 :�1350 :�:�1210  sz� PRINT �zT�(TW�2�W)�2 �z$� �(TW��(XY$))�2);XY$ �z.� �(138);�(138) �z8� J�1 � L:� �T); �zB� K�1 � W:� A$(J,K)�"." � � ". ";:�1110 :�1100  {L� A$(J,K);" "; {V�:�:� *{`� �(3,�(138)) _{j� "FIND THESE HIDDEN WORDS IN THE ABOVE PUZZLE:" i{t� " " w{~� J�1 � M �{�� �(W$(J))�0 � 1190  �{�� W$(J), �{�UM��((J�5��(J�5))�5):� UM�0 � � �{��:�:��(5,�(138)) �{�� �{�� �(X$,1)�"Y" � 1230  �{�� |�� ,|�� I�1 � L:� J�1 � W:A$(I,J)�".":�J:�I :|�� I�1 � M \|�LN��(W$(I)):J�W(I,2):K�W(I,1) k|�� P�1 � LN �| A$(J,K)��(W$(I),P,1) �|
J�J�DXY(W(I,3),2):K�K�DXY(W(I,3),1):� P �|� I �|XY$�"HERE IS THE ANSWER KEY:" �|(� 1040  �|2� �(138);�(138)  }<� $}FSP��(16425):� �(60�SP,�(138)):�   