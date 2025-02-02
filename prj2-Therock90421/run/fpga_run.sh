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
�E,�\fpga_run.sh �XmO�J���S�*_6q݋��� ��DIJ+-+3�'�,��e�C�����=3~�
�Ww��s�_�s&�����I׆q7�;�{���Ƶ���w��ʵz�1����|6�zᚎ�1�~r�}���l8wmK������4�g����u>�:�i��w�9˷����o/]�J���d�:��KMu1:��Q�qlǔ&�-i*QMG���x��;�c�lr�}��rg�Sj+O��koHb'/R�h�LDh�Fs�rt3Ԓ�m*i�Y�(�^u�v:��ɋC"m�Π)��ӫ��C{];d{ɒ�$�0.'W����*?C��4���x�dE�Э1}�`ܧw~e����a�7�݉2(K�8lǩm5����"���˭�?ʡ`��H���5��-�t�,��RH(	��/�Z?�"eR$[���M��	�Ӑkʍ���a���n�@�l�L%
���Md�Τ�dʔ�FbCᑋ'k���"�4]��b
A��H"��������4-Jp���g�����x!��$+*si0� 	������˦ul���,0+�˦q��h�����cҟ �/����C5pќ����H�����
��{�/��#�/���	G��	�����������F�*[�����db&��@�P<�@ه©/�x�V쓐��*I�d+2L�na���I&X#:okƚUe��Rܪ��
���ʐ����X�U��v�<z+�)2S	Ux�D:)2��T>���T%
�1�o/���ݛU�M$�^� f���3s��63�5���P������.����H_D��H2���1�(���L.���?E������<��l�c��67��,@�3�6�X���*��G�9��~�W���Y�|��[yu�{Yx��i����/��� �5��3��jɲ�X�X��a��H�׌SSKԅ�*���D�X�ՍȞʼ�s�M1�ҿ|&�O)��C�ļhb�z��/$@�{h�`j���,�#Uʵ�h�c��+�R��c�k� URt㸊��H�b�'4�#V��	��W<�������ʶ�sH��hM&o�m4��Eiǉ�mN��M�%��b��`[����8�.�|ZAVЁL%�G����Vm��M+�5~χ�h�>�e�yڶ�N,P��Ω�3s�$E�?Jm��v���D����!��6P��$�B"2�Z�q�F�׳�b�C5�U��v�DZ�0h��ʼp7�wAĹ��Så��P	p�'�� �R[���C/BP��0�H�$B������е�ڱa�f�������&Q�a⦣���F<LMqys~�m�;N�|y��Яt;Pu�ƺ\�^�;6Փ�('\v&�����Y��G�a�.]o��K�3�UmX����qn�r��_֌=��˷�S��� ��ѡX1�����d'�@�ƪ��ϛP�s�4���G�4*�9��3�Q�X�o"�ƀ���<^������~�0���U{�跻�/�U)A)�Y�0T>
�y>Z/%dw�h��V�FMV�L��֕�f@�!Z]�ˉ�kؿ�`�L�<C�`�8.��wlCA�
TCxPm��Vqk.���ˑ?b!A[�=�2�Oԭ��x�B�R���ъ����h<��-?h<Z��:X5#��i�v~e:PY'gpC2��oS�-�*B> _2�i�������T_�]���=DÌhp�簠�5"�#"6����`>o�n��s.2�ˢWd�?ZH:Ւp�GT���:��A��'��C����W��N��Y��9�u�Ԟ�$����SK������sN�Sp>�`;��)bq�ikT�uT�U�	V��lo}��G�Ek}��Ԁ�?�Q}�Q_	�ƭ����4�M<��/��m'���]۬5�Y��{�+��Z��r�$��Zxu3�S�S�D�_vi@1�\_4�@j�j���y��,�����6P~T��i��f����Kx�MU�o�R�jN���qo���3}++�*P7�B~�SI��c���Iw������F���� �f  