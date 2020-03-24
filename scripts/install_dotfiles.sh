#!/bin/bash
# scritp to pull and install my dotfiles

git clone --bare https://github.com/weberax/dotfiles.git $HOME/.dotconf

function dotgit { git --git-dir=$HOME/.dotconf --work-tree=$HOME $@ }

#this doesn't work for dir's so far
dotgit checkout || mkdir -p .conf.old && \
    dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .conf.old/{} && \
    echo "moved existing files to .conf.old/"

dotgit checkout
dotgit submodule init
dotgit submodule update
dotgit confit status.showUntrackedFiles no
exit(0)
