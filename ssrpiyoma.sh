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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�2�;^ssrpiyoma.sh ��s�F�����()�ّCBkjZ�^fz�!����:����ؒ�#�Cs�vx�B
��N��'�ڙ�&�]gh	�&v����ۇ�,;�07������~�Ǯ�zQ*o����Ǧ��%���K����j�h�,M-�"�t�/d4�m��A���>�/ч�Y�h��������:��qlz�&�����	�7T� :��M�G�>O���Ɠ�t��H+�<7]O-��dQխ�ki��i4���tĲ��Nc�b��T}�V�<�ͤR^��<�$5���SG�Ҳ�d���i�Q������K�\]�RI���+I-��/w��<SX׫.��x��	1GQ��i����Z��z�Ύ���>}�}����Uұ��|'�Nv֮�@�[�C����	�꺃]71>���o��}��m$[h`zH~u�rpx�lr����HzOy5}6�����{�a�kz �&�c��k>�c�=�����+=2B�`H�E��H6�r a��4���'$�E��ff� ����'e�2���N�H�$O��a/J�j�%�&�=�( 5�Gu#�w0��R9��!�C��;������<�2)�	���<ݐ��?vf���P��`�h!i�q,'3U4\��}�CyLwR]��WB��}���E�C
}b�	�ǋ���d� ��X!z�\@)�i)�EՓ\ª����.��`!a���]܋�%$�j�ǐ��c��/	�R&P�<��\����I&˭_��77��>���nQc�����݋[�^����vi��q�Wj�l�%q	�W.H�%N0>ְ�Ƌ4B=w�1�$b�əA)n]�3��b*8N;]�l���64��4� ��q�_F8XV�mq>+	 e�0s0��?ϧ_z)��r����͢~�CT��|�DC���3��[�����K��`N���bPg9>AXdf�u��S�e�94���c��{{��?e�Y��0��V��b�;pSmK�#�=�����B��� ',,���1�� ��b�vp����C'!F��M�n#�>B�G#�P���j��C�V�7˅��mtx0��%=���Ȋ�[�N^ƨ�7�	\-����e@E㷿�.�4�|U��^m���7f�^�6�������1���������(��d$䶐Cv��i���H�tY)���C�O�ؐ;$,� ���{E����T(H�h�Gy'�@�������wѴ"�����<}�Z�|�X_�z��̑��k�[���GW�*�A5�3r��HTA�1���hV���xmEסA�����t��2�RIg��$Α<�6�#�a�0"�fA�T\m�B���
�Ӎ�m{Kϋ94�Eη�\��-�L��k�k�_�ܼ���x��,���3������:I�X�<`���ߏ���-���ӊ��R�<��؉ɩ�?gg]ϫ�Fg�sl $:����`YjLd6�f�<���>��V��먕�H�F�M���r\��_����Y�p}��z��J퇫�?�o&����g�r�q�)�YY�]~�f���0���Xfy	�;kP�N��Ʀ�M��n�W��S�I�A�f�U��x�Br���7�G tݒ��%4�iȭ�HU��$��/>� ;��gY%��g�ІJF���o ��g��ٺ��ND�ӚSDK����tL%���8����g�6,W����C�Ƌ��݌UۓiORE~�4a&��M�O��6Y�DRm�1�e�R����.�VAX�wQyq��t(�Xɋ1�b�,�H B����o�(Mx��k���@��ˈ�eӒi#k���hF��2YI%����:ɹ�f�t�<=4xC�yJ��&��l7��bXR�ƖIo�@��@�z<3����B�)��g�CY5����$�n�4UTEI	�?�:Z�X�)qu�Ǿ�\��+0�'�ڷ�Zq�W ��%p�*�@D�L�Q�
m����h�\�R��z��Na�f�4��.�uHݻ�.�~o$Ƕ��)��υ �V��������
	��Z�'�6��#E��4�:�B)�C�0$�m�i�\���]$drH���Hiةp�*�mr���@��G�6z���?>615�y�����)f����h��ę)$�)Sbd�}r�]2�i6)�闬�Ҳ�F$��uϱ��ӝ����)^Q�~6HS�[a�����q���������dؤ�w)��=v���ɷ2-��,k��H��{đ�� �}�X?�lv��݇�*�rp0�f�WV���ስ�U�e�+������f~Y+C#(C!t�BM���*��3iYVu]��[��S`�/)X^7�PB@밧�gO���CC�y�!�G�)
z�[�h��#��:=E���;O�M ���=�2���Gܶ�f^����zzb�`���0{X�ٍ	�+&^�\�N����IN����l�}�2_{M;�f��I.��2HJ�?�8�3�Q2��D&�D&F���5�������)��(C�(|<8D#���+�r��3������#̵�G��2��bS�+�GFe���؎E����b`��+D�J&g��Z&����/P޼��$Ӱ�6�7�#B���M7�lAc�àO����-��,�!�v�-r`^�T��/G:�*�<d�:�D4N�)eP��s���+��_DK��N]]��lk�(@���˺}�Xc|sRWn���wIO�V� �pA����Ѕ��G�cʚo�\�]�s��xR DOC��Ғk%�cq�^Pϻ)�Ņ��M`,H�9fҮ�U�Z�l�hp�S ��t�ݔ��z`�6��p��{��6Z��Qܞa8Q��ٹ�b�.��%u"q���_��DL�ևNs�6�0	�(�j�s��zl� n�35HN"�����{_6~~��ч�!7mo^߹�驾z������Cp�_��V�������D��>�>\��;>��F��]W����mɲ3�ЅM4�[Xxz%�k��+�`�e������zd%��$@�u������Ȧ��r�A�l����9���j����_�m=��ݢm_Y���gm���Û�_\��<][���� $�nM���QS @կ���\i�2�w�׾\y�苐�(YÇ��@R�E�\j#?ls�8���꫟��a�/�;7o�|]�u{�ǫ���ŝ�?\����`���QF==T���=Mޛ�Cx����:���J������j�|Op� �5����ض��'�5V$i8e���v
�CX�-�rm)��}�4��t�lf��:�v�+ �d���f�X����Քy I��g���	~3��̪�[ጲ�����X[�`�Y����l�&�BU�mi�H���<�1[v\��/�<o��q)6Y�%:�l	�'���b��8�.7�.E��b�k٘�k�e�N��-PM55�:���W4�9v:)�;�.5nL�$(/x-�]7��O��|��_I��&_[������7�t4ޢIs�Gy�� �P".���A.��%�����JeD^(b��/��p��F�_�I:*��9�/���#��.dll
`_> �ǜ9��q&�������l�e4#�\q�U�p��FS-c�?4���m>hn�,�`W����,  