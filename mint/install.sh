#!/bin/sh

## FIREWALL
ufw enable
ufw status verbose
ufw status verbose

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH
rm /etc/apt/preferences.d/nosnap.pref
apt update && \
apt upgrade && \
apt install snapd vim tmux build-essential curl file zsh git redshift fonts-crosextra-carlito fonts-crosextra-caladea neofetch -y

## GIT PATH, CONFIGS
mkdir -p ~/Documents/github
git config --global user.name "Charles Damasceno"
git config --global user.email swirfneblin@gmail.com
git config --global core.editor vim

## HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## ZSH, OH-MY-ZSH, BASH
sudo chsh -s /usr/bin/zsh $USER
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.zshrc >> ~/.zshrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.bashrc >> ~/.bashrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.vimrc >> ~/.vimrc

## KUBECTL, KUBECTX
snap install kubectl --classic
brew install kubectx

## HELM
snap install helm --classic

## VELERO
wget https://github.com/vmware-tanzu/velero/releases/download/v1.5.2/velero-v1.5.2-linux-amd64.tar.gz
tar -zxvf velero-v1.5.2-linux-amd64.tar.gz -C /opt
rm velero-v1.5.2-linux-amd64.tar.gz
ln -s /opt/velero-v1.5.2-linux-amd64/velero /usr/local/bin/velero

## STERN
brew install stern

## TEAMVIEWER
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && apt install -y ./teamviewer_amd64.deb

## DOTNET
snap install dotnet-sdk --classic --channel=5.0
snap install dotnet-runtime-50 --classic

## LENS
snap install kontena-lens --classic

## CODE
snap install code --classic

## GH CLI
brew install gh

## GOLANG
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go*.tar.gz && rm go*.tar.gz


## GLOBAL PROTECT
## https://drive.google.com/drive/folders/1swpqaTaNFPSNVa5ojAmkzGnXoxCj_QwE

## STERN
brew install stern



