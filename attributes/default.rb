#
# Cookbook Name:: pi-motion
# Attributes:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

default['pi-motion']['packages'] = ['motion', 'uvcdynctrl', 'postfix', 'mutt', 'mailutils', 'libsasl2-2', 'ca-certificates', 'libsasl2-modules']

default['pi-motion']['user'] = 'motion'
default['pi-motion']['group'] = 'motion'

default['pi-motion']['target-dir'] = '/var/tmp/motion'

default['pi-motion']['threshold'] = '10000'
default['pi-motion']['lightswitch'] = '10'
default['pi-motion']['minimum_motion_frames'] = '2'
default['pi-motion']['pre_capture'] = '4'
default['pi-motion']['post_capture'] = '8'
default['pi-motion']['gap'] = '60' 
default['pi-motion']['jpeg-quality'] = '90'
default['pi-motion']['ffmpeg_video_codec'] = 'mpeg4'

##set to true to send emails after motion is detected
default['pi-motion']['enable-on_movie_end'] = false

##update this email address with where you want to send the .avi files
default['pi-motion']['on_movie_end'] = 'echo "`date`" | sudo /usr/bin/mutt -a %f -- SENDTOTHISEMAIL@email.com'

default['pi-motion']['gmail-address'] = 'YOUREMAIL@gmail.com'
default['pi-motion']['gmail-password'] = 'YOURGMAILPASSWORD'  ##obviously not secure, use at your own risk!

##off=0, camera-auto=3
default['pi-motion']['hd6000']['auto-exposure'] = '3'
##off=0, on=1
default['pi-motion']['hd6000']['auto-focus'] = '0'
##number from 0 (infinity) - 40 (macro)
default['pi-motion']['hd6000']['absolute-focus'] = '0'
##off=0, on=1
default['pi-motion']['hd6000']['auto-wb'] = '1'
