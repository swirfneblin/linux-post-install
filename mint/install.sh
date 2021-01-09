#!/bin/sh

#### SNAP, GIT, TMUX, VIM, KUBECTX
sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt update
sudo apt install snapd vim tmux build-essential curl file kubectx y

#### HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#### KUBECTL
sudo snap install kubectl --classic

