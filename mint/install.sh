#!/bin/sh

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH
rm /etc/apt/preferences.d/nosnap.pref

apt update && apt install snapd vim tmux build-essential curl file kubectx zsh y

## HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## KUBECTL
snap install kubectl --classic

## HELM
snap install helm --classic

## ZSH, OH-MY-ZSH
sudo chsh -s /usr/bin/zsh $USER
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## TEAMVIEWER
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && apt install -y ./teamviewer_amd64.deb

## DOTNET
sudo snap install dotnet-sdk --classic --channel=5.0
sudo snap alias dotnet-sdk.dotnet dotnet
sudo snap install dotnet-runtime-50 --classic
sudo snap alias dotnet-runtime-50.dotnet dotnet

## LENS
snap install kontena-lens --classic

## STERN
brew install stern



