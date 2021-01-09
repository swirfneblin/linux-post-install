#!/bin/sh

## FIREWALL ##
ufw enable
ufw status verbose
ufw status verbose

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH ##
rm /etc/apt/preferences.d/nosnap.pref
apt update
apt upgrade
apt install snapd vim tmux build-essential curl file zsh git redshift fonts-crosextra-carlito fonts-crosextra-caladea neofetch htop jq ttf-mscorefonts-installer ttf-mscorefonts-installer -y

## FONTS
fc-cache -f -v

## HOMEBREW
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## GIT PATH, CONFIGS ##
mkdir -p ~/Documents/github
git config --global user.name "Charles Damasceno"
git config --global user.email swirfneblin@gmail.com
git config --global core.editor vim

## VIM ##
git clone https://github.com/rafaelrosafu/vimfiles ~/.vim
cd ~/.vim
git submodule update --init
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## ZSH, OH-MY-ZSH, BASH ##
chsh -s $(which zsh) $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## zsh Themes
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.zshrc > ~/.zshrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.bashrc > ~/.bashrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/.vimrc > ~/.vimrc

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## VELERO ##
wget https://github.com/vmware-tanzu/velero/releases/download/v1.5.2/velero-v1.5.2-linux-amd64.tar.gz
tar -zxvf velero-v1.5.2-linux-amd64.tar.gz -C /opt
rm velero-v1.5.2-linux-amd64.tar.gz
ln -s /opt/velero-v1.5.2-linux-amd64/velero /usr/local/bin/velero

## EKSCTL ##
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

## [BREW]: STERN, GH CLI, KUBECTX ##
brew install stern
brew install gh
brew install kubectx

## [SNAP]: DOTNET, LENS, CODE, HELM, KUBECTL, KUBECTX ##
snap install helm --classic
snap install kubectl --classic
snap install dotnet-sdk --classic --channel=5.0
snap install dotnet-runtime-50 --classic
snap install kontena-lens --classic
snap install code --classic

## TEAMVIEWER ##
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && apt install -y ./teamviewer_amd64.deb && rm teamviewer_amd64.deb

## GOLANG ##
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go*.tar.gz && rm go*.tar.gz

