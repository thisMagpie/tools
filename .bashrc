# Copyright (C) 2013-2014 Magdalen Berns <m.berns@thismagpie.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Run .alias file which has aliases stored.
if [ -f $HOME/.alias ]; then
  . ~/.alias
fi

# Colourd prompt
export PS1="\033\[\032\]\032\[\033m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

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

# Set up PATH
export PATH=$PATH:$HOME/.rvm/bin:$HOME/bin:$HOME/.local/bin:$HOME/.config

# Set up C and C++ includes
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/atlas:/usr/include
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/atlas:/usr/include

# Set up PKG_CONFIG_PATH for finding *.pc files
export PKG_CONFIG_PATH=$HOME/.rvm/rubies/ruby-2.1.2/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/lib64/python2.7/test:/usr/lib64/python3.3/test:/usr/share/doc/alsa-firmware:/usr/share/mime/application:/usr/share/pkgconfig

if [ -f ~/.profile ]; then
    source ~/.profile
fi
