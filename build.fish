#!/usr/bin/env fish

[ (uname -r) = Darwin ] && export GNUARMEMB_TOOLCHAIN_PATH=/opt/homebrew || export GNUARMEMB_TOOLCHAIN_PATH=/

for side in left right; ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb west build -p always -s zmk/app -b nice_nano_v2 -- -DCMAKE_PREFIX_PATH=(pwd)/zephyr/share/zephyr-package/cmake -DZMK_CONFIG=(pwd)/config -DSHIELD=cradio_$side && cp build/zephyr/zmk.uf2 cradio_$side.uf2; end
