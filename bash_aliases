
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

# things to see whats taking up space / clean up
# df -h
# du -hxd1
# docker image prune -a -f
# docker system prune

# aurora tools
alias log_dump='~/av/bazel-bin/common/logging/log_dump --summary_only --log_id '

#alias assetlib='~/av/bazel-bin/simulation/assetlib/cli/assetlib'
#alias assetlib='bazel run //simulation/assetlib/cli:assetlib -- --library dev_test '
#alias assetlib='bazel run //simulation/assetlib/cli:assetlib -- '
source ~/av/simulation/assetlib/cli/bash_completion.sh

# AWS Stuff
export AWS_SDK_LOAD_CONFIG=1


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
# pdfmod
# pdftk
# postgresql
# postgresql-contrib
# pgadmin3
# qt-sdk
# inkscape
# ncdu # to see disk usage

# downloaded pgadmin4 from source cause couldnt get apt install working. couldnt get source to work easily
# downloaded pgweb which seems to work ok
# also downloaded omnidb which also seems to work ok (start from ubuntu search menu)

# notify-send to send myself a desktop notification on ubuntu
# notify-send 'hello' 'this is a test' -i face-monkey -u critical
# or zenity, or xmessage


# Aurora stuff

# perception's aliases
source ~/av/perception/perception.aliases

# davis' git tools tab completion
source ~/av/tools/git/move_branch_bash_tab_completion.sh

# curator
alias curator="~/av/bazel-bin/simulation/cloud/curator/cmd/curator"

# added 08/31/20 (for opencue stuff maybe?) 
export SETUPTOOLS_USE_DISTUTILS=stdlib


# testing
full_test() {
    TEST_TARGET=${1}
    echo "******* Running valgrind test *******" && \
    bazel test ${TEST_TARGET} --run_under='valgrind --leak-check=full --error-exitcode=1' --test_output=errors --test_timeout=1800,3600,9000,1 --nocache_test_results --compilation_mode=fastbuild && \
    echo "******* Running: --runs_per_test 100 *******" && \
    bazel test ${TEST_TARGET} --runs_per_test 100 && \
    echo "******* Running: --config=clang7 *******" && \ 
    bazel test ${TEST_TARGET} --config=clang7 && \
    echo "******* Running: -c opt *******" && \
    bazel test ${TEST_TARGET} -c opt
}

# note: to un-revert a reverted commit, make a new branch, and use git revert to undo the reverting changes. then fix whatever the problem was and review the new diff

# to start server for doc writing:
# bazel run //tools/mkdocs:mkdocs -- --serve --fast
# take off fast to force rebuilding all docs (makes navigation work correctly)

# open daily TODO
# xe ~/TODO


# testing
export AV="/home/tshaw/av"
export PYTHONPATH=$AV/bazel-bin:$AV/bazel-genfiles:$AV/bazel-av:$AV


