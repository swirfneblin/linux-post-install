#!/bin/sh

# exit when any command fails
set -e

## DISABLE IPV6
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

## SNAP, GIT, TMUX, VIM, KUBECTX, ZSH
dnf update
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf upgrade
dnf install snapd vim tmux curl file zsh git redshift neofetch htop jq xclip keepassx nodejs nmap \
  npm gnome-tweak-tool chsh ufw podman dkms gnome-shell-extension-pomodoro kernel-devel \
  kernel-headers patch libdrm-devel fedora-packager rpmdevtools gcc \
  numix-gtk-theme numix-icon-theme-square -y

## FIREWALL ##
if [ $(ufw status | grep active -wc) -eq 0 ]; then
  ufw enable
  ufw status verbose
fi

## HOMEBREW
if [ ! -d "/home/linuxbrew" ]; then
  wget https://raw.githubusercontent.com/Homebrew/install/master/install.sh
  chmod +x install.sh
  ./install.sh && rm install.sh
fi

## GIT PATH, CONFIGS
if [ ! -d "~/Documents/github" ]; then
  mkdir -p ~/Documents/github
  git config --global user.name "Charles Damasceno"
  git config --global user.email swirfneblin@gmail.com
  git config --global core.editor vim
fi

## VIM
if [ ! -d ~/.vim ]; then
  git clone https://github.com/rafaelrosafu/vimfiles ~/.vim && \
  cd ~/.vim && \
  git submodule update --init && \
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

## ZSH, OH-MY-ZSH, BASH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  chsh -s $(which zsh) $USER
  curl -fsSLo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
  chmod +x install.sh
  ./install.sh && rm install.sh

  ## ZSH THEMES
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts
  curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
fi

if [ ! -d ~/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  # OPTIONAL: p10k configure
fi

curl -kfLo ~/.p10k.zsh https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/shellcfg/p10k.zsh
curl -kfLo ~/.zshrc https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/shellcfg/zshrc
curl -kfLo ~/.bashrc https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/shellcfg/bashrc
curl -kfLo ~/.vimrc https://raw.githubusercontent.com/swirfneblin/linux-post-install/master/shellcfg/vimrc

## FZF
if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

## VELERO
if ! command -v velero &> /dev/null
then
  wget https://github.com/vmware-tanzu/velero/releases/download/v1.5.2/velero-v1.5.2-linux-amd64.tar.gz
  tar -zxvf velero-v1.5.2-linux-amd64.tar.gz -C /opt
  rm velero-v1.5.2-linux-amd64.tar.gz
  ln -s /opt/velero-v1.5.2-linux-amd64/velero /usr/local/bin/velero
fi

## EKSCTL
if ! command -v eksctl &> /dev/null
then
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  mv /tmp/eksctl /usr/local/bin
fi

## RKE - RANCHER
if ! command -v rancher &> /dev/null
then
  wget https://github.com/rancher/cli/releases/download/v2.4.10/rancher-linux-amd64-v2.4.10.tar.gz && \
  tar -zxvf rancher-linux-amd64-v2.4.10.tar.gz && \
  mv rancher-v2.4.10/rancher /usr/local/bin && rm -rfv rancher-v2.4.10/ rancher-linux-amd64-v2.4.10.tar.gz
fi

## VAULT
if ! command -v vault &> /dev/null
then
  wget https://releases.hashicorp.com/vault/1.6.1/vault_1.6.1_linux_amd64.zip && \
  unzip vault_1.6.1_linux_amd64.zip && \
  mv vault /usr/local/bin && rm vault_1.6.1_linux_amd64.zip
fi

## [BREW]: STERN, GH CLI, KUBECTX, KUSTOMIZE
brew install stern
brew install gh
brew install kubectx
brew install kustomize

## [SNAP]: DOTNET, LENS, CODE, HELM, KUBECTL, KUBECTX, DBEAVER, TELEGRAM, POSTMAN
snap install helm --classic
sudo snap install kubectl --classic
sudo snap install dotnet-sdk --classic --channel=5.0
sudo snap install dotnet-runtime-50 --classic
sudo snap install kontena-lens --classic
sudo snap install dbeaver-ce
sudo snap install slack --classic
sudo dnf install telegram-desktop
sudo snap install postman

## VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

## TEAMVIEWER
if ! command -v teamviewer &> /dev/null
then
  wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm && yum localinstall -y teamviewer.x86_64.rpm && rm teamviewer_amd64.deb
fi

## GOLANG
if ! command -v go &> /dev/null
then
  wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go*.tar.gz && rm go*.tar.gz
fi

## ZOOM
if ! command -v zoom &> /dev/null
then
  wget https://zoom.us/client/latest/zoom_x86_64.rpm
  sudo yum localinstall -y zoom_x86_64.rpm && rm zoom_x86_64.rpm
fi

## REMMINA
if ! command -v remmina &> /dev/null
then
  ## via software manager
fi

## TEAMS
if ! command -v teams &> /dev/null
then
    dnf install https://packages.microsoft.com/yumrepos/ms-teams/teams-1.3.00.16851-1.x86_64.rpm
fi

## SKYPE
if ! command -v skype &> /dev/null
then
  sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
  sudo dnf install skypeforlinux
fi

## DOCKER
if ! command -v docker &> /dev/null
then
   sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \libdrm-devel
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
  sudo dnf -y install dnf-plugins-core
  sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
  sudo dnf install docker-ce docker-ce-cli containerd.io
  sudo systemctl start docker
  sudo usermod -aG docker $USER
fi

## AWS-BITWARDEN
if ! command -v aws &> /dev/null
then
    ## wget https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=rpm
    git clone https://github.com/swirfneblin/aws-bitwarden
    cd aws-bitwarden
    sudo make install
    rm ../aws-bitwarden/ -rvf
fi

## ASUS MB169B+ DISPLAYLINK
if ! command -v displaylink-installer &> /dev/null
then
  cd $HOME/Downloads
  ## wget https://drive.google.com/file/d/1RH3zy2kOmYa_qYgdPryjQ_idrRuDQrvg/view?usp=sharing
  tar -zxvf displaylink-driver-fedora33-5.3.1.34.tar.gz
  cd displaylink-driver-5.3.1.34/
  chmod +x displaylink-installer.sh
  sudo ./displaylink-installer.sh.
  cd .. && git clone https://github.com/DisplayLink/evdi && cd evdi
  wget https://crazy.dev.frugalware.org/all-in-one-kernel-5.4-and-5.5-test.patch
  git apply all-in-one-kernel-5.4-and-5.5-test.patch
  make && sudo make install
  cd .. && rm displaylink-driver-* evdi -rfv
fi

## VIRTUALBOX
if ! command -v virtualbox &> /dev/null
then
  wget https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Linux_amd64.run
  chmod +x VirtualBox-6.1.16-140961-Linux_amd64.run
  /bin/bash VirtualBox-6.1.16-140961-Linux_amd64.run
  rm VirtualBox-6.1.16-140961-Linux_amd64.run
fi

## GLOBAPROTECT
cd $HOME/Downloads
wget https://fullerton-it-network-public.s3-us-west-2.amazonaws.com/PanGPLinux.tgz
tar -xzvf PanGPLinux.tgzy
sudo yum localinstall GlobalProtect_UI_rpm-5.2.4.0-14.rpm
rm GlobalProtect_* PanGP* relinfo manifest -rfv

## LEAGUE OF LEGENDS
if ! command -v leagueoflegends &> /dev/null
then
  snap install wine-platform-5-staging
  snap refresh --candidate wine-platform-5-staging
  snap install leagueoflegends --edge --devmode
  snap refresh --candidate wine-platform-runtime
fi
