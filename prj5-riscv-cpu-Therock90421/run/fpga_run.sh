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
�x_�\fpga_run.sh �X[S�J~�~EGQ���eL�P��%`�uv�Iղ%��؞��QI#��۷gFW09g����t����n�g/Yl/I�1�������[L&׮�W_��O��50��d�����s�tԏ�����|4�棅k�Dؽm{yFSu6�|Y�\�����a��Y�]����µ�����@$A���x���ǧ��$I��4��^�S�q=9Cz�X^6=�>�o�3�+o+O��k�ޒ�N�TH���:"�a|/����HIʞ2A��E���3�׳7�^a[ME�8�]����![�+�F�$��q1�<��..�
���d��J�ċHL�4U_��o�g���-�_��}�{��-��>�
e|%$�M�$��6��w��7�r��'���4(X�{�G'�C�`+(��)�RJ�'�b��%<c��O��A�B���!646:��p0Gi����I���D&P`Ԗn"�w&����4�[
1�a�3�����e�Oa�Ii��{��V���E	�P�\���,��tM���)� Hi��,A�lZ�&�`�!��2�,�:2��{��|	�1 ��<X��v�b��DTs5x�V���_�F���y|���2���I�b�����Uv��J�R���d;0�L�D��0�4��a������Ԋ}R�QI"�<�ãJ]a%b�	戊ۆ��b���w�&�#���sda��;$���4r����Ú��)��ҽ�"�๿kV*�d�	*Ҙ��U���ʃw&��B�R �_�����B��q�wq����8�]!Q�q�>����bs'�跽2c�T�����+�B��]���(�X������
�C�}Ʋ7,�0��P�=���^g}�W��r�Y�|;�;:;̝(��Ҵ��U����.��A(Nr��*ɲ�X�)_i�۲T�$���SSIT�-3���T&!_��Fdτ.r��`Uڧ{R�-C��/�8.���U����>��� (S�@�r�'�{�Xuw�L�dy"m���B�fV��	y"a�č$E�U�~�b����ap�����	��tꍾ����v�rߎ���-��<}�Rl+������0�V��� S�푬�c�����$;����F�'��7���l�1O�V�	*~P9�rb�d���������(�}�)[�/-k4Է����\��a16�H����g�⡊۪FS{p$��a4l�m�^X��ډط58�L�[l*���A dT(-es�x�E�������sQ>��|���86���� ���_kg+�&N:��@7i��Tק����8��W8�J��d���n�q�׆�T�+�	��Z���iF�\��NC�/�d �-@��f'���'�T��H7�cNPS�U���]vp��(�N)�+aU�*�%q��C�;	z��Β��Y"�S��!V��F�'EE��� �I�3�
E�5�z��3�N���9������{Ɠ���������4�\���X��Ǩ/�`�<��!_3�xK(u�77-	��uʄ2��p~	���1�
������T`�*{����qh-�Icl�<�(���ko�T�?թ^^W����r��ɯn����z�k��4F�*̚���.�L�i(o����;&�HvI;��>�MK��-�p�@eHT:A:�S��(p-��#3~�D��D]X���`O����֢uYE����>�J/�1 ~��j5^���P�m��뾩f�N���1.YB}�b���q����ᢛ�b�S�؛PC�P8�0?G،r��N�Ò�I�a2A�u>�nήܾS�E-2�ˣWdj�-$+I84'}��w�?��!�?��1�?B�����>88�Z4�u��EI�%�O�WT-I��ʂs�8Cp��������FԔe��S��<���{�5D}��?��8N�-<B�-j볪���^�J�j6O�!ɗ!�i�Y_~Wu;���:f�B��.�V��۪e��\�[���L�����pB�˴���X-zm$5:XTʼX`wռ*?Hͺ����f����+x�M��o����v�o�}C�����|U#7G�BD~�H����?���J���X���S����  