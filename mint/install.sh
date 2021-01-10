#!/bin/sh

# exit when any command fails
set -e

## FIREWALL ##
ufw enable
ufw status verbose
ufw status verbose

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH
rm -f /etc/apt/preferences.d/nosnap.pref
apt update
apt upgrade
apt install snapd vim tmux build-essential curl file zsh git redshift fonts-crosextra-carlito fonts-crosextra-caladea neofetch htop jq ttf-mscorefonts-installer xclip keepassx nodejs npm -y

## FONTS
fc-cache -f -v

## HOMEBREW
wget https://raw.githubusercontent.com/Homebrew/install/master/install.sh
chmod +x install.sh
./install.sh && rm install.sh

## GIT PATH, CONFIGS
mkdir -p ~/Documents/github
git config --global user.name "Charles Damasceno"
git config --global user.email swirfneblin@gmail.com
git config --global core.editor vim

## VIM
git clone https://github.com/rafaelrosafu/vimfiles ~/.vim
cd ~/.vim
git submodule update --init
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## ZSH, OH-MY-ZSH, BASH
chsh -s $(which zsh) $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## ZSH THEMES
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

p10k configure

curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/p10k.zsh > ~/.p10k.zsh
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/zshrc > ~/.zshrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/bashrc > ~/.bashrc
curl -k https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/vimrc > ~/.vimrc

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## VELERO
wget https://github.com/vmware-tanzu/velero/releases/download/v1.5.2/velero-v1.5.2-linux-amd64.tar.gz
tar -zxvf velero-v1.5.2-linux-amd64.tar.gz -C /opt
rm velero-v1.5.2-linux-amd64.tar.gz
ln -s /opt/velero-v1.5.2-linux-amd64/velero /usr/local/bin/velero

## EKSCTL
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

## RKE - RANCHER
wget https://github.com/rancher/cli/releases/download/v2.4.10/rancher-linux-amd64-v2.4.10.tar.gz && \
tar -zxvf rancher-linux-amd64-v2.4.10.tar.gz && \
mv rancher-v2.4.10/rancher /usr/local/bin && rm -rfv rancher-v2.4.10/ rancher-linux-amd64-v2.4.10.tar.gz

## VAULT
wget https://releases.hashicorp.com/vault/1.6.1/vault_1.6.1_linux_amd64.zip && \
unzip vault_1.6.1_linux_amd64.zip && \
mv vault /usr/local/bin && rm vault_1.6.1_linux_amd64.zip

## [BREW]: STERN, GH CLI, KUBECTX
brew install stern
brew install gh
brew install kubectx

## [SNAP]: DOTNET, LENS, CODE, HELM, KUBECTL, KUBECTX, DBEAVER
snap install helm --classic
snap install kubectl --classic
snap install dotnet-sdk --classic --channel=5.0
snap install dotnet-runtime-50 --classic
snap install kontena-lens --classic
snap install code --classic
snap install dbeaver-ce
snap install slack --classic

## TEAMVIEWER
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && apt install -y ./teamviewer_amd64.deb && rm teamviewer_amd64.deb

## GOLANG
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go*.tar.gz && rm go*.tar.gz

## ZOOM
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb && apt-get install -fy && rm zoom_amd64.deb

## REMMINA
apt-add-repository ppa:remmina-ppa-team/remmina-next -y
apt update
apt install remmina remmina-plugin-rdp remmina-plugin-secret -y

## TEAMS
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.25560_amd64.deb
dpkg -i teams_1.3.00.25560_amd64.deb
rm teams_1.3.00.25560_amd64.deb

## SKYPE
wget https://repo.skype.com/latest/skypeforlinux-64.deb && apt install ./skypeforlinux-64.deb && \
apt update && apt upgrade -y && rm skypeforlinux-64.deb

## DOCKER
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
apt-get update
apt-get -y install docker-ce
usermod -aG docker $USER

## PODMAN

## AWS-BITWARDEN
git clone https://github.com/swirfneblin/aws-bitwarden
cd aws-bitwarden
rm ../aws-bitwarden/ -rvf

## ASUS MB169B+ DISPLAYLINK
wget https://dlcdnets.asus.com/pub/ASUS/LCD%20Monitors/MB16AP/ASUS_MB_Series_driver_for_Ubuntu_5.3.1.zip
unzip ASUS_MB_Series_driver_for_Ubuntu_5.3.1.zip && rm ASUS_MB_Series_driver_for_Ubuntu_5.3.1.zip
chmod +x displaylink-driver-5.3.1.34.run
./displaylink-driver-5.3.1.34.run && rm displaylink-driver-5.3.1.34.run

## VIRTUALBOX
wget https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Linux_amd64.run
chmod +x VirtualBox-6.1.16-140961-Linux_amd64.run
/bin/bash VirtualBox-6.1.16-140961-Linux_amd64.run
rm VirtualBox-6.1.16-140961-Linux_amd64.run

## LEAGUE OF LEGENDS
snap install wine-platform-5-staging
snap refresh --candidate wine-platform-runtime
snap refresh --candidate wine-platform-5-staging
snap install leagueoflegends --edge --devmode
