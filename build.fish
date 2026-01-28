#!/usr/bin/env fish

[ (uname -r) = Darwin ] && export GNUARMEMB_TOOLCHAIN_PATH=/opt/homebrew || export GNUARMEMB_TOOLCHAIN_PATH=/

for side in cradio_left cradio_right settings_reset; ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb west build -p always -s zmk/app -b nice_nano@2.0.0 -- -DCMAKE_PREFIX_PATH=(pwd)/zephyr/share/zephyr-package/cmake -DZMK_CONFIG=(pwd)/config -DSHIELD=$side && cp build/zephyr/zmk.uf2 $side.uf2; end
