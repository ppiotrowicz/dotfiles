#!/bin/sh

dfu-programmer atmega32u4 erase --force
dfu-programmer atmega32u4 flash fc660c.hex
dfu-programmer atmega32u4 reset
