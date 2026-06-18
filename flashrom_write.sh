#!/bin/bash
#
# write bios image to onboard spi flash
#
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=512 -c W25R256JW -w BIOSFILE.FD --progress

