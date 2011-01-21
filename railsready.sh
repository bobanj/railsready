#!/bin/bash
# created by Josh Frye | joshfng@gmail.com

shopt -s extglob
set -e

# Check if the user has sudo privileges.
sudo -v >/dev/null 2>&1 || { echo $(whoami) has no sudo privileges ; exit 1; }

echo "Creating install dir..."
cd && mkdir -p railsready/src && cd railsready && touch install.log
echo "done.."

# Update the system before going any further
echo "Updating system..."
sudo apt-get update >> install.log && sudo apt-get -y upgrade >> install.log
echo "done.."

# Install build tools
echo "Installing build tools..."
sudo apt-get -y install \
    wget build-essential libxslt1.1 libssl-dev libxslt1-dev libxml2 libffi-dev libyaml-dev libreadline5-dev zlib1g-dev >> install.log
echo "done..."

echo "Installing libs needed for sqlite and mysql..."
sudo apt-get -y install sqlite3 libsqlite3-dev libmysqlclient16-dev libmysqlclient16 >> install.log
echo "done..."

# Install imagemagick
echo "Installing imagemagick (this may take awhile)..."
sudo apt-get -y install imagemagick libmagick9-dev >> install.log
echo "done..."

# Install git-core
echo "Installing git..."
sudo apt-get -y install git-core >> install.log
echo "done..."

# Install Ruby
echo "Downloading Ruby 1.9.2p136"
cd src && wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p136.tar.gz
echo "done..."
echo "Extracting Ruby 1.9.2p136"
tar -xzf ruby-1.9.2-p136.tar.gz >> ~/railsready/install.log
echo "done..."
echo "Building Ruby 1.9.2p136 (this may take awhile and build output may appear on screen)..."
cd  ruby-1.9.2-p136 && ./configure >> ~/railsready/install.log && make >> ~/railsready/install.log && sudo make install >> ~/railsready/install.log
echo "done..."

# Reload bash
echo "Reloading bashrc so ruby and rubygems are available..."
source ~/.bashrc
echo "done..."

echo "Installing Bundler, Passenger and Rails.."
sudo gem install bundler passenger rails --no-ri --no-rdoc >> ~/railsready/install.log
echo "done..."

echo "Installation is complete!"

cd ~/railsready/

# Create a test app
echo "Creating a dummy Rails app for testing"
touch testapp.log
rails new testapp >> testapp.log && cd testapp && bundle install >> testapp.log && cd ../
echo "testapp installed and bundle install ran"

echo "Dummy Rails app install complete! To start the server run 'cd ~/railsready/testapp && rails s'"
