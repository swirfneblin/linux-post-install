export TERM="xterm-256color"
export ZSH="~/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status aws time kubecontext ram)

plugins=(
	dnf
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

HISTCONTROL=ignoreboth

setopt APPEND_HISTORY
setopt share_history

HISTSIZE=5000
HISTFILESIZE=10000

## Completions
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export KUBECONFIG=~/.kube/config
export GOPATH=/usr/local/go/bin
export PROMPT_COMMAND="history -a; history -n"
export KUBE_EDITOR=vim
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.9.11-4.fc33.x86_64"
export PATH="$JAVA_HOME/bin:$GOPATH:$PATH"

source <(stern --completion=zsh)
source <(gh completion -s zsh)

alias k=kubectl
alias kx=kubectx
alias ks=kubens
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vi=vim

bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
