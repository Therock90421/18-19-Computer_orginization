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
��4\fpga_run.sh �Xmo�8�l���Vh����m�p��4qR�il�nZ�rPh����IA��f�v��7�i�t��["g8/�<3�O��9���!��듳Q4�.C��|�����>!��h�O��/g�wh�<�?��>O�h:����t��f"�(�۵���l���;��wx�{S�|��Ϣ���y0�ҾΒ�K���Ά'�ή,˂��\�)����~B.G���ٽ�l�E�W�.��U�U����eli�Qd�w��˔���Yt>�XM�Ai���QF�^{�`ue)Ձ�
�����`��a��y�����挐���Itz~Q��� N�R�"[�hM]��>�q��^�b�'�~cҷmaܷ�f���B��f�
����3)�M>_���}rkJ�˞�1?A�b��T�Â��������^٧L*�e�@p��t�1���b�tX����\��p%��?�Ҩp����7�ɂSr��[wB�XI�,dJ�@K01���yB�5t�g�å�n��vT~��O5���FsM�S4_2](��h��L��5X�=��!xq*7�W{]�M�#��� _nr��,��Ns;N$[��;�f�LfP�!��(~�E���̾������,�i���R����$�S��F���=���"J���{� �c�'\,�QVL�5��F�d�ۘ�6<q��i^�z�s����������qpkN�����nԚ8w�x�֨�X�����g���.0p��5��Q��Mqσ� �,	 ��)W�a�\�4+dX;W�%w1:MMd��.7�
�Z����kfb	%�y����m�o����?��fW�!�#���6ȫ��F�2��B&l�4��׹Jb���W�ѫ�!�c���2���ۚ~[P��эH�|����=`^o��TM�L6,0�WEki��ȕ����J��aZ�����+��U�ng+$A�m�����*� �9u�����4^q�v�X ԀP.
��΢t�M�+�����ՓB��-��+��C)�a��`�����MI�e�'{{��Mw�e�g{f|�RܥR�n��#a*6�	��i��u����3��ڝ�����f	���h�u8���\Ɓ`:Hض�ʼ�,�%k�G�r��9��Ք����@��.��mn,��H�vZ%�L�F�A4��|Qp������S9�{�+
I�@��ã��������4�Ϝn�]'+�pvӍ65�������i癕aVگg���D�F����cW�M�pZ(X���Pl��$�ws�����JӋ.Fkdcwv*U�$�RW/>�>��w�	�N?��k�.��D�n1���|e�t�V<<�����"��'����&�é8
��±�mq%��i7&x�G��q���޺_���ީ���s-�.��_�

"�r�lc����O���;�i���%��C�3�C�%����H܋�U<O�s��@�qd^ѷ�0eɱ=`��0
�xi��6)�t�)�b�dܷ`h�^W�����Jc�P�^��T"��L;s�ejXܞU\�@�P�{��	qOؽUaj/b����sx[`����"s���4����L1&���^����4*P�"��k��]�+��~s��.^��;M���/�n�ր���'�G��y |ǈ�{V�[��� ��1\ҍ�qWe,��E�ǎk�W;��t��9�T��f{�2�2��ߌ�=������q��C�-cM�9�d��ⁿ
�#�/���lg9s�H%��G��<��=��Ne��Y�~Y$�a�~ex��jͶU&������H��,����T�Nؑ�]��㔓5�%��S�S���˪��X��WKO�ׯ��5�r��_rJ���&ڿ���>��{u�43.�'������4�����������9f��  