#!/usr/bin/env bash
set -euo pipefail
SRC="aescoladeexatas.com_aula_organico/assets"
DST="public/assets"
mkdir -p "$DST"

# convert <srcfile> <destname-no-ext> <quality>
cv () {
  local src="$SRC/$1" out="$DST/$2.webp" q="${3:-80}"
  if [ ! -f "$src" ]; then echo "MISSING: $src"; return; fi
  cwebp -quiet -q "$q" "$src" -o "$out"
}

# --- Carousel 1: aprovados (prints 30-52) ---
cv bd7f3ade621538f7_30-768x1024.jpg aprov-01 78
cv 708d0558876a245b_31-768x1024.jpg aprov-02 78
cv 87ff7cfe95358526_32-768x1024.jpg aprov-03 78
cv efa301adb01dc403_33-768x1024.jpg aprov-04 78
cv f2618e935b144c98_34-768x1024.jpg aprov-05 78
cv 511cd879096d3d66_35-768x1024.jpg aprov-06 78
cv f2c6be93c8b1cf1d_36-768x1024.jpg aprov-07 78
cv bd4a3ddd95e847b0_37-768x1024.jpg aprov-08 78
cv b246cdb123580f63_38-768x1024.jpg aprov-09 78
cv afa733d2daef4958_39-768x1024.jpg aprov-10 78
cv 8803a9ebab9a6aec_40-768x1024.jpg aprov-11 78
cv 46b2a4d032aaed4a_41-768x1024.jpg aprov-12 78
cv 902071cc434d332c_42-768x1024.jpg aprov-13 78
cv 542fa6775fe7e4b8_43-768x1024.jpg aprov-14 78
cv 55ef76137e08f6d0_44-768x1024.jpg aprov-15 78
cv 45c94af170c90dc9_45-768x1024.jpg aprov-16 78
cv 5eacba1a681c08a7_46-768x1024.jpg aprov-17 78
cv f8825e4cdafcf12e_47-768x1024.jpg aprov-18 78
cv d53bf05060c8c243_48-768x1024.jpg aprov-19 78
cv da54aec02e7136c3_49-768x1024.jpg aprov-20 78
cv bc9fc9ea3d803fa7_50-768x1024.jpg aprov-21 78
cv 59b8998def8c5bc8_51-768x1024.jpg aprov-22 78
cv 420ebdd541d8d03b_52-768x1024.jpg aprov-23 78

# --- Carousel 2: resultados (prints 2-25) ---
cv 069b19e60791e774_2-1-768x1024.jpg result-01 78
cv 777b486e64594fc5_3-1-768x1024.jpg result-02 78
cv 7674e86c27a908d0_4-1-768x1024.jpg result-03 78
cv bcd05f59403bf819_5-1-768x1024.jpg result-04 78
cv b300fb649d788279_6-1-768x1024.jpg result-05 78
cv d69bc8acfe98397d_7-768x1024.jpg result-06 78
cv 1dd15fe8454ff054_8-768x1024.jpg result-07 78
cv c46982c4c6b93120_9-768x1024.jpg result-08 78
cv 3d7ccb19503a0092_10-768x1024.jpg result-09 78
cv 05d8585e8da34c3b_11-768x1024.jpg result-10 78
cv bc094322c7b266bd_12-768x1024.jpg result-11 78
cv 7b0f8169ad34197f_13-768x1024.jpg result-12 78
cv 864ed69774c71ae9_14-768x1024.jpg result-13 78
cv 561c2111bdb95a9e_15-768x1024.jpg result-14 78
cv ad2b4e09976fd110_16-768x1024.jpg result-15 78
cv 16a62608f36deac1_17-768x1024.jpg result-16 78
cv 51cf7fc402faec31_18-768x1024.jpg result-17 78
cv f48dbc85fc191d0b_19-768x1024.jpg result-18 78
cv 98567054f07ea69f_20-768x1024.jpg result-19 78
cv ab3dcd01a31ecbd9_21-768x1024.jpg result-20 78
cv b9b5593ff343a29c_22-768x1024.jpg result-21 78
cv 7b2a42eab6ec197d_23-768x1024.jpg result-22 78
cv a2bf5583f99cce40_24-768x1024.jpg result-23 78
cv 1cb273690c15766c_25-768x1024.jpg result-24 78

# --- Product modules (Na assinatura) ---
cv 71e1d9198c890ea3_5-1-768x1024.png mod-01 85
cv 5fa8ecff874057bc_6-1-768x1024.png mod-02 85
cv d812d610fe44cb86_7-1-768x1024.png mod-03 85
cv e37c2d343d4fb4d9_8-1-768x1024.png mod-04 85
cv b01cb03cea8a59cc_9-1-768x1024.png mod-05 85
cv b332ba9870656203_10-2-768x1024.png mod-06 85
cv 279168dfdcbfc9a8_11-1-768x1024.png mod-07 85
cv 43055d08f1c1236c_12-1-768x1024.png mod-08 85
cv dae48425b726719e_13-768x1024.png mod-09 85

# --- Bonus ---
cv ded84bfa1311528f_1-1-768x1024.png bonus-01 85
cv 4a1b8796e9cf8d7a_2-2-768x1024.png bonus-02 85
cv fdb267de8b14473b_3-768x1024.png bonus-03 85
cv 5904cd2372400d47_4-768x1024.png bonus-04 85

# --- "Para quem é" icons (7,8,9,11,10,12) ---
cv ec3d02469f13a156_7-150x150.png quem-1 90
cv 340d065234c4e5fc_8-150x150.png quem-2 90
cv af4f173e99e0ed2a_9-150x150.png quem-3 90
cv e2523655d89316b4_11-150x150.png quem-4 90
cv 4d07cf180913c355_10-150x150.png quem-5 90
cv bf7dc42a4ae64b4d_12-150x150.png quem-6 90

# --- Steps icons (2,3,4,5,6) ---
cv a8996e56faea08b2_2.png step-1 88
cv 1a8e28b4e95dadbc_3.png step-2 88
cv 242ec8e7de3810e0_4.png step-3 88
cv 059d404333a67932_5.png step-4 88
cv 0b3dac632b323de7_6.png step-5 88

# --- Brand / decorative ---
cv 0760c7687427b9fd_Sem-Titulo-1-1024x501.png banner-resultado 82
cv e5ae1654a17aa3b3_BIO-768x985.png.webp guilherme 85
cv d622ef68183edc60_2-300x240.png logo-exatas 90
cv e8f2ab3b2ed34c86_icons-a-escola-de-exatas.png coin-exatas 88
cv 3ace045b0390df9d_1-300x300.png cta-icon 88
cv 16e11e754d2b1756_6a086c42ec2fa2d055ed1ee5.png poster-vsl 85
cv 1cbd6602d07c42bd_FAVICON-300x300.png favicon 90

# --- SVG (copy as-is) ---
cp "$SRC/df476b74ce22c082_compra-seguracopia.svg" "$DST/compra-segura.svg"

echo "=== DONE. webp count: $(ls "$DST"/*.webp | wc -l) ==="
