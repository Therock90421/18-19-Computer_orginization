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
��h�Zalu_gpr_prj_run.sh �SMo�0=ǿbjr�Q�J�,m(�C=TUd'�H��*����[�=~����s�m��Tg����S���{Z&�@�hYj��U��
!�	G�e�{2'M�#���-B�`����*X%�i�z�p\�	O�}h�Y@<�%��&6_�TJ��j���(X�6�����Yn�k��Tk��^T�����ܕ�2�Gf,������v\�DH��{�n�:�Ne .v1W�$���E��6��a[���"禴QV�~<>��^��ϢL^�j\���Hq#�h]gz6@�a����{��AN+e��C�+�a0\�|�J�bt�x����O�����+�%rx/_1�X&��=�-��߯�G�`~"�dLX�o1��@;rX��U<9��4e=�y�(��_YP�#���Ykd)ּ�J��Zny\[?�&c�umZ�Fϖ��U��8�So�T2U���&9ߎ۹2�X
V����A��.iĮNhR��ug����`�4��Ū�*��&�0-f�  