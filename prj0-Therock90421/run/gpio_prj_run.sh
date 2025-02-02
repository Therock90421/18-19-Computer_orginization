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
���Zgpio_prj_run.sh �TQO�0~��a�M*��$X�:ZJ�B��B�q���cg�CU�?'i��Aռ$>�ww_|><�������L��Yr?�/⣣��[2�+
-
�אQo�sxבu [�(l����Ƿ��]ҟ�Fk�	L�Irߋ�q��Mx8�����j|ݏ��%����q�B�Ζ!Ir5��N�۸M��MPC�w71�6+���) |S�1��� ��3��+m�/\]dȟ�Z�JSBµx-7��)h��
�N⫧$Zd^��k�*�-.	�J˳\���䤝�����#�4ЉDf�*J\�9S�)%Y
�5��G�!�Cø/(W Y�x��������v��A�43)YfB"< �	Q8���.���HRM1��mL,M���#����ks�c_T��0��u���>#��P�߲��9
mu�����,[�w�O����9v|޼����D[J���d+L}' 1���ڀ
�.hh���Ѵ��|�*�_�=���x�ޅޘݴq^g�ը2=��-���?<kk������ր�iΕF5��T�aWg��k�[��Z}@a�°|�I	U��o;/TT&��j�S�"g�~�g@�� �΁	ޙ�T+�Ʀ����6϶`ߝ��?\j�>��7�u.�{ͼɡc�o/�?z���  