
setenv DOTDIR ~/.dotfiles

# cursor color-manipulation env variables
source ${DOTDIR}/cursor

# path stuff
setenv PATH ${PATH}:${HOME}/bin


setenv VISUAL /usr/bin/emacs
setenv EDITOR /usr/bin/emacs
setenv PAGER /usr/bin/less




# tcsh settings
if($?tcsh) then

   set autolist
   set nobeep
   set autocorrect
   set noclobber # ensure >> redirections dont destroy existing files
   # set autocomplete
   set fignore = ( .o \~ ) # ignore these files in completions? does this work? XXX

   unset autologout

   set color

   # set up prompt stuffs	
   set P_COLOR = ${BR_MAGENTA}

   set prompt =  "%{$P_COLOR%}%S%t%s %{$P_COLOR%}%B%c03 -%#%{$NONE%} "
   set promptchars = ">#"
   set rprompt = "[%h]"

   set ellipsis

   # empty prompt for foreach and while loops
   set prompt2
   
endif

# aliases

alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'
alias x 'open'
alias c 'clear'
alias le less
alias last 'history | grep \!*'
alias hi history
alias m more

alias xe 'touch \!*; emacs \!*' # XXX change to open emacs window

alias dreamhost 'ssh taylorshaw@www.taylorshaw.net'
alias camsite 'ssh cameronshow@www.cameronshawfilm.com'

# i used to specify -a <path to Preview.app> but i dont thin i need it
alias pman 'man -t \!* | pstopdf -i -o /tmp/\!*.man.pdf; open /tmp/\!*.man.pdf;'

alias s echo youre not at work dummy


# ls stuff
set lscmd = ls
set lsopts = '-G'

if(`where gls` != "") then
   # OSX ships with BSD ls, which has fewer options than gnu ls (called gls when
   # installed from coreutils in homebrew)

   set lscmd = gls
   set lsopts = '--color=auto'

   # XXX add custom dircolors
   eval `gdircolors -c ${DOTDIR}/dircolors`
   
endif

alias ls '$lscmd $lsopts -hF'
alias ll '$lscmd $lsopts -lhF'
alias la '$lscmd $lsopts -lahF'
alias lt '$lscmd $lsopts -ltr'



# completions
