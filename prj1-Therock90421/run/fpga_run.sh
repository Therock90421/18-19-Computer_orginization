#!/bin/sh
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
����\fpga_run.sh �Xmo�6�l���&4_f�v��ai�F�ذݴ�2(�D�ZdR)���oߑz��&N��Cl�w���s���osoA嚐�����8�����'�>�o�}w@�t<�����ө��͟�����l8fù�Ty�mʃ\�̬M��C�������?�*T>_��������
�/�@�Q��_����%����2�IO1�p���'�b|����β�lr�]vb�^�[�z2�^�ޖf^���!����L$��̓����X��R�Mo��0z����y� M��\[�H̏���y���^/�e�m�h�9��'g���J�-�6�����+K���	�}z���.}ن�}��oV�CR,���h�J�m��>�2������E7�@�b�S!�;�,��x	��a'b	��=��6O����=A�_�t�1�߈Z3N:,\p�Y&�#��iv�J*4�i[wP�K��2֮dl#�n���RIX��\��c
A��d�.���K��8����g���?��BQ}(���*�h4�2&��̩��>8a"�ȩO]Ս�!�c@@��3�bQF���X�lU���1��CU���A�C,��H�a�FH,Dq�B��N��*u�d	�� L��]��l*�(i�SD�]4E�|��2j�n
k�InB���p�B�y�/��-t���ށ�?�,�3���F�l"��ݘ�q�T�h#�1���BMq�"�#Ɲc(
�	k�'	��iEQ�^�4C��r
b�,I]�NG�Ui�8C)�A�����Tk�E��ݡ�*=�F�b:�P2�??.n"���vP�	y�=L\�S�t��ɑW��5ODx{͹��i���b��4W�k�"�c����"���ۆ~Y�8��k�E����=`�l��TM"u60G�Eki��蕀5�vJ��aZ�������6�n�k$A���TX]M�Q�լ:�ƙ�i�c�v�X T�P,���"U�M�K���:_��'�<}S�Q��ՇZ��DO%@���1BQ�e�';{�Mw�D�G<�g�R��	�c��#�+�T�|Î4Èն����'.��;�?:�!�A�"ҙL&���h6/@饙=Δ�m�%�y�Y"K�j2e5a���CVSVԃ��g�B�7�1�҈"M�i��3~χ�h���˂�o��P��ʱ����]�H���������!���:�f�P�����9$�bS͕.��#�o{?��85:�h��h���@�`�̠�K���	"9��4�[l*���A�xɔ�R�$���I��J�fɄPՋw�C�s�eBf�w� ���4�6"�9�t�nڊ�c$�.��}�+p���P����=�?�8Gg}.�^Qlj:]	'�ݍ���mpT6r�������w���x�きj�g�s�[˚o-g����O��; ��q:�8�6A�6iL�lҺjh>��T�<��0����yFD_��)��b�5B�+���F��w�0��mL�{��}�j�:hw�7��r�"����jک�N��-3M�f��b����O�����
S����y��K�v�u倩z�����^�3�G���AЁ픷������R���]]��c�J\A2w��t�>���`�%�ln�>��vk�6L:a�zt�_	���h��u���d�9��s�ze��x#D���*��ā:�g1^X�fZ,M�`�fA������L5�וC�� ނ2�e��&-*���>���D㚢�T��!��� �Gu�'����̱���/��=2�ޭ5�U\m�4�H�CR_O���Ƒ��X���{c�����q3����t��2�<�&�8���s󼂾՞uj�����%�+<U���sv)M�;E�7�gP�Gf����z�E"i�lC���~�����o�3�kj��k��  