#!/usr/bin/env fish
for side in left right; GNUARMEMB_TOOLCHAIN_PATH=/opt/homebrew ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb west build -p always -s zmk/app -b nice_nano_v2 -- -DZMK_CONFIG=(pwd)/config -DSHIELD=cradio_$side && cp build/zephyr/zmk.uf2 cradio_$side.uf2; end
