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
�`h[mips_bench_run.sh �Umo�6�,��#�V[M�b@�u�6*��r�[��e��D���f�}'*���F���D{�Eg�8K�;KV�		>����v�N)��)(�Le��$L%��"d<���_�z�қ�F����n���1!so<]x�u��Jʪ�zA��ҥ���V<���y�1��=ױ���r�~-�P__����Eo>��i���9�*��K�r]���N�AXT�\���K;�J��ʲ����kmD�rsI	��M�C���y�Θ�8�E�~����5!��k@�`�>�[4�le����X�a���M������1�����hm1���˻t_�u�}M�M��=$��j>'=�었U�{�LEY��/�������n�s�%��%r4����B,��_@�=.(��Ī�<G�x��@=��z	%W���o�%W`�B�x,���VT�k�rVr�A����VAY�H$��O�t
29���Y�(���RmʂEd�e��٠K�T,�0J%�L���3��A�SL�AG%��Tr'*b%�g>�b���F��R�3!������&�n���r�y�ʺ&��.<���|�n������@��Ƹ�D����`H~�#f��#uvj�z0�Yo��1��Vw���j���8����p:[����(�ct�Hۜ-b�84���3�����`�
�X�p�<���������&��\������!t�7xu�0M�E+��R����ݖ��wNl+����7��Ӓ[2�n�7��4p���ϫ�+�%Ρ�WN��xm���ඓ+=���9!M������ه����^����Q  