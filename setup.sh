#!/bin/bash

set -ex

cd $(dirname $0)

if !(fc-list | grep 'derivative Powerline' > /dev/null); then
  pushd .
  git clone https://github.com/powerline/fonts
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
  popd
fi
  
ln -sf ~/.vim/vimrc ~/.vimrc

git submodule init
git submodule update --init --recursive

FILE=~/.gtkrc-2.0
if [ -f $FILE ] && grep 'style "gvim"' $FILE > /dev/null; then
  # noop
  echo -n
else
  cat<<EOF >$FILE
# color the right and bottom edges of maximized gvim windows
style "gvim" {
    bg[NORMAL] = "#002b36"
}
widget "vim-main-window.*.GtkForm" style "gvim"
EOF
fi

# SETUP NODEJS REPO
# Replace with the branch of Node.js or io.js you want to install: node_0.10, node_0.12, node_4.x, node_5.x, etc...
VERSION=node_6.x
# The below command will set this correctly, but if lsb_release isn't available, you can set it manually:
# - For Debian distributions: wheezey, jessie, sid, etc...
# - For Ubuntu distributions: precise, trusty, xenial, etc...
# - For Debian or Ubuntu derived distributions your best option is to use the codename corresponding to the upstream release your distribution is based off. This is an advanced scenario and unsupported if your distribution is not listed as supported per earlier in this README.
DISTRO="$(lsb_release -s -c)"
echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

# ADD NODEJS KEY
curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

sudo apt-get update

sudo apt-get install -y \
  ack-grep \
  build-essential \
  cmake \
  editorconfig \
  exuberant-ctags \
  nodejs \
  python-dev \
  vim \
  vim-gnome \
# leave this here

(cd ~/.vim/bundle/tern && npm install)

if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
  pushd .
  cd /tmp
  rm -rf yvm_build ycm_build
  mkdir yvm_build
  mkdir ycm_build
  cd ycm_build
  cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
  cmake --build . --target ycm_core --config Release
  rm -rf yvm_build ycm_build
  popd .
fi

