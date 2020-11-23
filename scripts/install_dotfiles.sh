#!/bin/bash
# scritp to pull and install my dotfiles
# install with 'curl https://raw.githubusercontent.com/weberax/dotfiles/master/scripts/install_dotfiles.sh | bash'

if [ -z "$HOME" ]
then
    echo "could not find HOME"
    exit 1
fi

git clone --bare https://github.com/weberax/dotfiles.git $HOME/.dotconf

function dotgit { git --git-dir=$HOME/.dotconf --work-tree=$HOME $@ ; }

#this doesn't work for dir's so far
dotgit checkout || mkdir -p .old_configs && \
    dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .old_configs/{} && \
    echo "moved existing files to .old_configs/"

dotgit checkout
dotgit submodule init
dotgit submodule update
dotgit config status.showUntrackedFiles no

dotgit remote set-url origin git@github.com:weberax/dotfiles.git
dotgit branch --set-upstream-to origin

mkdir -p ~/.local/share/zsh
mkdir -p ~/.cache/vim
exit 0
