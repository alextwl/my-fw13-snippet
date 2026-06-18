#!/bin/bash
#
# 0xa1010: System UUID (16 bytes)
# 0xa2010 & 0xa3010: baseboard serial, product, system serial, SKU, etc.
#

# vanilla BIOS image file extracted from capsule.
FRESH_ROM=BIOSFILE.FD
# bad BIOS image dumped from a bricked laptop.
BUGGY_ROM=dump.bin
# output name of BIOS image
OUTPUT_NAME=output.bin

# migrate [0xa1000, 0xa3c00) range from buggy image to fresh image.
# before 0xa1000: use fresh image
head -c 659456 ${FRESH_ROM} > ${OUTPUT_NAME}
# [0xa1000, 0xa3c00): migrate from bad image
head -c 670720 ${BUGGY_ROM} | tail -c +659457 >> ${OUTPUT_NAME}
# on and after 0xa3c00: use fresh image
tail -c +670721 ${FRESH_ROM} >> ${OUTPUT_NAME}

