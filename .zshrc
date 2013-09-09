# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ ! $TERM = "dumb" ]]; then
  ZSH_THEME="agnoster"
else
  ZSH_THEME="robbyrussell"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ssh='ssh -X'
alias ropas='ssh jhkang@ropas.snu.ac.kr'
alias lab='mosh --ssh="ssh -p 2201" jeehoon@147.46.242.9'
alias ty='ssh jhkang@type.snu.ac.kr'
alias fix='ssh jhkang@fix.snu.ac.kr'
alias rec='ssh jhkang@rec.snu.ac.kr'
alias let='ssh jhkang@let.snu.ac.kr'
alias def='ssh jhkang@def.snu.ac.kr'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
export LANG=en_US.UTF-8
export ZSH_TMUX_AUTOSTART=true
export DEFAULT_USER=jeehoon
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:~/Installers/mongodb-osx-x86_64-2.4.6/bin
eval `opam config env`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx github gnu-utils history-substring-search zsh-syntax-highlighting brew command-not-found coffeel last-working-dir sbt scala tmux)

source $ZSH/oh-my-zsh.sh
