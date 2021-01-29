# LINUX-POST-INSTALL - DevOps Tools

## Mint configs

- https://www.technipages.com/linux-mint-how-to-configure-alt-tab-works
- https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/

## Global Protect

Get [PanGPLinux-5.1.4-c9.tgz](http://csuf.screenstepslive.com/s/12867/m/75252/l/841785-download-install-the-campus-vpn-agent) and run:

```
cd ~/Downloads
tar -zxvf PanGPLinux-5.1.4-c9.tgz
dpkg -i GlobalProtect_UI_deb-5.1.4.0-9.deb
rm GlobalProtect_* manifest relinfo PanGPLinux*
```
---

## How to use
```
git clone https://github.com/swirfneblin/linux-post-install
cd linux-post-install
chmod +x mint/install.sh
sudo sh ./mint/install.sh
```

## List of applications

#### Essentials
- [git](https://git-scm.com/)
- [tmux](https://phoenixnap.com/kb/tmux-tutorial-install-commands)
- [vim](https://www.vim.org/)
- [curl](https://curl.se/)
- [dotnet core](https://dotnet.microsoft.com/download/dotnet-core)
- [code](https://code.visualstudio.com/)
- [golang](https://golang.org/)
- [nodejs](https://nodejs.org/en/)

#### Communication
- [slack](https://slack.com/intl/en-br/)
- [zoom](https://zoom.us/)
- [teams](https://teams.microsoft.com/uswe-01/downloads)
- [skype](https://www.skype.com/en/)

#### CLIs
- [kubectx](https://ahmet.im/blog/kubectx/)
- [velero](https://velero.io/)
- [eksctl](https://eksctl.io/)
- [rke](https://rancher.com/docs/rke/latest/en/)
- [vault](https://www.vaultproject.io/)
- [gh cli](https://github.com/cli/cli)
- [helm](https://helm.sh/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)
- [bitwarden](https://bitwarden.com/help/article/cli/)

#### Container/VM
- [docker](https://www.docker.com/)
- [podman ](http://docs.podman.io/en/latest/)
- [lens](https://k8slens.dev/)
- [virtualbox](https://www.virtualbox.org/)

#### Package Mangers
- [snap](https://snapcraft.io/)
- [homebrew](https://brew.sh/)

#### Utils, Tools
- [asus mb169b+ displaylink](https://www.asus.com/us/Monitors/MB169BPlus/HelpDesk_Download/)
- [zsh](https://ohmyz.sh/)
- [fonts](https://pkgs.org/download/ttf-mscorefonts-installer)
- [redshift](http://jonls.dk/redshift/)
- [htop](https://htop.dev/)
- [keepassx](https://www.keepassx.org/)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [xclip](https://github.com/astrand/xclip)
- [fzf](https://github.com/junegunn/fzf)
- [stern](https://github.com/wercker/stern)

#### Database
- [dbeaver](https://dbeaver.io/)

#### Remote access
- [remmina](https://remmina.org/)
- [teamviewer](https://www.teamviewer.com/en/)

#### Fun
- [league of legends](https://na.leagueoflegends.com/en-us/)
