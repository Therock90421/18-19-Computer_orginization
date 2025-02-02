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
��z[fpga_run.sh �X[s�J~F�����
$�ֺJ[�`lS�6`'U�-y��Z�LI#�^~����2"�q�9<�B���ׯ�y��]F��$�Ʋ��w�g1�\yNߺ��}��e�&��?=�Ͽ�yv_}l�������̟��˸p{[��EN3u6��.F^�/�^�S��{�Y�^�prs�T�x xX��,])����A�9w9�Y�
�����-�j2Dz�X^6=�?�o��(�D���:.fW��%��i����EuD�b��<^��㫑���rA��E���3��s7O>��p�AQ,Ng����zn-�U�%O$��u>�8������AL��]�5���5�ԗ��׻!�}v��*}�>�}��oN�B9[	���s�i���ʠ����?�Ҡp�� ���!ZAe<���B�CFI�|!6�gy$X������j��?-���ա���=�2���H���@�I[���"a�"�JF��𘲧6,9�Xy��@���d��%�?���]E�+Z�������r��d)���dk*�4O��aF��y	�d��`�v�"�k���񜏖�yL߁��cПB A��0J��YL���jβ"�1��ktz�_��G螃��G��Y�"��Gx�Ұ�*�H�:v����421)@�=�P���@hkSk�iLIN%� H�c�G��0�J� ����b���w�t����d�X�wH,c�1r���EoaMS���ҽ�D:��`���6ɬTJ���oϓ���۵�m$�^� F��ё9��f����Oc<ާ)�
a���e,��bs�r�Q��A�)�5c���mE���Ӑ.���eTB�o`>�E���l�cًz��h���hho���+�^9�.s�����^�`i:�x��U��`�AJy!T�%Y�� �e+�(�!!�&J��$�Ė�]ew&���tv#��B��c����=���#N>TE��E�\�U�3���؊�(�R�H����r���B.?@Υ�]�TyLь�'dEB��#����d�Z�OX�`��w��?d��C��Vg:������B'��3�)nH�U���=F�ۚ�Y��&(�B1Q@k�
{P����H��1ZX�1:�^��:���d1��S�!Zi�S�Uzb��T��@N�����(w������Q��^2R��@Zf4������B�҉Rl�Bq�C�S����t�r�eѸն�zqӶ'b����2i�n�����3D�X�S���͍⡟ (�#L)Rc�zq9�y�c[�|~Y��y���يD"����l#��-؊����³�g�,
�%�B���P�9*��zm�Lu�2�phT�_�ft�$(�4��RO �R	t�kvҊ-0;p���=F�Y�t����^Sw��%�Q�J���՗Ľ^m�p<�1Q�%Ys�D�~UNB�X�O9��Q1��&�ψ*H֔�����:8)2s�9��Ùw��no�Gg��b5^���z�7�}�w��l�7�a�TJ�l�kB�k�ܴ$���U:q~����=c[5��ч�S���L�:D�W�ơ�&M���4��ۈ �X�}��}פzu]��7�O'��]ǣ�\@��h,�*̚���.�L�k(��1��C$���q�lS��
|�.�p�@KeH�:A:�S�hQ�Z���[F�����]���."��x�=�iV\��Z���mI�(��U
�Y�	��W���C��y��k����H��q=�ΡZρ�d�(MF�X��1y$�
�ƫ��#@�,R��D+�Nmh�p�C�쨰+w4ĵ�*��UZ������3���:r�Z�Ȼ��4~������`�i�"�iMpP
D���:��� �����w�K��}f�M� ���,.��K�W'${��"�E�G7�K��T>�7���C	O�1LA3Lݜ�Ei�Ԍ��{���T�F��<m(+0��\Y�L2�%�a�6	���*��hL+�3F,s��!-/8gX�{&C�����羢��ѓ���3���l�����L[�}�ăk� �^�{��X����V'35f�����v\c�t|�������KϬ�����ZrSn�'��6��^�
�p���V����T-�m��:�+e^�xb�����N�(5���Ŏ7ûw�%�]�K�Ɩ)���P�j�*��p_���N�&_��$�]�B�V�$��������?�ƿf��P�; *?  