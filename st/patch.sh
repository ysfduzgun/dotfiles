#!/bin/bash

patch --forward --strip=1 --input="diffs/anysize.diff"
patch --forward --strip=1 --input="diffs/st-boxdraw.diff"
patch --forward --strip=1 --input="diffs/st-mouse-scroll_1.diff"
patch --forward --strip=1 --input="diffs/st-mouse-scroll_2.diff"
patch --forward --strip=1 --input="diffs/st-mouse-scroll_3.diff"
patch --forward --strip=1 --input="diffs/st-alpha.diff"
echo "extern float alpha;" >> st.h
rm st.h.rej
