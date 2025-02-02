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
�(��\mips_bench_run.sh �Um��6����k�Z�	�۞*���\�M�#/
�އ��9`7��!��n�{����VU��gf��3\|c/ef/y�&��xӾ��څ��{����S��H� Q<���h��w��kw|M��N�|֠��D0!sw<]�����Z��5�z���ڡ��C[�h���c8������z�y/;����ت?���]8f�l��v��NZ�tr`Ge������Q��Z��P�G��_�p#���)J�w��� �K����ͮ*��co�c5?�v�3ks4oM�@�M$�Y�SbYFp����h7���zUzl@E��wf���b���/��y���_ԯ��PS2v��D�X�礇�~	yٞWI��D%<�J���Q(��:7@����\���y�K��;Pv��� ��X�ZdȜ�
�����a��Z��m�ؾ�TDr��^E(��]��X�D�B�FƏ��\�2�"z�W���3hH�e]���p����y(@e��p3�`�����%���ԃ	^s��Tf<A�׈�S����&U�<ȒX����o�@��F��RWwBv���!�n���W�
��ډ������HU�T�B����Ζ벶TU��ŭ&���/�<��Y(�����ѭLED�4��޻�Cyv�Z��;�C��1���J:��`#Ҷg�X_/͔��Կ�|m�ϕ�W��'0o:<�7�kڙ�����CI��#�����i��P��R��J�s�?����x�q�[|���n")�	�%7���n��p�����C_ս�e���47�9�Nks$~�V��O����T&iʮQ��Cy8r��*�ϋ�_9��c  