#
# Cookbook Name:: pi-motion
# Attributes:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

default['pi-motion']['motion-packages'] = ['motion', 'uvcdynctrl']
default['pi-motion']['mail-packages'] = ['postfix', 'mutt', 'mailutils', 'libsasl2-2', 'ca-certificates', 'libsasl2-modules']

default['pi-motion']['user'] = 'motion'
default['pi-motion']['group'] = 'motion'

##target dir for jpg and avi files
default['pi-motion']['target-dir'] = '/var/tmp/motion'

##motion.conf settings
default['pi-motion']['rotate'] = '0'
default['pi-motion']['width'] = '800'
default['pi-motion']['height'] = '448'
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

