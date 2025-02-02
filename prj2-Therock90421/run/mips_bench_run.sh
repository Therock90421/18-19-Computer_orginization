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
��.�\mips_bench_run.sh �Tmo�0���Ë4�ن&�I�.k��/j:�P�&Nk5����E���m:�bB�Cd����=w�^9S�;S��ס?l�ͦ�eR�1�V��D�C�&a*Y�!��(=��[��8���O����v����\&d���/�
�SIY��V\����|tm�\�x������5���y�ּ-�Y���!Z��exW`�A7���o��A>ٛ`�e|5p���i�����[�6$�Qٕ����9���%%�7hwMjH����<cj��'�N���^�ټ'�~�u�jU%4[�B�SBpJ,�v9*ꗟ���vV� ֋�c2����������s��/��e"*@�`o) �$V����7+�� �`*t	�`�x��6(�n���(�,�������B,��W������wb�s�#s<�K��RR��@��J��e6�
�M���2�MA/Eɛ��X��3��o&� �
t�#�?�3%�d�fY�x&o9�I���8���J�N���XR"`�J����3��A^�L�AC%���"�^��J�|��q�k�"H���<��u�1���l6)���oLw���,��Y��К�}�wxW�}���^�2�&(��
awLw�P6/ɧ^�^��)f_���zi`��N�{_<�"u�W>� �ٚ��+#4�8�a_�y�ǯ�[W�0���R��n7µ_��E�6�[8~c�x��3`SV����ſ����Q鶰�HQNS���V�u����4<�3�D��h�2�Ty�G~[��������R�q~��  