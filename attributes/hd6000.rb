#
# Cookbook Name:: pi-motion
# Attributes:: hd6000
#
# Copyright (C) 2016 Dave Cozzolino @davecozzo
#
# Attributes speficically for the Microsoft HD6000 USB Webcam
#

##off=0, camera-auto=3
default['pi-motion']['hd6000']['auto-exposure'] = '3'
##off=0, on=1
default['pi-motion']['hd6000']['auto-focus'] = '0'
##number from 0 (infinity) - 40 (macro)
default['pi-motion']['hd6000']['absolute-focus'] = '0'
##off=0, on=1
default['pi-motion']['hd6000']['auto-wb'] = '1'
