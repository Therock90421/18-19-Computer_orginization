#!/bin/bash
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���[fpga_run.sh �X�s�H��������a�ܺ��sllS�
�����<H�ZҨ���������=*#MwO?���w��E���køݞ����x|=���{��r`�c:����l��|`:�c"����2N��p>�y,��&��,��:���̇�c��w�~��Y�]������b`S��߃����O���RQ��N�kTq�1�Ij�
�����z|���ֱ�lr�~�h9,b�S�V��ͧ�{C;ɢB!��	��h�^���JR��
v(
�W�:{����UgP����p;`{ɒ�$�0.&����ť>C��4���!�Ȋ&�[c�v{�~�ޢ��J�7��~ߠ��PʗBr�$�S�j�m?y��闛�}���K��Ū#<t�{���{ ���xX��K!��|!��)�)<y2��xm
�O�_�X��hQo��&	ON��
$���@�aS��ߙ0�L��Аo(<D�1�5OE
K�@��Ap�>�'�o$!�fw�h]E�/P�L��/��dE���	�Oh��.A�lZ�&����firQ4��0Z��;�5��G����g�J�!�	"R͙��GX�����
�^�����`�̈́���	������{�Wi��7*YI�:�����T21@��?R_�QOhkSK�I@IJ%� H��3�*ta���A&�#*nkĊUF�%Cܪ��t���ʐ��<�XƲU˱v�,z+Qd��3H�>�t�g��-X)m�Y'��Hc�?^'W�3KޙH��J�~��#���63�5��E��t�0D��E�{<��W���]#���vʌx\2z�[H�/	��t��^�Q�j}�1�|<�p�e+nX�A*���{t������/O{�h3��f��tv�[Qx��i�ū�/��Y �5�PgB�aY�E9  ��[���a��H !��,����[fv�݉LB��ٍȞ
]�|S����O���)E��/�8ʋ��U�+�������/R�@�r�'�;�XUw�T�xy,mm�J�f���	Y,a���$A���~�b����~p�����	���d���fs��v�pώ��}�)��<]�RlK�W�����0����w S�푬�c4��U�$[��hM����;���Rc�ҭ�T�P9�rbn�������N���(�}o)[�'-�5�}�DRHx&d�G�����X�P�m����;��V�04ڶT/��v�D���&��6{x�� R*����Q<tC����T�@¹(^\�?�U;6���* ��V�V$9L�td�v����(.�O/f�㌓0O\�,�3}:�y��"�s�6l�:]�N8T*�oOS��u�~�'�m)�?4;i��8y$��Z�-+w����޺K�Z��
�_	+#V�/�;��܊���DEp�d��Y�������r>�+�`T�sL��+ړ����ٵw�d�	g7Wg�3?mM���:�������r�����j�>FuYok �橔��y�>��5_ߴ$���)�t>��%�p�{�4J�����Q��*O�5:D�W�ơ�&����(��F W����S��T�zq]��7�O'��]ǣ�Z@������0kf�����2	|���Wc��wL��v�|0�

(��[�!ก�ʐ�/t�tl+��"ǵ���[F���	�ua�1h�x�=ժV\h�Z�֥M	|�H��(�$Àx~�Ѫ�XVM��y���W���5�"\>Ҙzl�0U��b���E7�)�',�3��*�p�a�6~�eD!�:��[C�<`�d�*�k}ޜ]�N��Ȑ�,ߐ�	^�K:V�p�O�B��@��C�A��c�~��ߡ�8]ppzf�h�X�[�C"��o�Z��?���#p����q?�e�y�8����E�%�K����<�)��<J��j'PA��f�ũ�n�uБP�.��w*Nsw���p܋x�= ��Ϫ�}珂h_�h���N�xp�6����Q�+����.f��,_jpxe-������y@�Gn���jb�9!�g�0RCxc��&��l+e�����-�7���R��Ov�>|�$���j+�Lѽ�?-�9�4��#{�O��^��$7[�B�L�ǐ��O̷~g���}��]�����x[+  