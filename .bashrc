# Colourd prompt
export PS1="\033\[\032\]\032\[\033m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


alias ls='ls -GFh'
# Run .alias file which has aliases stored.
. ~/.alias

export PATH="$PATH:$HOME/.rvm/bin:$HOME/bin"

# Command
# Extract file in $CWD
extract () {
   if [ -f $1 ] ; then
       case $1 in
    *.tar.bz2)  tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
    *.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
    *.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
    *.bz2)    bunzip2 $1 && cd $(basename "$1" /bz2) ;;
    *.rar)    unrar x $1 && cd $(basename "$1" .rar) ;;
    *.gz)   gunzip $1 && cd $(basename "$1" .gz) ;;
    *.tar)    tar xvf $1 && cd $(basename "$1" .tar) ;;
    *.tbz2)   tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
    *.tgz)    tar xvzf $1 && cd $(basename "$1" .tgz) ;;
    *.zip)    unzip $1 && cd $(basename "$1" .zip) ;;
    *.Z)    uncompress $1 && cd $(basename "$1" .Z) ;;
    *.7z)   7z x $1 && cd $(basename "$1" .7z) ;;
    *)    echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Command
# Search computer for file name
se () {
  for f in $(locate $1); do dirname $f; done | uniq
}
