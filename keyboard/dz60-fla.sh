#!/bin/sh

dfu-programmer atmega32u4 erase --force
dfu-programmer atmega32u4 flash dz60-ppiotrowicz.hex
dfu-programmer atmega32u4 reset
