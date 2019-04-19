
# some env vars
export VISUAL="/usr/local/bin/emacs"
export EDITOR="/usr/local/bin/emacs"
export PAGER="/usr/bin/less"

# aliases 
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias le='less'
alias c='clear'
alias last='history | grep $1'
alias hi='history'
alias m='more'

emacs() { /usr/local/bin/emacs "$@" & }
emacsclient() { /usr/local/bin/emacsclient -a '' -c -q "$@" & }
alias xe='emacsclient'
alias emacsterm="/usr/local/bin/emacs -nw"
alias xet="/usr/local/bin/emacsclient -a '' --tty"

alias av='cd ~/av'

# always use python3 
alias python='python3'

# unreal stuff
alias ue='~/ue4/UnrealEngine/Engine/Binaries/Linux/UE4Editor'
alias ue4='~/ue4/UnrealEngine/Engine/Binaries/Linux/UE4Editor'

alias av='cd ~/av'
alias s='echo youre no longer at a vfx company. there is no shot.'

# vpn
alias vpn='globalprotect connect --portal aurorainnovation.gpcloudservice.com'
alias vpnoff='globalprotect disconnect'
alias vpnstatus='globalprotect show --status'

# git stuff
alias gg='git log --graph --decorate --all --oneline'

# aurora tools
alias log_dump='~/av/bazel-bin/common/logging/log_dump --summary_only --log_id '


# things ive installed
# xxdiff
# kdiff3
# perceptualdiff
# fldiff
# meld
# jq (to merge json files)
# gpick
# feh
# ristretto
# krita
# gpick
# gcolor2
# libreoffice
# perf (via linux-tools-common also linux-tools-generic and linus-cloud-tools-generic)
# sqlite3
# sqliteman
# sqlitebrowser

# notify-send to send myself a desktop notification on ubuntu
# notify-send 'hello' 'this is a test' -i face-monkey -u critical
# or zenity, or xmessage