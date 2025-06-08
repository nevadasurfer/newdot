# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/jason_kennedy/.local/bin:$PATH:/usr/local/go/bin:~/go/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/jason_kennedy/.linkerd2/bin
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


plugins=(git zsh-syntax-highlighting zsh-autosuggestions z zsh-history-substring-search aws ansible docker fzf gcloud golang helm kind kube-ps1 kubectl ssh tmux gh)

source $ZSH/oh-my-zsh.sh
source <(awless completion zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gitu="git add . && git commit && git push"
alias vi="nvim"
alias g='git'
alias gaa="git add all"
alias gb="git branch"
alias gcb="git checkout -b"
alias gdca="git diff --cached"
alias gf="git fecth"
alias gp="git push"
alias glog="git log --online --decorate --graph"
alias k="kubectl"
alias kn="kubectl get nodes -o wide"
alias kp="kubectl get pods -o wide"
alias kd="kubectl get deployment -o wide"
alias ks="kubectl get svc -o wide"
alias kdp="kubectl describe pod"
alias kdd="kubectl describe deployment"
alias kds="kubectl describe service"
alias kdn="kubectl describe node"
alias kgen="kubectl run --generator=run-pod/v1"
alias kall="kubectl get all --all-namespaces"
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfg='terraform graph'
alias tfim='terraform import'
alias tfin='terraform init'
alias check_taint="kubectl get nodes -o=json | jq -r '.items[] | .metadata.name + "\t" + (if .spec.taints then (.spec.taints | map(.key + "=" + (.value // "") + ":" + .effect) | join(", ")) else "No taints" end)'"
alias docker_stop="docker stop $(docker ps -a -q)"

