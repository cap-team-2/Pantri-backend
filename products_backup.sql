PGDMP  ;                    |        
   pantri_dev    15.2    16.3     ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    67299 
   pantri_dev    DATABASE     �   CREATE DATABASE pantri_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE pantri_dev;
                postgres    false            �            1259    67319    products    TABLE       CREATE TABLE public.products (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    seller_id uuid NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    cost numeric(10,2) NOT NULL,
    weight numeric(6,2),
    unit_measurement text,
    category text NOT NULL,
    description text NOT NULL,
    stock integer NOT NULL,
    CONSTRAINT products_cost_check CHECK ((cost >= (0)::numeric)),
    CONSTRAINT products_stock_check CHECK ((stock >= 0)),
    CONSTRAINT products_weight_check CHECK ((weight >= (0)::numeric))
);
    DROP TABLE public.products;
       public         heap    postgres    false            )          0    67319    products 
   TABLE DATA           |   COPY public.products (id, seller_id, name, image, cost, weight, unit_measurement, category, description, stock) FROM stdin;
    public          postgres    false    216   �	       �           2606    67329    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    216            �           2606    67330     products products_seller_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.products DROP CONSTRAINT products_seller_id_fkey;
       public          postgres    false    216            )      x��|ksǶ�g�W��>�N%-���**e� ;�@��&�V��*�f��Ȳ��g��d��&�7'�Kbc���^���yV�ŝw2Q�u�+����#�1�2f�8LxTD^�|Qb�Qϐu�d�^�l�,��h޶���ɤX�Yl��Y-l3�j9Yͫ�BDm��B(�P�\'G��T\.
������=(.���9�\>�p�ңS�����>1�m�����HO/uz�v�?�~>���`�m�0U�ҶR�>�u�z�yȨ�>>����>�c���OGo�,��-bst2:]�~>z�F�����ѓ�ڔ��;��� �)	�	���F"�e$^Sg\<�B`��F�X��p�7aʩ��b��Q�V��+�m6��8_�ŦX���/b�v�[.�dV�ռ���ȄL�C4d�agG����E[�C�~��������m�?V�c��%D`d,,gI"m�B�Ө�4�Eyd���'�`�8�Fjd��zR�u<�v�(Ң��z�H�gF3f�X�&iK���̀�36��.]��B�qL�Xa)r�P�E�H+���xFCd�s��k[,Fq6k�T����5�X-�*�z�ii�B�*�X���jQ��L(&|�������9�=��~��Ћ���Ktj�����%X���cvԙ��Y�#[�ۣe=�>Ų��Q7�(��̖�[,'F��{���c0I�a�8Ug+��Yy�ȮV�8(:(J�dR`x���kF0���7B�с�Y":�x\���g]����r҉B�q����(Nxĵ"�D�P��$4'x�YT�-g��#@X����k���n��{�Ь�t�xQ�E���,G��9"��Z ���\E�#x�!G�AA$���<ʂ&�#�Р�vGΖ�ߠ�b0�1��B`��8�A�������t�_<�4���-�߿�c���/�-����il��OSg#�YQ���ա]%��N�&��$+��̲�O�X� ޫY0�z`
��7�j0L��K4:쾡��17�$|���^gY��0���$�
�	S��LA@U:0��T��a�i��n�`�H�IH
���h0I)�ߟ�4׽~�X]�k�	�x�NF��Re}q|�u����(z_8���mc�����z����p��AI(M��'j�N_z�񑺩�w�
���Z�ڞ�60'HQ�yd���Z`A�H:LGn���M�s0'-5L#b�� "�p�BE�pG 4�;�{�M���]k�=D&���+@Z�#
�3�5�dX(�m��/I1���A_`�'�������c�����j'�^]L��H@D�J���t+��&;Լ �Y��0јJ�~�R# 5I�7Y���^����2 �*�lY� M�N*)K�dz8���(6ò���@@�*Y������]�gEǔ��s|��H�+�H�0�	~FFQQ�K��B��Ԭ����kJB@� A��y �4iX�������5����ZW���1p:-YD< m.0*�(���l�s��Ī0��NC���9������@QQ``q֠�N�<r�1�> &UD�aߠ��8:�-��N?��&���瓓�7��y����O�0�W��5�vq�O�;:
��Yɔf	+�Q k�%1@��gRaİ�����ܘ�m��6�M���z"�{�t����r������U�j-&��}��c5yQ�lY��Os���<��_�ߟ���6߻�����ڶ����/�l;bN�z�>)�N��;�s��Tj�J@z�,����T
�S&<�$T�f�,�l��h�%C�Jp ������2k*�x�N=Y��Y�ΐ�<�L�;		�`��1�����X�[�(�&�� ��_źYE���3!x�ڠ7zn�#:��٭7��=۝<�Qq�� IF��}Đ%��3�iX5����^lG��vy%���/�u(J[o;Q��l�����)���i*�>N����*�'��e����Q�vM[��6��|U�^==�@^�m!�v�9�&R2	�|D,x
�J#�b�M"N`)���e�V�u��\��jnSU����M��7ۂW.��nX��D�R��+u�3�˺�,"8�Hj�O
ô4Ap�y$&@���;ĘW˸�!fI>���/JC�4�P�
�lo�Mt+E�#Fo��{�@L-���$�+�����I�PRN���0��j{3�l����r���C}������ g��t �B#��g~&��.��J�}�F�
�s��":��D@�B��!@r�aX��l{g�,��
�� �x}>Y��Ŷ���E��-�)ZH�gi��	��`�;I�d?}\�E�n� ��ö^�.4*���޵�7D�܋��5�;	P+7�罊�h��Y����u��Mٽ]-���m �/<�aV\���B���*��2IQ����b�%S,Ad������O��.2b�+���-�<u�ǰ�ņ	��Z�V7E��fѭnZ���𸜡��{ ��׋s0MTV%�&�$�s�d	�Au���(�án@��U�����짺ׁ6BF�@<m4�4�~��b�0�$��@��r5�<�
�`�lr�X�<�QT%����f2p`"�@�W�4�bo�����`�48��
)¨���Z�],�2���k?��ea킐�]`��r�N���u�#��2�x\��`��`�Z�SR�cm7�yU�̆�^~	�����n��|�����G3>��lbl�X�u���&�P�##إʹD
��HIp��S��6]���ַ,s���5���M=:�����z{qZ�9�Gk?��t�NNr]�pK����XV����v��ݏK{9u[X��0��Ǧ��մ������K�ϊټ��G�>�p��<�i��L�%�R�9�.�	�J�ˁKb�(����2;��+v���a{%z v�� ��֞�k�b"�X��)�[������,�k =�E3w����-&��Ũ0��%y:s���f��B#4�ǩ.�]�����ʗ�f^W�rX�Pf!�����( 1�7��hzU���c�|/ǰ�A ��y�z�𶂙TC`�P΄�4�M˃���h��z0�ooл��}ַEGo�"i|l�Vk���S�K�% Lp�]��~�t�5)�\֑Da��"���t��V�E�RL�nR���c�gQw~f�J?���ϋ��O���!��߬�b�&��~�o奎�����-��w"�}�G'_���N+
������K�1&�mg?�����Ǣ�/���F�U&##Uј�lK�9���������A,�/TD������v��*�^��j����&(��r_�|UҔD	.�@> �c:P���s��K����+/��l�.}����iv����#�1zQ���#$6�7�qH�Ǭ"�U*Z����b���4D)��,��0l�1�������?iW���h_mַ�w�2�� ��ڈ�.Є��Er�!�l����a���*�.bm�������U�����g׼͕fpF�+�R}W�9ɣ���GϢ��,����B��[|�@rMD�d��>�cxY���S��fu0�cf�h�H=�\�eSǦZ�>��;�mz�|
C7x���@O���xI����! 3���s���̾��t7M�8�r��+lǖ"C�2�+���u��n�9��i�r�Mb���dQ(���fn[&���sf�6�X�-��l����n���6���T��������K��%n�8:��H5�\@�Թ�+�k��E��h`�kU��ϯWZ�7�m��\;k�z�6���0���\�bHS�=�±cHX�-SN1#t�Lz��,�L���
�Ә��CI���]��������ݟvA�`w'��Β�9�a�wA#��#��	Pp����j�f������P ��u�fV~Uh�I��"Φ��>��f��V��Cg�"��U(��a�"�*�Vk� ���Qγ˛#�>����5Ob�Z��� w
# ����)�<sC�L��Eٴփ9\{?jb�m¥���+��+���u�!W�������5����    �Ě����^}�)	�b�Y�B�~@68����,�d=�#W{7Ֆ��_��z,(M��,7���1#��F�c7����qg�.���<����HҾ{�k��}6���M_��1���?�������qbN`��P��U�����x3��`�,V׼����Mq^tb��z6ɿ�:+i���&�`�$L���F�RI��U�e�1^]��?�q����[��S�x	"(d=Ș����� JWSdy ��u�Sİf�N�Q�Qg��"@0��
�c}7&`߳^�ѻ��=uq��8G�%��a�s?�����v-t�D�W�v��b1Z��j(������r�� ߱�[ط�|%f��+r%�3#��i���N"��x|"<"���܇�r��h1�2�a��n^���C�U-����Dz���C9i��j��p��7v���a6AL`=Hg�.C�p���#([A, :�1P7ǁ��s.�a��T�[�}^W��W���mҺ�<IuU��s�q[�y��J�=�� ��T���E�B� ��@2r3���qm�ؖ�<ȿ�b��ZWUS���6SB�d�����%���)+�Uw��{.�)4! zr���)fA�D I�c��Ȓ&��{�o�>�Mշi�c@�*/b�w �nQ��D�n$s\�m٢���LH�)fyC��E��"�B#�'0�".����+-�>��ɓg��f�{о��`�f�_�!��i�2��B�����	�rp��B�� J�h�`A���M�A� � Opp��g�Ԡ�z3�.��;�$�Iw?�]�9%�2��C�g���<֐��9�C9��V�#�!�� 2�	q� �P0,����;#��ʲ�����VK�(������x�Qzz��?��/`���'��L�]�n]�ki�~��� ܮ����$'������4`(�����7#�0�}��*Gݷ������s �m�S�j�?��&�_hn���ɡ�� :�[��ս��㡼Omf|=q�4'�J D��I� %�1�*��m�O��u'�,���w���~�!�Ty�~�>[q �8�����fy�ŝ<�����	�_>��:.SC��n5 �h����G	}!��j��8BPT&��2�dZ>0�)�X��APc1MA���{�q0�C���DHa���p ����	X��;�.>WG ��0c��� E�ǐ��78�F5�=�3�g�.@.�m��� �5�hߗx���%S�R�`6׈$�+WJ��JC& ��0T]16����yv�!`$�p�����1q�G*�	ؒ��%��H`l���2�fN���Z� ˊE�\]!n\��)�ַ�CMϺ	��Dd}t�tՅ�oV��e�b!9H�� bnN1���xi�%������)�ŘFb}����o;k�'o۷�{�<�''�w�����_��������<#��=z���k�/�\��AIp�F�����ý�-*��Kl��Z���O ��8���Y� h�Rkq�
���̫�Յ;���(gˢ����{�j��� ����n�_;��C�3�^wO}��*1��v'�r�5�G@�U ��v�4y>nG���}����ec��,�{��euw�sd�v�?��I�_=:�W�^Z��WI�G�r*yfK�g-�YN`���D��f��ծ6�Y�~��uNB*j��/����k��E����k,�+-C�u�-����̊�\c�'��'��Ķ�����h�<�}h��
�@1��cP��³Hs4�����C��kR�A�^���bL�D�����!%�h��$�;� ��r�5�����b�D]��dϗ�j�(b�[�AP�?l��r->Ϸ�,�m�S�mm�(���M��`���#h/�O�d���ާ�����Et�7�$(�|�9FI�@f�Ă��롻U]0>��u�b(����$b�{+k������ǢU{Zހu��3k���(L&B��Y?��i,�Xh�|���9�t
TX�1�P�A~�t����mW�iV���G����=l��WJ\�m��7�}��uW6��X��ǯ"*�rGT(���W�����{�J�J&�����J����.�U�ϼt�۾ٍ9��吘����Dx�B����ߴ[�����4�ua�,n�a�r=�n��x�v^vL�S[��ױ�ƚ���e>�SqJ��\�PqD�Z~ź�o(IvY,�2�a�<C�ǰx�7�ɶ7�
z3�8dδ, �xB�B,q��x$�Z!�;nh�&��R��f�ϼ)��x�� ��O��>�K�K�L1f|:���c�	ǚsN��C��Vҋu=z�)��9z\,�G4�{��^5����^TuZ/�K��Q֘�i�ـ�W�**�ʁ�u�t6}�8����uY��s����~.������Mv�,��.l7պ��^�nfh73�u3B
�K��ӁaIg֊fҗ<�@R'	���Uߙc_H_{�^ � ve3���v��Z�΀x�\~��� _���e�a��=d<��+�>F &�qt,b�z�+�roޯ�r� wG_�=� �S<���zk�EgW�"�e�ZН� ���;��W�-��M	D�_m�Y���ؽX�0]7�C��.v��g.��n����pв���M��o���m�� ;��Bn�*9VU�+�7|���\��{��E5�*��l`�t�`�5��D<Q O�2�B�]ń�a���z�r}�KR��[�=8������Yf������&b\,��,d��??{��ɣ��z��Uc1a�
3y�r���ɫ?&D!(�zR����R�/�_Tz���%ߛ<OF��:���J�E� �_G�F1n|,���s�ݪ��q�v��ݙ`�A1"?�c�2�KZ����vJ�q��բ�si��
v���XA��q���)��Z��#���u#ۅ�_����7d<9}=1���O� ��s�
+�⼭V�x���(��ߪvzra�EA�w{���C��ENϺٍ~��;��5G���s���_%|w&:��g�?wP.����8��׀���l��'��I��7�V�ΐ�W%�jS>&��Җ>���O��	��3�x��sG��Xs�����Ѯ�"#����{���p�V!o��)���D�w��-̆ͺ��r���E1�^���܋إ��O�"CID��R>���a��^�Ϫ�+����4ڕ�_�%�J$QmsȦ|�6��#��:m��~�	�j�q�[��6�Ad��!�y�ٷ���}��1�	t��+�f�=���R�4�V���������q�=���d��jdG��i�aQ� G.�8e	�E���b�<�g1���(�G7m�k����Ų+=�W��S �d�)��cB3�m1��${�^ֹ����;A>�g�Nt�6}�k�\��uq�-�{Q�!��`��_�g���q��Mu�H�o���*���Q>��g�5���O�6hQ|Bբ��&��D�bo(���1�:bżT1(ؘ�v9A�&���yx���@v�䖗}̼B��S�����t���#`�Gds�/9�B�*j��r��g�G��t@�1Ċ-��v�/����餞 YtTB'�`���j��)Z_�6���)[��I��"�l/|�%_v��	�ȳ�1p�4%&��W�	@�)k8������:��b�>�r�^�λ-)�R�����w穼ŉy��{�璓K7"����y�Q �/���1z�,�UL��zh��+�OJ��Z���B�e�VK?�R��;0�E�d�Q�㈸�y�57�&��5�R/w�|���"��ϻ��gr6/V�� ��3/�_����W"�����dԺ�g��( �6�I���>>�+~<�-�'���K������,̊:y��]�5yj��*���/ۧ���G������ח:�|��oO>�^��7/o������n�g�����8��Q����?S�)�a� �$��m�%a!�@�u�8�3�ԡ�w ���;c�|������q�f��fŗ� 	  ��cvݛ��.�U�ԿI+n!ԡȕ��
�7� �#��eBY?��\Z_s[�y�=��h��cw���}g�\����qޛ+��"}�y�����Z�� �7������iARJ�7�F펱��a��n���� �����\p�i���_��9�<0ڝ�'�o���}���iwn� ���&�+��u��[F�
�!+�s�P $k ]G��v�|�`�B��*��! }�$���_i�n�7>@Mu����HޱxWb������������Q     