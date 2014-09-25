#! /usr/bin/env bash
echo "begin install pkg"
apt-get -y install libncurses5-dev  
apt-get -y install libgnome2-dev  
apt-get -y install libgnomeui-dev  
apt-get -y install libgtk2.0-dev  
apt-get -y install libatk1.0-dev  
apt-get -y install libbonoboui2-dev  
apt-get -y install libcairo2-dev  
apt-get -y install libx11-dev  
apt-get -y install libxpm-dev  
apt-get -y install libxt-dev  
apt-get -y install python-dev  
apt-get -y install ruby-dev  
apt-get -y install mercurial  

echo "install pkg is over, then remove old vim."

apt-get -y remove vim  
apt-get -y remove vim-runtime  
apt-get -y remove gvim  
apt-get -y remove vim-tiny  
apt-get -y remove vim-common  
apt-get -y remove vim-gui-common

echo "remove old vim is over,pull vim form googlecode"

hg clone https://code.google.com/p/vim

cd vim

echo "config vim"
./configure --with-features=huge --enable-pythoninterp=yes --enable-gui=gnome2
--enable-cscope --enable-fontset --enable-perlinterp --enable-rubyinterp
--enable-luainterp --enable-perlinterp --enable-multibyte --enable-sniff --prefix=/usr
--with-python-config-dir=/usr/lib/python2.6/config 
echo "cmplite vim"
make
echo "install vim"
make install
echo "success!"



