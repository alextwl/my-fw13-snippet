#!/bin/bash
#
# backup bios image
#
# do not set spispeed bigger than 512 due to crappy wiring.
#
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=512 -c W25R256JW -r dump.bin --progress

