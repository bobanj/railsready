#Rails Ready
##Get a full Ruby on Rails stack up with one command :)

##Run this on a fresh install. Tested on Ubuntu server 10.04 lts

##To run:
  * sudo apt-get -y install curl && curl https://github.com/joshfng/railsready/raw/master/railsready.sh | sh
  * If you want to watch the magic happen run "tail -f ~/railsready/install.log"

##What this gives you:

  * An updated system
  * Ruby 1.9.2p136
  * Imagemagick
  * libs needed to run Rails (sqlite, mysql, etc)
  * Bundler, Passenger, and Rails gems

Just install a NGINX or Apache, run passenger-install-nginx-module or passenger-install-apache-module, upload your app, point your vhost config to your apps public dir and go!

I use this to setup VMs all the time but I'm sure this script can be improved upon. I'll update the commands and ruby versions as they change.
