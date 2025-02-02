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
�n[�\riscv_bench_run.sh �Umo�6�,��C�+6[M�`@as��؆��A�%��,�%�K��ΔeIM����:�=w�܋N~��2���X�
������B�����y^�Z�m �8H��&d�1p�K�\������y��QqX�m�'��^Onp㣞V������p�9�_�vZ��׮��D�rq�^[Zv��<�rL���|�.���o�����o&-�u΋z9�NX��\z��C{
�R˰��� �knd�r2E	y�N�c�Y�N����l�|��]��[B��5�g`���V4�DR�CBpJ,�e�m��m�w-b��9��"��������b�Õ{������+���&})bU��V�K���}��KdQ�#��ȁ�0�BQ��6л�3�W�Zfhx���B,�g����� ���ʵȐ5�PWk���DA!��	d�t)4�C����6�C���R��wb���h?���j(r�X��<�����!i�uZ��V��қ"� �Y)�r6�Rq�K��Glq��Tf<A���R���q��v��˒X����Ƿ �r+R��3��={�Z��Ƥ��#2�ٗ��T�����ؒV�<��g��v��!����k�N��"�m�ۭ��}yt j�k�:���`:[��v(���"Rc�Z����ڔ�͗���y,``7��X'K`�tx�G׫������+��VY%����<W��9Ʋ��¥Qj����a;��}��V�'8}m�DR�g�����4Wp���U�
�	��v]�#���i�c{�2��'j���ʌO�2AH���4�Mx8�����q�˹�5  