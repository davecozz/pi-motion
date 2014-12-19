pi-motion cookbook
==================
The pi-motion cookbook will configure motion, postfix, and mutt to detect movement and then send an email with .avi file attached. You'll need a gmail account to send messages through. I have it sent to my cell phone using my carrier's email-to-sms gateway: http://www.answers.com/Q/How_do_you_email_a_cell_phone_with_Gmail

This cookbook was created for a Raspberry Pi running Raspbian with a Microsoft HD6000 webcam attached, however it should work for any Debian-based system with a webcam. It has also been tested on a Banana Pi running Bananian with excellent results. It may also work with other Linux distros, I'm not sure.


Requirements
------------
First you'll need to get chef-client installed on your Pi. You have two options:

* **Option A**: Easy, but boring.
  1. Install some Ruby packages: `sudo apt-get install ruby rubygems`
  2. Install the Chef gem: `gem install chef`

* **Option 2**: Slightly more involved, but fun! The instructions on Chef's repo (https://github.com/opscode/chef) are pretty easy to follow but you'll need some pre-reqs installed first:
  1. First `sudo apt-get install git-core build-essential ruby ruby1.9.1-dev rubygems bundler`
  2. Then run `gem install libyajl2`
  3. Now follow Chef's instructions: https://github.com/opscode/chef#chef-installation

Here's the hardware I'm using:

* HD6000 webcam: http://amazon.com/dp/B00372567A
* Ras Pi B+: http://amazon.com/dp/B00LPESRUK  
or
* Banana Pi: http://amazon.com/dp/B00LGXINGS
* WiFi: http://amazon.com/dp/B003MTTJOY


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
