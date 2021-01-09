#!/bin/sh

##CONFIGs
mkdir -p ~/Documents/github

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH
rm /etc/apt/preferences.d/nosnap.pref
apt update && apt upgrade && apt install snapd vim tmux build-essential curl file zsh git -y

## HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## KUBECTL, KUBECTX
snap install kubectl --classic

## HELM
snap install helm --classic

## ZSH, OH-MY-ZSH
sudo chsh -s /usr/bin/zsh $USER
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.zshrc >> ~/.zshrc

## TEAMVIEWER
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && apt install -y ./teamviewer_amd64.deb

## DOTNET
snap install dotnet-sdk --classic --channel=5.0
snap install dotnet-runtime-50 --classic

## LENS
snap install kontena-lens --classic

## GH CLI
brew install gh

## GLOBAL PROTECT 
## https://drive.google.com/drive/folders/1swpqaTaNFPSNVa5ojAmkzGnXoxCj_QwE

## STERN
brew install stern



