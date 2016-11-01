pi-motion cookbook
==================
The pi-motion cookbook will configure motion, postfix, and mutt to detect movement and then send an email with .avi file attached. You'll need a gmail account to send messages through. I have it sent to my cell phone using my carrier's email-to-sms gateway: http://www.answers.com/Q/How_do_you_email_a_cell_phone_with_Gmail

This cookbook was created for a Raspberry Pi running Raspbian with a Microsoft HD6000 webcam attached, however it should work for any Debian-based system with a webcam. It has also been tested on a Banana Pi running Bananian with excellent results. It may also work with other Linux distros, I'm not sure.


Requirements
------------
First you'll need to get Ruby and chef-client installed on your Pi:

  1. Install git: `sudo apt-get update && sudo apt-get install -y git-core`
  1. Install Ruby using [this script](https://gist.github.com/blacktm/8302741): `curl -L https://gist.githubusercontent.com/blacktm/8302741/raw/0b24e78e775fcbdb4a072bc8eb516afc6e620caa/install_ruby_rpi.sh | sudo bash`
  1. Install the Chef gem: `gem install chef`


Here's the hardware I'm using:

* HD6000 webcam: http://amazon.com/dp/B00372567A
* RPi3B: http://amazon.com/dp/B01CD5VC92


Attributes
----------
See the attributes/default.rb and attributes/hd6000.rb files, which are commented and/or self-explanatory.


Recipes
-------
* `default` - Installs and configures everything you need to get motion and email alerts up and running.
* `hd6000` - Configures the HD6000 webcam.


Author
------
Dave Cozzolino  
@davecozzo
