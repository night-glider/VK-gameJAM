GDPC                                                                                @   res://.import/button.png-7e4793faba21bbad54f7dfdfebc06704.stex  `X      �       v�ύ���%̰�Z�{<   res://.import/cat.png-ac9bdd638588658e9e4d5483e87ac256.stex @i      b      ���BT�wj�RB�-�x@   res://.import/panel.png-780075ef7ef7c4f0307e63af276cdd7b.stex   �[      �       �.�����>Z^8�i@D   res://.import/slider_base.png-3cf1f99197a37bdd035744fb25859320.stex  _      |       ��*,M��y^G�-k�H   res://.import/slider_pointer.png-2e8e7a1808f4b91b3d5e6b9dc664ab72.stex  pb      t       �������r}�aZ�!]�D   res://.import/textfield.png-571152218af82355e1dfd52b54a2f124.stex   �e      �       �ڨh�=\O-���    res://default_bus_layout.tres   p      7      �3�/a��������   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://default_theme.tres`      �      ���gcfqʮ#��   res://fonts/Hardpixel.OTF          �<      ��W�llآ}-�f�    res://locations/main.gd.remap   `q      )       �mw.7����^�]��   res://locations/main.gdc�L      �       ����!Z��6,6��ǁ   res://locations/main.tscn   �M      �
      z�銸mWu�s��cvQ�   res://project.binary�q      �      ]Tz4RmR?sB��� �P$   res://sprites/GUI/button.png.import  Y      �      �h��������3�0R$   res://sprites/GUI/panel.png.import  `\      �       +�K��l��%�51(   res://sprites/GUI/slider_base.png.import�_      �      ��@����[���ʹ�,   res://sprites/GUI/slider_pointer.png.import �b      �      Y ��)���{Cﶗ�1(   res://sprites/GUI/textfield.png.import  �f      �      
o�����G����Z�   res://sprites/cat.png.import�n      �      @"|\	��C|����        [gd_resource type="AudioBusLayout" format=2]

[resource]
bus/1/name = "Sound"
bus/1/solo = false
bus/1/mute = false
bus/1/bypass_fx = false
bus/1/volume_db = 0.0
bus/1/send = "Master"
bus/2/name = "Music"
bus/2/solo = false
bus/2/mute = false
bus/2/bypass_fx = false
bus/2/volume_db = 0.0
bus/2/send = "Master"
         [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [gd_resource type="Theme" load_steps=14 format=2]

[ext_resource path="res://fonts/Hardpixel.OTF" type="DynamicFontData" id=1]
[ext_resource path="res://sprites/GUI/button.png" type="Texture" id=2]
[ext_resource path="res://sprites/GUI/slider_base.png" type="Texture" id=3]
[ext_resource path="res://sprites/GUI/slider_pointer.png" type="Texture" id=4]
[ext_resource path="res://sprites/GUI/panel.png" type="Texture" id=5]
[ext_resource path="res://sprites/GUI/textfield.png" type="Texture" id=6]

[sub_resource type="StyleBoxTexture" id=2]
texture = ExtResource( 2 )
region_rect = Rect2( 0, 0, 32, 32 )
margin_left = 8.0
margin_right = 8.0
margin_top = 8.0
margin_bottom = 8.0
axis_stretch_horizontal = 1
axis_stretch_vertical = 1

[sub_resource type="StyleBoxEmpty" id=3]

[sub_resource type="StyleBoxEmpty" id=4]

[sub_resource type="StyleBoxTexture" id=5]
texture = ExtResource( 3 )
region_rect = Rect2( 0, 0, 32, 32 )
margin_left = 5.0
margin_right = 5.0
margin_top = 5.0
margin_bottom = 5.0

[sub_resource type="StyleBoxTexture" id=7]
texture = ExtResource( 6 )
margin_left = 20.0
margin_right = 20.0
margin_top = 10.0
margin_bottom = 16.0
axis_stretch_horizontal = 1
axis_stretch_vertical = 1

[sub_resource type="StyleBoxTexture" id=6]
texture = ExtResource( 5 )
margin_left = 10.0
margin_right = 10.0
margin_top = 10.0
margin_bottom = 10.0
axis_stretch_horizontal = 1
axis_stretch_vertical = 1

[sub_resource type="DynamicFont" id=1]
outline_size = 2
outline_color = Color( 0, 0, 0, 1 )
font_data = ExtResource( 1 )

[resource]
default_font = SubResource( 1 )
Button/styles/normal = SubResource( 2 )
HSlider/icons/grabber = ExtResource( 4 )
HSlider/icons/grabber_disabled = ExtResource( 4 )
HSlider/icons/grabber_highlight = ExtResource( 4 )
HSlider/styles/grabber_area = SubResource( 3 )
HSlider/styles/grabber_area_highlight = SubResource( 4 )
HSlider/styles/slider = SubResource( 5 )
LineEdit/styles/normal = SubResource( 7 )
Panel/styles/panel = SubResource( 6 )
        OTTO  �  0CFF u�N  �  )�GPOS��  �   OS/2X �      `cmap��ʬ  |  �head���   �   6hhea��   �   $hmtx���  	  |kern	��  �  :maxp �P      name_8@  �  �post�~   �          �@��_<� �    Ǎ�    Ǎ����8�             ��8 B����                �  P  �   I�  ��   ���  � 2 �       �    
        MACR @  !"��8 <� �       ��        >        Q         	 Q        Z       1 a       	 Q        �       	 Q       B �       % �      	       
 Q                '  	   �?  	  �  	  �  	  b  	  �  	  c  	  �  	  �}  	  J  	 	 K  	 
 �?  	  ,a  	  0�Copyright (c) 2010 by Anton Kudin & Jovanny Lemonad (prod.). All rights reserved.HardpixelRegularAntonKudin&JovannyLemonad(prod.): Hardpixel: 2010Version 1.000Hardpixel is a trademark of Anton Kudin & Jovanny Lemonad (prod.).Anton Kudin & Jovanny Lemonad (prod.)Anton Kudinhttp://www.jovanny.ru/http://www.abstrukt.com/ C o p y r i g h t   ( c )   2 0 1 0   b y   A n t o n   K u d i n   &   J o v a n n y   L e m o n a d   ( p r o d . ) .   A l l   r i g h t s   r e s e r v e d . H a r d p i x e l R e g u l a r A n t o n K u d i n & J o v a n n y L e m o n a d ( p r o d . ) :   H a r d p i x e l :   2 0 1 0 V e r s i o n   1 . 0 0 0 H a r d p i x e l   i s   a   t r a d e m a r k   o f   A n t o n   K u d i n   &   J o v a n n y   L e m o n a d   ( p r o d . ) . A n t o n   K u d i n   &   J o v a n n y   L e m o n a d   ( p r o d . ) A n t o n   K u d i n h t t p : / / w w w . j o v a n n y . r u / h t t p : / / w w w . a b s t r u k t . c o m /         "          "                                  	�
 !"#$%&'()*+,-./0123456789:;<=>?@A�BCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_                                 ճ  ��� ���      �   �            �    ����     �÷���     ���  �⯰�                            t   @ @    & ' _ ` ~ � � � � � � � ��O\_�     " & 0 : �!!"��     ' ( ` a � � � � � � � ��Q^�       & 0 9 �!!"���� ��� ]�� = :   .      ���%    �P    �B��        ���y�i�ߊߠ                2   2 8 :     : P   P f     d f j n               � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �  � 2    X  �  , 2X 2  2X 2  2� 2� 2� 2�  �  ^  �  , 2�  X 2^  X 2&  X 2& 2& 2&  X 2&  , 2^  �  �  � 2�    2X 2X 2& 2X 2& 2& 2X 2X 2, 2&  X 2& 2  2X 2X 2& 2X 2X 2X 2X  X 2X 2� 2X 2X  X 2^ 2�  ^  X  X  X 2X 2X 2X 2X 2� 2X 2X 2, 2,��X 2^ 2� 2X 2X 2X 2X 2� 2�  � 2X 2X 2� 2X 2X 2X 2�  , 2�  �  X 2& 2X 2& 2�  & 2� 2&  X 2X 2X 2X 2  2X 2X 2X 2& 2& 2X  X 2� 2X 2� 2X 2� 2� 2X  � 2& 2&  � 2X 2X 2& 2X 2�  &  X 2� 2�  X 2X 2X 2X 2  2X 2X 2X 2X 2X 2X  X 2� 2X 2� 2&  � 2� 2X  � 2& 2&  � 2X 2� 2& 2�  � 2�  � 2,���  X 2B 2, 2, 2&  ,��,��^  �  � 2^  , 2, 2^ 2�  � 2& 2X 2& 2X 2X 2 �  & 2�  X 2& 2�  �  �  R 2R 2R 2R 2�  X 2X 2X 2X 2�  �  �  �  & 2� 2&  X  X  � 2� 2, 2X                         �{                          6  \�  �  ��  ��  ��  ��  �� ( �j ( �j ( ,�j ( B�� ( D�� ( E�� ( F�� ( H�� ( N�� ( O�� ( P�� ( Q�� ( R�� ( S�� ( T�� ( V�� ( W�� ( X�� ( Y�� ( Z�� ( [�� ( ��j ( ��j ( ��j . 6�� . 8�� . ;�� 2 �j 2 �j 2 ,�j 2 ��j 2 ��j 2 ��j 5 6�� 6 �j 6 �j 6 ,�j 6 5�� 6 B�� 6 D�� 6 E�� 6 F�� 6 H�� 6 N�� 6 O�� 6 P�� 6 Q�� 6 R�� 6 S�� 6 T�� 6 V�� 6 W�� 6 X�� 6 Y�� 6 Z�� 6 [�� 6 ��j 6 ��j 6 ��j ; �� ; �� ; ,�� ; ��� ; ��� ; ��� G B�� G D�� G E�� G H�� G N�� G O�� G P�� G Q�� G R�� G S�� G T�� G V�� G W�� G X�� G Y�� G Z�� G [�� S �� S �� S ��� S ��� S ���      
  , latn      ��    kern              �     < B T � � � �Jd���dz$2DV\z���  ��  �� �� �� ��  �j �j ,�j B�� D�� E�� F�� H�� N�� O�� P�� Q�� R�� S�� T�� V�� W�� X�� Y�� Z�� [�� ��j ��j ��j  6�� 8�� ;��  �j �j ,�j ��j ��j ��j  6��  �j �j ,�j 5�� B�� D�� E�� F�� H�� N�� O�� P�� Q�� R�� S�� T�� V�� W�� X�� Y�� Z�� [�� ��j ��j ��j  �� �� ,�� ��� ��� ���  B�� D�� E�� H�� N�� O�� P�� Q�� R�� S�� T�� V�� W�� X�� Y�� Z�� [��  �� �� ��� ��� ���  r�� s�� w�� % �j �j d�� k�� ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j ��j  �j �j ��j ��j ��j $ �j �j d�� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��j ��j ��j  d�� z��  r�� t�� w��  r�� t�� w��  r�� s�� t�� w��  r�� s�� t�� w��  ���  �� �� ��� ��� ��� ��� ���  ���  ���  ��j  ��j     ( . 2 5 6 ; G S a c p r t v y z | � � � � � �  
Hardpixel 0� ���� �������#�'�\���|
'
��$I i      " + 4 = F O X a j s | � � � � � � � � � � � � � �'09BKT]fox���������������#,5>GPYbkt}���������������!*3<ENW`insz���NULLCRafii10017afii10018afii10019afii10020afii10021afii10022afii10024afii10025afii10026afii10027afii10028afii10029afii10030afii10031afii10032afii10033afii10034afii10035afii10036afii10037afii10038afii10039afii10040afii10041afii10042afii10043afii10044afii10045afii10046afii10047afii10048afii10049afii10065afii10066afii10067afii10068afii10069afii10070afii10072afii10073afii10074afii10075afii10076afii10077afii10078afii10079afii10080afii10081afii10082afii10083afii10084afii10085afii10086afii10087afii10088afii10089afii10090afii10091afii10092afii10093afii10094afii10095afii10096afii10097afii61352afii10101afii10105afii10102afii10054afii10103afii10055afii10057afii10104afii10056afii10053afii10071afii10023afii10062afii10110afii10052afii10100Euroafii10058afii10059afii10106afii10107uni00ADafii10061afii10109afii10145afii10193afii10060afii10051afii10099afii10108afii10050afii10098_0127_0152uni00A0Copyright (c) 2010 by Anton Kudin & Jovanny Lemonad (prod.). All rights reserved.HardpixelNormal �  	   P T Y _ j o u � � � � � � � � �	!'05:?CS`eh���������������� 	#(15<AEQWafmrv�������������������!(.38<FQ\`dhpuy��������������������������\ 
�\���\ ���$/
���'�\��:��W�t
�t
R'�'�6
�K
�K
�'��� $��'�\� ��K���\�\$
2��\�E
w
��1
���\')��\����\�7
��''���x��\''���0����'�\�%�K
����R�$�h�
�'!'�=�''z�H
��\ 
�W��'
������:
��'���R���
F
<'3
'�\'�\(�(
���w'Q
�0�\'P
'�\�,
�\�\�$>'A�� ��A
/�$�
�
�\�P�\���n�$6�v���$
��J�
�\��
N
Z
�\���\'�\��$V
��\ 
 
|���t
���\�\�YJ�\�P�$��\'���\ 
��1�v�PU
�PN
��������\�''Sh'V'��w��J���
�\��\A
'��k
���
�\'��
������\9�a��\'����\'';��\'�\����D
�\$
����' 
%
�\�'K�\�\��w�pwH������P'�Z�P��������� 
r
'�\��\'�$�\�v���
(
���
�\��e'�''��'6�}f
�$~��\>
'�����w��\ 
 
�\L���}'��\'''�6''���'�$���\��w��'�t'� 
�V����$�'$
w����\������\]
�\�
7'�\���\��$w�\�\�P
�
���\ 
 
����
�x��\��'���������\��
���R
e
'��'�������\M
�\��L���$
�$���
''��L��A
�\����v��J'�������  	7 B�A k j  x � z � u y    �  h  A  w  i � | � f �  �  �  o � s  p �  �  � �  t � g  �  �  �  r  �  # & ' ) ; G u �7t����JZp���>p���@r������� )=?_ac�������@}��� 8:QSo���������"6Gln����		E	Y	�	�	�	�
	

L
]
�
�
�	46EGSUWYd�����)L~���c�����"$9Ve��������%Dj����<a�����5����">Qq������
<Yi���;P����� "X����Qy����r����������ܝ���7�������������u�7���7�]��1��wQ�Q
�\��
���\ ��Pi
��v�����w�*�\ 
�'K
�\��\'|'''�
�'�\�L'�\'�\���\'�'�\'�\�!�@�V����'���'�@''�@''f��'�\�\'i@��\�@'�i@'���'�i@���@� 
'��\���\��@0��'V
�\��\'�\'�\'�\'�\'�\��V�
�J
�J
�c
�����{������\��\N
�����
������E�'��\���R
f''�
'Ք��\����\R'�P
��*��'����E�'���g
R'��
I'Ы�6
Е����������
�����e
���'''�''�'�\'�\'''�'�z��v�\ 
w�\��
�\��\�\'>
�\�
 ';���6
P�N
L
�1��\Q�\B�'V
,
'�\'�\����
�J
�J
�c
������N
[
t'���'���\o
 ���w 
��'���k
'���\��%
����\''�����$
� 
'��t��3
��\'�\�����
��\'V�]� 'f
*��� x���� ��v�
w �K����'k
��'�\����c���J���$���\'|]�X
�\�\�����\����)
N��|
�\�������(
VM�\�\�0��\'� 
'�\'�\��KF�K
� 
���'���'�'�+���lV�\�l�\��\�t'f''�\�X
��\��Z
��\����\ 
��
d
�\���'�\�\�\(
���'�t�1��\ 
Q�\6�\��B '��\�,
���6
h��\��B"
R�����\'�$��$�'�$L#���\�h
��\�\6��\ʁ�'�
��
��������\�
�$�$'���''���'����$����J
��\��'�C
��
'R
��$
�F
+�`
��VM��M�
=
VB
*[
�
�$�\o
�D�w
�f
���P��
�� 
���\rf
���P�\��zE
��K�\t�����~�v��8�P�\���XO0
^
��K���\�P�\F
�$
�'��� 
�\��苕w��\w
���\�P�!
g��
'��'��P�4��
��\N
4
*
m
P
�������t
Ԕ�$��'���'�'o
o�`
���e
b
���z
#
C��w ��J\
���p��w��\'���'�\��
Y
�����\���O��?
�J�
�\4���\���'���u
��JI
�\S'���\����\��'�����v�Pw��\��\��\8�$e
������\���\���\S�N
���\�\�:'�\�w
�\�K
�K
� 
���'���'�_�_�'�����
 m
�QJ�Pf
'���L�'V
,
'�\'�\����
�J
�J
�c
������N
 m
� 
�P'���''���P�$�'�\'@
��\��\4��A
H�'(��\T''�''&��\'4�
���'��L�&
'�R�$�$z
������\w"��\�\��7��z
,������\w"'�R�$�P<-��v�\�f
��\��e
�
R
��$
�Lf���������'�����\�����$R�\'''��v�$�l
�\�\�\�PG
9
+
'
�\w ��'n�P��\� ��w�
���
��'�
�O�v�$�8��A
�P���\�$��$G
�<
3�Gv�\&
�\��
b�GC
�\]
�$R��F
��v�$���\�*W'Fz1''�'�\'q
�'NR�kw��\'�\���A
�\�
��E�'���g
?�'���'�\�~
�����\�
�����\�$�O���$?
~
�$�'����A'�\<'
��\ 
X����w<�''V_
��A
n
�����'�\�:�l
����'��'d_h'�\����b�dK
��
R'k�
��\��J
�_��t
��\��'���x���g
�1<v�wQ����\�R'k�
��\I'���\�t
�'���6
�����K
�'�������
�\�
����P�
pR
�'�\�pL�C
��
'R
��$
�F
���\�c\��|
�
�$��P�
\�\'��B+�`
��VM��M�
=
VB
���\U���U'�\'�

 
�������'�\A
���'�\�t 
�'�\���$'�D�w
�f
���P��Ox
��\�JS'���\����\����\��'�����
�
���'�\�h
�@�\'�'��f
)@���x�@�����@'�
d
U@Lg��_�
�P�K
�
�w�pw��H���_��
�P�K
���'���^
�VA
� 
@$
���v�������P�$�\��
!
�v��8�P�\���X4
�v��$U�N
*
*C���\���w8
�O�v�\��������/
����F
''�\����'���R�\�\N
u
�JS'���\����\��'�����
�U'�\'�w��\ 
'�\����a
t�P��v��8S�\X�O��?
���a
�P���P�
��'�\'�w��\ 
 
'�\��J'�\�'���\��'a
z�P�P�'���\���\�
l\�\����t��
�\z
�O���\y���l^�\�����\�P�
�\'��\e
�P]
��V
w��\ 
x�V� 
'���\���\�P=
B
�Z
�\��
��K'�\�\q
��'��$'���\�OD 
��\�����'�
s�\'���\�P�\f
�
��z
o����\'��\�sf''���\��p
�&
'�R�$�$z
�)'�\��\R���U'������r
�t
U'�\�'f
U 
'���\��\��d
+���lV�\��'��\���1
VM��\1�\'�\'''�'��N��z
�2�m�\M�\|
��'��4'f'�f
U��x���'�
-�Oy
 
����''�\�\�\�T4�\�P 
'�\���'�\'�_R�J
�'f
R�j��?���%A
/�$�
�$�\�'
��\ 
X����w�\����\�v�$$�����
��v 
'�\�w�q������
�''��'��\��$
��'�����\�\�
�v�\���e
�\�\�����<3<
�Gv�\&
�\��
b,�v�$�{
�
�\�$N
_
S
��O�Gv�\�����\-
��R�\�\b��\�\�\��;
����F
y
ཥ�''T�U'�\' 
'�\����A'nt����
�\��\v
�\e
�\<��'�\�\�\���<�O���$?
�A
='n�����
��'�\' 
 
'�\z~
���P�'$
|'�$�\=�����
�\�
\����\t��$�
�z
�O��y|�V�t
���\�\�\��=
��'���$�
�����w��\ 
x�V�t
���\�\�\��=
��'�������
���\'q
��'��$'��'�O��������$/
�\�t�
��$
�'7�����\���)
���K''�\s'�''��\��
�O�v�����\H��\��
'��'��P�4���
�$
�$��6�\��0����e
�f
�$R�$����z"
#�K5��\'�
�\W��_�
_R����'�
t
�@�\���x�
x�������@K
�''�
_�@�'����K2
��'�\��\'�\'�\� �Kh���K
� '� ���'�
t
� t
T�'�
'� 6
�
K
�@K
��'�
�� '�
+
1''�'�\'q
�'N#
�'V
�\��\'�\'�\'�\'�\'�\��\ɀ�V�
ҀJ
�J
Ҁc
ɀ����{������\�$
�B9
O0
j
'�\Y�\Y�\������\��[�1�v�Pw��'�\Y�\Y�
J�P]
[ ';���6
P�N
�U'`��6
T���\'�&d�N
�O��\��\ 
 
p��\�\�\�\�i
 �$;��
�6
P�N
T
T
 �
�rP�d
�J
�U�$`�
�6
T���\'�&d�N
�U�
��\'�\���eT���\_��\�'�\�T��\'�J
�D�rv�\z����'�\���%�K
����R�$�h�
����9�Z
�\��$w
�f
���P�������9Z
��w��8
�\���f����S
��\������'����
�����
����P'�'��t
`L��
��\����U����f�$�
�'���g
��������
�\��w�\�H�� �W�\'�\'''�'��N��'�� ;���
� '���g
���H
��\ 
�*�''�'''�'�\'q
�'���'N�\���'��������\Nfv����v�
��� 
.�
��t�h���'�'�'�$ 
�'�\'��$''''�
��d�PLL
����\��� 
]���� 
'����\���$�\���
�$�
]�B
���V
w��\ 
 
|��� 
'���\��@=
B
�����\�G�
=
��'������wG4�\�\��M
=
��'L
�
�
��\���'�\� �VA
� 
@$
� ''���
� '��� g
'
�
��\���'�\U �����w�\����M �\��
� '��� g
'�\'w�dW
�P�\�Zt�\�PN
'�\'w��W
���\��$'�$t�\��N
���v�� 
�$
 
�
�\���\����\��'��\��'k��\D
�
��\���\'������'��\��'/
�U'�f
���w�D
���A
��|^'��\�����'��\�'/
�U�vf
���w 
 
��A
��|^����\��'��\�'�\�$
������'�'�$�
����v�$�'�\�
��V�'�'����V
�\�
�$�\�w 
'�����e
��h�P��\''f�$��P�
�Gv�� 
w{
�\�\�\>
��N
�Gv�\kw�I>
���\'�\�\�\M
�
��\�O'�
�
�������\�����`i'������P'�P�
��'���'Π�\�����\'�`���\'x'��L�O�����������
��i�P'�P�'����\W��'������$
����\����\�\�\ 
�1�Gv�U
�$���A������\��\����]� �   F v � � � � � � � � 7>BHZ^bm��������������������	$/<GL^ejox}��������������������	#*36<AFKTX_eimt{������������������ !%*/4:@EJOS��\��v$
'$
w��'q'�ڀ��� '_�
'� �'�� �
� �\f
�
�� �p
�5��\W�_�_R��'�t
��\��'j��g
������\'�)
��V��f'�\�\'k]�X
�\��\��0�\�\���\ 
����"�!'f
��%
�
f
��\7
�\'��
�\�
s
B
�1'�Y�\'�
�PQ
����PQ
�
�\��@
'�\w��\ 
 
$�V;
��m
wv
��J�
x]�pR
��75
2
��\m
%�'����1
�
�.'E��\ 
�l
'S�\�\�\(
���\��j
��\��\�\0.
�I
�v�$.
A
�$��G
��$s
4�\-
8�\��\���\��\v�\O
m�\���$�)
����V
�FPt��'�\���d�$
��\����%���\'�\&�t'��'���\n
�1���\Q�PBw��\��I�\�$w�!���'�t 
(
�\'��\\
� 
�m
:
��'�Z�\�\�P�
�
'�\��f���$w�
�r��\��Y
�P�\����\'(��\'������
��\'�\u�1}
]
�\�VK���
/�\'''�������]
t�
e
�\�
�'x
��\ 
�����v���
'
��\ 
'L�e�e
d
�v�w
n���\'�\I'�'�P�'�\�f��'��\)
�$''�
�$�� 
 
��$�\I
'''�\�\�\���$����\'�\��� 
w��\ 

'�\�$��\�
���w��\ 
�\��\������'���
��D
�P�
��\���������''F��$�\�
�v^�
�q�\7� '���\�����''���\�$�P��         GDSC                  ������ڶ   �����϶�   ��������������Ķ   ���϶���      default                          
            3YYY0�  PQV�  W�  T�  PQY`[gd_scene load_steps=5 format=2]

[ext_resource path="res://sprites/cat.png" type="Texture" id=1]
[ext_resource path="res://locations/main.gd" type="Script" id=2]

[sub_resource type="Animation" id=2]
length = 0.001
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite3D:rotation_degrees")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 0,
"values": [ Vector3( 0, 0, 0 ) ]
}
tracks/1/type = "value"
tracks/1/path = NodePath("Sprite3D:scale")
tracks/1/interp = 1
tracks/1/loop_wrap = true
tracks/1/imported = false
tracks/1/enabled = true
tracks/1/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 0,
"values": [ Vector3( 1, 1, 1 ) ]
}

[sub_resource type="Animation" id=1]
resource_name = "default"
length = 2.0
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite3D:rotation_degrees")
tracks/0/interp = 2
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 1, 2 ),
"transitions": PoolRealArray( 1, 1, 1 ),
"update": 0,
"values": [ Vector3( 0, 0, 0 ), Vector3( 0, 0, -30 ), Vector3( 0, 0, 0 ) ]
}
tracks/1/type = "value"
tracks/1/path = NodePath("Sprite3D:scale")
tracks/1/interp = 2
tracks/1/loop_wrap = true
tracks/1/imported = false
tracks/1/enabled = true
tracks/1/keys = {
"times": PoolRealArray( 0, 1, 2 ),
"transitions": PoolRealArray( 1, 1, 1 ),
"update": 0,
"values": [ Vector3( 1, 1, 1 ), Vector3( 1.5, 1.5, 1.5 ), Vector3( 1, 1, 1 ) ]
}

[node name="world" type="Spatial"]
script = ExtResource( 2 )

[node name="Camera" type="Camera" parent="."]
current = true

[node name="Sprite3D" type="Sprite3D" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, -3 )
texture = ExtResource( 1 )

[node name="AnimationPlayer" type="AnimationPlayer" parent="."]
anims/RESET = SubResource( 2 )
anims/default = SubResource( 1 )

[node name="Panel" type="Panel" parent="."]
anchor_right = 0.2
anchor_bottom = 0.3

[node name="VBoxContainer" type="VBoxContainer" parent="Panel"]
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = 5.0
margin_top = 5.0
margin_right = -5.0
margin_bottom = -5.0

[node name="Button" type="Button" parent="Panel/VBoxContainer"]
margin_right = 98.0
margin_bottom = 40.0
size_flags_horizontal = 0
size_flags_vertical = 0
text = "Я КНОПКА"

[node name="HSlider" type="HSlider" parent="Panel/VBoxContainer"]
margin_top = 44.0
margin_right = 194.0
margin_bottom = 76.0
max_value = 10.0

[node name="LineEdit" type="LineEdit" parent="Panel/VBoxContainer"]
margin_top = 80.0
margin_right = 194.0
margin_bottom = 120.0
text = "вводить сюда"
             GDST                  ~   WEBPRIFFr   WEBPVP8Lf   /���mO�^�l#�xB��*d�:�w�C���Ql�M~(�zw�	�t�$RXv~ٱ���@�B���q�{m.4�X�c�oi$[c�� c���Q���      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/button.png-7e4793faba21bbad54f7dfdfebc06704.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/GUI/button.png"
dest_files=[ "res://.import/button.png-7e4793faba21bbad54f7dfdfebc06704.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
          GDST                  |   WEBPRIFFp   WEBPVP8Ld   /���mO�^�l#�xB��*d�:�w�C���md�J^����Cu/�����g��� `Zk�PA�9�W�+�X"��Kkn�/��%v%K@ILk��        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/panel.png-780075ef7ef7c4f0307e63af276cdd7b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/GUI/panel.png"
dest_files=[ "res://.import/panel.png-780075ef7ef7c4f0307e63af276cdd7b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
             GDST                  `   WEBPRIFFT   WEBPVP8LH   /�'��mO�^�l#�xB��*d�:�w� 	�?۠���,` ��zyG�0��s���C�z��    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/slider_base.png-3cf1f99197a37bdd035744fb25859320.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/GUI/slider_base.png"
dest_files=[ "res://.import/slider_base.png-3cf1f99197a37bdd035744fb25859320.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           GDST                 X   WEBPRIFFL   WEBPVP8L@   /� ��m8D4�ݣ�m8D4�ݣ�m8D4��3��O%�$9��e������� 8߮��gN            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/slider_pointer.png-2e8e7a1808f4b91b3d5e6b9dc664ab72.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/GUI/slider_pointer.png"
dest_files=[ "res://.import/slider_pointer.png-2e8e7a1808f4b91b3d5e6b9dc664ab72.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
  GDST@                 �   WEBPRIFF�   WEBPVP8L�   /?�'��mO�^�l#�xB��*d�:�w� 	�?��8�� ���Kb�'屻W��E�_a�6L�`�x��	TZ�W�'�Ն� 殫��y���-��FԞj���fzDg�h�)0���{!�Ĩ�	0S�{ [remap]

importer="texture"
type="StreamTexture"
path="res://.import/textfield.png-571152218af82355e1dfd52b54a2f124.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/GUI/textfield.png"
dest_files=[ "res://.import/textfield.png-571152218af82355e1dfd52b54a2f124.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
 GDST]   F            F  WEBPRIFF:  WEBPVP8L-  /\@o�8�$G�F���x*_�a�N@l$I�}�uo3�v:�$I�����+{)̴]�"�G� 00@pF �P;r�bwÎL n�3��D&�u-&��qga�맷��W������, ����P&�!T/L�󇲨�/�P0���	�-So��&��-&�j�@Y�P	-P`�|X?P��US���_�����.u����2�Q-��'���`jz��,_/ �z>�{ty؏J������*��)B�r~}���0)L� e��D)�X�q8;����ڨ���|!�mMq�9�{�\qwܝ��{9ˆ�	v�_�o*��䧈�O�R��<o��� PUp�X,U�O$�=AՋ��~T��]�^�tY�M�x�P w��c�� `H���_W��t\'�b���"�Q�n�]�lY ��=�X7UEDvƶ�F{۹sg_�\�dɲ��'N�8y�ܹs��,Y��v��x�~�����
��"��K�����"R"}�A���� �n������Ba��a�:S#Ĵ��ƈB�PH�^�NH���0�U�}Z}���mT5�߳T�q�pl�Oz��ǌɢ�4�To�q.�ض��퐈�zR�jx�M8#�ٱ�ǭ��<���"��g�������\��_)�\�O��s9=����EfL
��"29�l6��<�K������m+�@k���8��J���!)"B� *嗘�6������8 *�^����~��٘�Ê>oLP���}���[cI�H:��N!�g��K$��_ݾy�QM���3 �l�$e����kwL2�xc]��Ӽ���������<#��I�Ļ׮]{Ck |��-����k�����n9�ED�s�ڵ?�e��o��v�Aw���}���ml��8Hq?���Oh&ǖ��d�ɧ�O��/�(��Z�^J)K~��w�)4��$}Z[����r|��I��}��Ƙ/��1?Pi������<�5 �^��1#\�=|�1���ѣ��Qہ�"��!ihE����R�4�q�E6��"s�]]]?�ݷ���ٳ�n��ٳ��ݻ����hJEm`����v�� Q���`^#�5 ��(�R�-���(�����+������ðDruhJre�A%a��ա�D2�UC���QE� �In{LRD���CRR��E��4��+bY��l���@��h�'���::���Ok=��N}JRk�Um�2 2�Ԙ��j�$\XcC�z5�l�y5�R�����taN�p^ռ�8Z�j�� 2�҄֎�[��8����*�{��I�
{�45���               [remap]

importer="texture"
type="StreamTexture"
path="res://.import/cat.png-ac9bdd638588658e9e4d5483e87ac256.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://sprites/cat.png"
dest_files=[ "res://.import/cat.png-ac9bdd638588658e9e4d5483e87ac256.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=1
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
       [remap]

path="res://locations/main.gdc"
       ECFG      application/config/name      
   VK gameJAM     application/run/main_scene$         res://locations/main.tscn   +   gui/common/drop_mouse_on_gui_input_disabled            gui/theme/custom          res://default_theme.tres   importer_defaults/texture�              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d                flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/normal_map_invert_y              process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/open_debug�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   `      physical_scancode             unicode           echo          script      )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres   