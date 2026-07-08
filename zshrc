export PATH=/home/jason_kennedy/.local/bin:$PATH:/usr/local/go/bin:~/go/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions z zsh-history-substring-search aws ansible docker fzf gcloud golang helm kind kube-ps1 kubectl ssh tmux gh)

source $ZSH/oh-my-zsh.sh
source <(awless completion zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='nvim'

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'
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
alias kctx="kubectl config use-context"
alias kga="kubectl get all"
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

# ── Kubernetes ──────────────────────────────────────────
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgn='kubectl get nodes'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kge='kubectl get events --sort-by=.lastTimestamp'
alias kdp='kubectl describe pod'
alias kdn='kubectl describe node'
alias kns='kubens'
alias kctx='kubectx'
alias kwhere='kubectl config current-context'
kl()     { kubectl logs "$@" --tail=100 -f; }
klp()    { kubectl logs "$@" --previous --tail=100; }
kex()    { kubectl exec -it "$1" -- /bin/sh; }
kexb()   { kubectl exec -it "$1" -- /bin/bash; }
kdelf()  { kubectl delete pod "$1" --grace-period=0 --force; }
kpf()    { kubectl port-forward "$1" "$2"; }
# ── Terraform ───────────────────────────────────────────
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfd='terraform destroy'
alias tfo='terraform output'
alias tfs='terraform show'
alias tfv='terraform validate'
alias tffmt='terraform fmt -recursive'
alias tfws='terraform workspace show'
alias tfwl='terraform workspace list'
tfplan()  { terraform plan -out=tfplan.out; }
tfapply() { terraform apply tfplan.out; }
# ── Docker ──────────────────────────────────────────────
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"'
alias dlogs='docker logs -f --tail=100'
alias dprune='docker system prune -af'
dsh()    { docker exec -it "$1" /bin/sh; }
dbash()  { docker exec -it "$1" /bin/bash; }
dbuild() { docker build -t "$1" .; }
# ── AWS ─────────────────────────────────────────────────
alias whoami-aws='aws sts get-caller-identity'
alias s3ls='aws s3 ls'
alias ec2ls='aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId,State.Name,Tags[?Key==\`Name\`].Value|[0],PrivateIpAddress]" --output table'
awsp()      { export AWS_PROFILE="$1"; echo "Switched to: $1"; }
ssm()       { aws ssm start-session --target "$1"; }
cwlogs()    { aws logs tail "$1" --follow; }
s3cat()     { aws s3 cp "s3://$1" -; }
ecr-login() {
  aws ecr get-login-password --region "$1" | \
  docker login --username AWS \
    --password-stdin "$(aws sts get-caller-identity --query Account --output text).dkr.ecr.$1.amazonaws.com"
}
# ── Git ─────────────────────────────────────────────────
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate -20'
alias grbi='git rebase -i'
alias gst='git stash'
alias gstp='git stash pop'
alias gundo='git reset --soft HEAD~1'
alias gclean='git branch --merged | grep -v "\*\|main\|master\|develop" | xargs git branch -d'
# ── General ─────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'
alias cp='cp -i'
alias mv='mv -i'
alias myip='curl -s ifconfig.me'
alias ports='ss -tulnp'
alias meminfo='free -h'
alias diskinfo='df -h'
alias topmem='ps aux --sort=-%mem | head -15'
alias topcpu='ps aux --sort=-%cpu | head -15'
alias reload='source ~/.zshrc'
alias zshrc='${EDITOR:-vim} ~/.zshrc'
serve()   { python3 -m http.server "${1:-8000}"; }
mkcd()    { mkdir -p "$1" && cd "$1"; }
extract() {
  case "$1" in
    *.tar.gz|*.tgz) tar -xzf "$1" ;;
    *.tar.bz2)      tar -xjf "$1" ;;
    *.tar.xz)       tar -xJf "$1" ;;
    *.zip)          unzip "$1" ;;
    *.gz)           gunzip "$1" ;;
    *)              echo "Unknown format: $1" ;;
  esac
}

