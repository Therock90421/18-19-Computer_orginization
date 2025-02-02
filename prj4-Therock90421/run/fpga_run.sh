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
����\fpga_run.sh �Xks�8���m���e��<z'Ulm����$P�~Tm�a�Ķ\�L�ݙ��{%�I�3�TW,ݫ�<�����s�s��������؝���}�1����.�V�0���;9�N���MG}L�?�u?O�w�t8��<vgGn��D�ݍ?φ}�c��t��NW�|��������oS��߃����O���B�:�]�v�qlǔ&�-h*��o��n�vo-��&��ѭ��"&:�i��`vwݷ�$��,*�������0>�f���z�4��Tа3GU�r���ث'7������1;���\��oln/X>�������\\�5Tn{IS{/���,i�~tkB߾0�w_0�Ҥ�k�Ÿ�1�Պ4(�!%lǩm5Ŷy�ݻϷ�������eGx��୨�l��`�BB��| V�W�S&x�1p�?��)�1�bE#�E�s�$<9�[��$�#R�
æv�3a,�4%�!_Sx��S+��<�4]�� c
sN�HB������몽����UO��9��\�I�Thm0� �������˦uhBL/��o�.Mӷ����>C�I�xO|-��� "!Ւy>xD�U�?����!> O�о �'�',B���x����o4��*mli#���tb&".����$����֮�Ⓚ���-����0=�u0�!v"&�`����h+Q��Lq�Vn2<�2C����2��Z�5����{X҈�0��@���B�'x��ڂ��'Yu�ʄ@�4&����*}�f�{���_� f��љ�!�n��t{��Q�}�@���<�=��+���>�F1n;uF<.=�-$��p|�t�-_�Q(�j����f>*�B�~&��7l� ��P�=���^U}%���
���|��[�:̭,��ִ��U���l��
A(�3��lɢPX�)_h�[�Dd$��x+QSiT�-+���D!_��FdO�nr�)�`Q��9���"N>M�M�R�:��H�����t��| K�Ɖ�=VŮ�
��K_�w�E7�HȎ�,��0~�D�`�J]?����Z�qp���������d2q��Fә.J;N�gGT�>]YB�.f���ثX�$(�B5̣%d���T =�%2F+[5&�b+�u7�φ�h�`�yʶ�N,P�B�����^I�R�9��c{�Q���rRR�'=��>N�VHx&d��#T��v�Y�d��������@�`�-�*ڮ��������(Z#����	"�@,H�PVJr�����&W����sQ<����U[6���* ���T�V[$r�8�H�v܈��v\\�]��6�'a���Y���:Gc�ǹ^;v��./'*�7��;:�uj�ԓHZʁ��NڰVN�>�VnF�ʃ��@��n�dp)Wk�V��+ae�J���N��>�b\t�P���d�,N�NB��O+9��Q���9�����Iш��w���;�����[��3�Ǜ���]���ף\���x�Zͻ�Q����<��_2��'����7-	���	E9p~	���1��w����T U兽���qh)�I#���r��kg��T�o�R/�+S�Z�dy��ůN��h����r�LIh��QX5Sɩ�,}��E(��X���;&�H��eA ̺��
|�[p���Ɛ�//�V��"ǵ�������+�%��2c�Nq9ժ����k-z�6Q$|�Y"�s�p�����V�e	X5#��)�v�ǣS�&Y�w���d
���B�F�2������#�5Z[b�0�9�i!�S+�����X2*l�;�ZF���UZ���ǃ�s���2s�X�ț
��2^�ap�"���c�=��	J�`k
h�>���yǪ�p>d�6���3�(A�Ü�!Iq�`"w���vp��:� �U��gY��N��e����	g��(�4�t{�=��t��{ݏ��t��N�,�QZ�:Q�Ԗ��_�ȣ��[��Ƃs�8�����q?�C�%\UZ�y�rߋ.H�����K����KYޔA��t���H���U�HH�H4�� �mQ���8F����ԃt������Q>:�|T���eX6x���!���Q	ѓ����֬��Y>�8��m��Խ��\���rG���KV�T��/��F���H�雤i�j��هCc�c
���|؏��e��x2|� I���Ц,ѽFi��9�5_}�Q�'��H�VN�$�*D�G� ��O\���{�����p����v  