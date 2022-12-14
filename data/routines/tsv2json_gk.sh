#!/bin/sh

# $1 is file

iast2nagari() {
    sed -e 's_[kgṅcjñṭḍṇtdnpbmyrlvśṣsh]h\?_&्_g' \
	-e 's_् *ai_ै_g' \
	-e 's_् *au_ौ_g' \
	-e 's_् *ā_ा_g' \
	-e 's_् *i_ि_g' \
	-e 's_् *ī_ी_g' \
	-e 's_् *u_ु_g' \
	-e 's_् *ū_ू_g' \
	-e 's_् *ṛ_ृ_g' \
	-e 's_् *ṝ_ॄ_g' \
	-e 's_् *ḷ_ॢ_g' \
	-e 's_् *ḹ_ॣ_g' \
	-e 's_् *e_े_g' \
	-e 's_् *o_ो_g' \
	-e 's_’_ऽ_g' \
	-e 's_ṃ_ं_g' \
	-e 's_ḥ_ः_g' \
	-e 's_kh_ख_g' \
	-e 's_gh_घ_g' \
	-e 's_ch_छ_g' \
	-e 's_jh_झ_g' \
	-e 's_ṭh_ठ_g' \
	-e 's_ḍh_ढ_g' \
	-e 's_th_थ_g' \
	-e 's_dh_ध_g' \
	-e 's_ph_फ_g' \
	-e 's_bh_भ_g' \
	-e 's_् *a__g' \
	-e 'y_kgṅcjñṭḍṇtdnpbmyrlvśṣsh_कगङचजञटडणतदनपबमयरलवशषसह_' \
	-e 's_ai_ऐ_g' \
	-e 's_au_औ_g' \
	-e 'y_aāiīuūṛṝḷeo_अआइईउऊऋलृएओ_' \
	-e 's_[\./|][\./|]_॥_g' \
	-e 's_[\./|]_।_g'
}

iast2hk() {
    sed -e 'y_āīūṃḥḫẖṅñṭḍṇśṣ_AIUMHHHGJTDNzS_' \
	-e 's_ṛ_R_g' \
	-e 's_ṝ_RR_g' \
	-e 's_ḷ_L_g' \
	-e 's_ḹ_LL_g'
}

quote() {
    sed -e 's_^ *__' \
	-e 's_ *$__' \
	-e 's_^.*$_"&"_g'
}

bracket() {
    sed -e '1 s_^_const vocabdata = {\n\[\[_' \
	-e '2,$ s_^_\[_' \
	-e 's_$_\],_' \
	-e '$ s_$_\]\n};_'
}

cut -f1 $1 | iast2nagari | quote > f1
cut -f1 $1 | iast2hk | quote > f2
cut -f2 $1 | quote > f3

paste  -d"," f1 f2 f3 | bracket

rm f1 f2 f3
