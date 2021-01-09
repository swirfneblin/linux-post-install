# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

HISTCONTROL=ignoreboth
shopt -s histappend

HISTSIZE=5000
HISTFILESIZE=10000

## Completions
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export KUBECONFIG=~/.kube/config
export GOPATH=/usr/local/go/bin
export PROMPT_COMMAND="history -a; history -n"
export KUBE_EDITOR=vim
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.9.11-4.fc33.x86_64"
export JAVA_HOME=""
export PATH="$JAVA_HOME/bin:$GOPATH:$PATH"

source <(kubectl completion bash)
source <(eksctl completion bash)
source <(helm completion bash)
source <(gh completion -s bash)
source <(stern --completion=bash)
source $HOME/Documents/GitHub/bash-wakatime/bash-wakatime.sh
complete -C '/usr/local/bin/aws_completer' aws
. /usr/share/bash-completion/completions/git

alias k=kubectl
alias kx=kubectx
alias ks=kubens
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vi=vim

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\w$(parse_git_branch)\$ '
fi

# export PS1="\W \$"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
