pi-motion cookbook
==================
This cookbook was created for a Raspberry Pi running Raspbian with a Microsoft HD6000 webcam attached, however it should work for any Debian-based system with a webcam. It has also been tested on a Banana Pi running Bananian with excellent results. It may also work with other Linux distros, I'm not sure. 


Requirements
------------
First you'll need to get chef-client installed on your machine. If you're not using an x86 processor you'll need to build it from source. The instructions on Chef's repo (https://github.com/opscode/chef) are pretty easy to follow but you'll need some packages installed first:
* `apt-get install git build-essential ruby ruby1.9.1-dev rubygems bundler` 
* then run `gem install libyajl2`


Here's the hardware I'm using:
* HD6000 webcam: http://amazon.com/dp/B00372567A
* Ras Pi B+: http://amazon.com/dp/B00LPESRUK or Banana Pi: http://amazon.com/dp/B00LGXINGS
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
