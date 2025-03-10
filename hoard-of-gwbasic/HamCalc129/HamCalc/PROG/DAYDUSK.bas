��
 :��\hamcalc\prog\DAYDUSK - Daylight, Dawn & Dusk - 24 MAY 01 � �:� � � � EX$�""� EX$�"EXIT" �( �� EX$,PROG$ �2 � ,, < PI����()  :��3.141593 F A�PI� P B�PI .Z C�  @��PI 9d D��PI Jn U1$��(P,�) [x U2$��((,�) c� :�� z� :��.....title page �� � �� � , �� � " DAYLIGHT DUSK & DAWN CALCULATOR"�B)"Author Unknown "; �� � ,:� �(P,�); �� � ,:� ��, *� � " Edited for HAMCALC by George Murphy, VE3ERP " 4� � , N� �:� �
   :��proloque Y� � U1$; z� � " Press number in < > to:" �� � U1$; �� "   < 1 > run this program" �� "   < 2 > run Sunrise/Sunset program" �� "   < 0 > EXIT";  "Z$��:� Z$�""� " ,� Z$�"0"� �:�� EX$ )6� Z$�"1"� h S@� Z$�"2"� �:��"\hamcalc\prog\riseset" ]J� " cT� k^:�� �h:��.....data input �r�� �  � :�:�� �:�  �|� " ENTER: Latitude, in decimal degrees (minus if south)...";Z1 �� ��(Z1)�� � LAT$�"S":� LAT$�"N" �LAT�Z1�9�{ \�� " ENTER: Longitude, in decimal degrees (minus if west)...";Z2 ��� ��(Z2)�� � LONG$�"W":� LONG$�"E" ��LONG��Z2�9�{ ��UT���(Z2�)   :��UTC time differential ���� �  � :�:�� �:�  �Z$�" Location..............  ##.#�"�LAT$�" ###.#�"�LONG$ I�Z$�Z$�".   Local UTC Zone: UTC +## hours" e�� � Z$;��(Z1),��(Z2),UT p�� U1$; x�:�� ��� " ENTER: Year...........";H �� " ENTER: Month no. .....";I �� " ENTER: Day no. .......";J ��� �  � :�:�� �:�  ,&� � " Date (y/m/d).......... ####/##/##";H,I,J 40:�� a:� UT=FIX(Z2/15)   'UTC time differential iD:�� sN� Z �XZONE��UT��
  :��UTC time zone �b:�� �l:��.....day of year �vK���((I�)�) ��X�H� ��Y���(X) ��Z�X�Y ��� Z� � � �K�K� �H���(�I�) &�H�H�J�K� .�:�� K�:��.....rising phenomena S�I� [�J�A e�� � m�:�� x� U1$; �:�� �R��z7 � � �)"local solar" �*� �)"time" �4� � �>� " Astronomical Dawn..... ";V$;" = ";UTC$;" UTC"; H� "   Sun 18� below horizon"  R:�� -\R����T~ 7f� � np� " Nautical Dawn......... ";V$;" = ";UTC$;" UTC"; �z� "   Sun 12� below horizon" ��:�� ��R���V} ��� � ��� " Civil Dawn............ ";V$;" = ";UTC$;" UTC"; �� "   Sun  6� below horizon" �:�� �R���Inz %�� � \�� " Sunrise............... ";V$;" = ";UTC$;" UTC"; ��� "   Top of sun at the horizon" ��:�� ��� U2$ ��:�� �:��.....setting phenomena �I� �J�C �$� � �.:�� �8R���Inz �B� � )L� " Sunset................ ";V$;" = ";UTC$;" UTC"; NV� "   Top of sun at the horizon" V`:�� cjR���V} mt� � �~� " Civil Dusk............ ";V$;" = ";UTC$;" UTC"; ��� "   Sun  6� below horizon" ��:�� ��R����T~ ��� � �� " Nautical Dusk......... ";V$;" = ";UTC$;" UTC"; <�� "   Sun 12� below horizon" D�:�� Q�R��z7 [�� � ��� " Astronomical Dusk..... ";V$;" = ";UTC$;" UTC"; ��� "   Sun 18� below horizon" ��:�� � � U1$; 
� " UTC zone local SOLAR times shown. Times vary with longitude acro"; &� "ss the UTC  " p� " time zone at the rate of 4 minutes per degree of longitude.     " {(� U1$; �2� � �<:�� �F:��.....sexagesimal to decimal �P:�� �ZW� �d� Z�� � � �nW�� �xZ���(Z) ��X���(Z) �Z�(Z�X)�d �Y���(Z) �Z�(Z�Y)�d 3�Z�(X�Y�<�Z�)�W 9�� A�:�� ^�:��.....approximate time f�:�� {�K�H�((J�LONG)�D) ��:�� ��:��.....solar mean anomoly ��:�� �L�K�5�{ �L�L�Z k| �:�� �":��.....solar true longitutde �,:��  6Z���(L)  @M�L���|�Z " JZ���(�L) 2 TM�M��7u�Z @ ^M�M�<�� H h:�� k r:��.....quadrant determination s |:�� { �Z�M � �� d
 � �M�Z � �X�M�A � �Y���(X) � �Z�X�Y � �� Z�� � � � �M�M�5�"o � �N� � �� M�C � & � �N� � �� M�A � & !�N� !:�� .!:��.....solar right ascension 6!:�� H!&P���j����(M) T!0P���(P) \!::�� |!D:��.....quadrant adjustment �!N:�� �!X� N� � � �!b� N� � � �!lP�P�B �!v� � �!�P�P�D �!�:�� �!�:��.....solar declination �!�:�� "�Q��K���(M) "�Q�Q���(�Q�Q�) !"�Q���(Q) '"�� /"�:�� Q"�:��.....coordinate conversion Y"�:�� q"�S�R�(��(Q)���(LAT)) �"�S�S�(��(Q)���(LAT)) �":�� �":��.....null phenomenon �":�� �" Z���(S) �"*� Z�� � f �"4V� �">� �"H:�� �"R:��.....adjustment #\:�� #fS�S���(�S�S�) )#pS����(S)�A 9#z� I� � � C#�S�D�S K#�:�� k#�:��.....local apparent time s#�:�� �#�Z���{�K �#�T�S�P�Z���]� �#�:�� �#�:��.....universal time �#�:�� �#�U�T�LONG �#�:�� �#�:��.....wall clock time �#�:�� $	V�U�ZONE $	:�� /$	:��.....decimal to sexigesimal 7$$	:�� ?$.	Z�V I$8	� d
 W$B	Z�Z�Kvt� c$L	V���(Z) r$V	W�(Z�V)�< ~$`	X���(W) �$j	Y�W�X �$t	� Y�   � � �	 �$~	X�X� �$�	� X�< � �	 �$�	V�V� �$�	X� �$�	:�� �$�	:��.....conventional format �$�	:�� %�	Z$�"00" %�	HR$���(��(V),) .%�	HR$���(Z$�HR$,) B%�	MI$���(��(X),) W%�	MI$���(Z$�MI$,) j%�	V$�HR$�":"�MI$ }% 
UTC���(HR$)�UT �%

� UTC� � UTC�UTC�:� 
 �%
� UTC� � UTC�UTC� �%
UTC$���(UTC):UTC$���(UTC$,��(UTC$)�) &(
� ��(UTC$)� � UTC$�"0"�UTC$:� (
 &2
UTC$�UTC$�MI$ &<
� '&F
:�� A&P
:��.....normalization I&Z
:�� Z&d
� Z�� � �
 d&n
Z�Z�D n&x
� d
 ~&�
� Z�D � �
 �&�
Z�Z�D �&�
� �
 �&�
� �&�
:�� �&�
:��.....prologue  '�
� " This program computes times of sunrise, sunset, dawn and dusk at"; '�
� " any location." '�
� h'�
� " Enter the latitude and longitude of the location in decimal degr"; '�
� "ees. If the   " �'�
� " latitude is south of the equator enter the latitude as a minus ("; �'�
� "-) value or as" ,(� " a positive value if north of the equator. If the longitude is we"; C(� "st of the     " �(� " prime meridian (0� - Greenwich) enter the longitude as a minus ("; �("� "-) value or as" �(,� " a positive value if west of the prime meridian.                 " �(6� @)@� " Times calculated are local sidereal (SOLAR) times. Forget about "; W)J� "Standard Time," �)T� " Daylight Saving Time, local political time, UTC, or any other ma"; �)^� "n-made time   " *h� " system. Sidereal time is time referenced to the stars. It is the"; *r� " time shown   " e*|� " for millenia on properly installed sun dials.                   " k*�� �*�� " Related data can also be calculated using Hamcalc's `Sunrise/Sun"; �*�� "set' program. " �*�� �*�:�� �*�:��.....end �*�� �:� �  +�:�� +�:��.....PRT .+�� �:� &:� ,:� , j+�� " Send this page to:(1)Printer Queue? (2)Printout? "; �+�� "(3)Next page? (1/2/3)";:� , �+�Z$��:� Z$�"1"� Z$�"3"� � :� � & �+� Z$�"3"� � �+� I%� � :� J%� � P:� ��(�(I%,J%));:� J%:� I% ,� Z$�"2"� � ��() :� � 4,&� ,:� �(P, );:�   