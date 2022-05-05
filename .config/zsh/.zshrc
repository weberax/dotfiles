# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="intheloop"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages z)

source $ZSH/oh-my-zsh.sh

# User configuration

# custom z file
export _Z_DATA="$XDG_DATA_HOME/zsh/z"
[ -d ${_Z_DATA%/*} ] || mkdir -p ${_Z_DATA%/*}


# export MANPATH="/usr/local/man:$MANPATH"

# python auto-startup, moves history
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export LESSHISTFILE=-

export EDITOR='nvim'
export GIT_EDITOR="nvim -c 'set spell'"

# go path
export PATH="$HOME/go/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cp="cp -i"                          # confirm before overwriting something
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias la='ls -a'
alias svim=sudoedit
alias vim=nvim

alias gdb='gdb -nh -x "$XDG_CONFIG_HOME"/gdb/init'
alias wget='wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'

alias dotconf='git --git-dir=$HOME/.dotconf --work-tree=$HOME'	# work with config

alias ssdl='~/scripts/remote-ssh-dl.sh'


# create foler strukture for history-file
[ -d ${HISTFILE%/*} ] || mkdir -p ${HISTFILE%/*}

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# my own functions
za() {
	if [[ $# -eq 0 ]]; then
		echo "usage: za <file>"
	else 
		zathura $1&;disown    
	fi}

ctex() {
	if [[ $# -eq 0 ]]; then
		echo "usage: compile_tex.sh file[.tex]"
	else
		pdflatex -synctex=1 $1
		rm -f *.aux *.bbl *.blg *.glo *.idx *.log *.toc *.out *.synctex.gz *.loc *.soc 
	fi
}

texcompile() {
  latexmk -pvc -pdf $1&
  zathura "$1.pdf"
}

cl() { cd "$@" && ll; }

weather() {curl "http://wttr.in" --silent}

pdf() {qpdfview $@ >/dev/null 2>/dev/null &; disown}

jc() {python ~/playground/jumpcutter/jumpcutter.py -i "$@"}

mdc() {pandoc $1 -o ${1%md}pdf}

tmxhf() {~/scripts/tmuxHF.sh}

tmxgav() {cd ~/playground/gavel && tmux start-server && tmux new-session -d -s "gav" && tmux selectp -t 0 && tmux send-keys "vagrant up && vagrant rsync-auto & vagrant ssh" C-m && tmux attach-session -t "gav"}

# run ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi

#faster keys
xset r rate 300 50

# cowsay random command
#cowsay -f $(cowsay -l | sed '/Cow files in/d' | awk '{for(i=1;i<=NF;i++){print $i}}' | shuf -n1) $(whatis $(ls /bin) 2>/dev/null | shuf -n 1)
