
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

# dont grep in python cache dirs
alias grep='grep --exclude-dir=.mypy_cache --color=always $@'

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
alias vpneast='globalprotect connect --gateway us-east-aurora-1.j8j2air4r4.gw.gpcloudservice.com'
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

# alias assetlib='~/av/bazel-bin/simulation/assetlib/cli/assetlib'
# alias assetlib='bazel run //simulation/assetlib/cli:assetlib -- --library dev_test '
# alias assetlib='bazel run //simulation/assetlib/cli:assetlib -- '
# source ~/av/simulation/assetlib/cli/bash_completion.sh

# alias psim-template='bazel build //simulation/houdini:houdini && ./bazel-bin/simulation/houdini/houdini sam:/prod/pscenario/template/actors_from_pscenario/setup.hip'




#   SAM aliases
#   ------------------------------------------
#   Search the sam database for a string
samfind() {
    ~/av/bazel-bin/simulation/sam/sam_util find-assets % | grep -i --color=always "$1" | sort
}

#   List all files in the assets returned by the above search results
samfiles() {
    ~/av/bazel-bin/simulation/sam/sam_util find-assets % | grep -i "$1" | while read -r line ; do
        ~/av/bazel-bin/simulation/sam/sam_util list-files $line | grep -i "$2"
    done
}


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
# fzy (clone of fzf?)
# ripgrep (rg.. faster grep)
# ncdu (see what dirs take up most space)
# gitk

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

# perception sim aliases
source ~/av/simulation/psim.aliases

# curator
alias curator="~/av/bazel-bin/simulation/cloud/curator/cmd/curator"

# added 08/31/20 (for opencue stuff maybe?)
export SETUPTOOLS_USE_DISTUTILS=stdlib

# sam caching
export SAM_CACHE_TIME=300    #in seconds

# mount opencue locations
alias mount_opencue="sudo mount -t nfs4 opencue-cache.simulation.cloud.aurora.tech:/data/opencue /data/opencue; sudo mount -t nfs4 opencue-cache.simulation.cloud.aurora.tech:/data/atlas /data/opencue_atlas; sudo mount -t nfs4 opencue-cache.simulation.cloud.aurora.tech:/data/logs /data/opencue_logs"


# For AWS access
# I set up the infra auth profile with:
#   infra auth add-aws-profile simulation-prod Developer
# I made it the default with:
    infra auth set-default-aws-profile simulation-prod-developer
# List available profiles with:
#   infra auth show-aws-profiles

alias aws_login="infra auth refresh"

# Old way of authenticating aws:
# export AWS_SDK_LOAD_CONFIG=1

# function aws_auth(){
#     cd ~/av
#     bazel run //cloud/terraform_aws:aws_auth "$@"
#     cd - > /dev/null
# }

# # run like:
# # aws_login simulation-prod
# function aws_login {
#     account=${1:-${${PWD%%/app}##*/}}
#     role=${2:-Developer}
#     cd ~/av
#     echo acct: ${account} role: ${role}
#     bazel run //cloud/terraform_aws:aws_auth -- login ${account} ${role}
#     export AWS_PROFILE=$(bazel-bin/cloud/terraform_aws/aws_auth build-profile-name $account $role)
#     echo "AWS_PROFILE Exported: $AWS_PROFILE"
#     cd - > /dev/null
# }


# Show most recent git branches in a menu and checkout (using dmenu or fzy)
alias branch="git lb | fzy -l 20 -p 'Switch to branch: ' | sed 's/.*- //' | xargs -I {} git checkout \"{}\""
# alias branch="git lb | dmenu -l 20 -b | sed 's/.*- //' | xargs -I {} git checkout \"{}\""



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

# vault
export VAULT_ADDR=https://vault.cloud.aurora.tech:8200

# testing
export AV="/home/tshaw/av"
# export PYTHONPATH=$AV/bazel-bin:$AV/bazel-genfiles:$AV/bazel-av:$AV

# For cargo (rust packages)
export PATH=$PATH:/home/tshaw/.cargo/bin

# Source tokens we dont want to check into github: GITHUB_TOKEN and BUILDKITE_API_TOKEN
source ~/.secret_tokens

# ssh to hserver machine (i copied houdini-prod.pem from lastpass)
# ssh -i houdini-prod.pem ubuntu@houdini.lic.corp.aurora.tech ~/.secret_tokens
