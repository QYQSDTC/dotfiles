# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$PATH" 

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git z zsh-autosuggestions extract zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="vim ~/.zshrc"
 alias bubo='brew update && brew outdated'
 alias bubc='brew upgrade && brew cleanup'
 alias bubu='bubo && bubc'
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls='clear'
alias ls='exa --icons'
alias ll='exa -l -g --icons'
alias la='ll -a'
alias gg='ghq get'
alias lt='exa --tree --icons --level=3'
alias grep="grep --color=auto"
alias vscode="open -a  Visual\ Studio\ Code.app"
alias Typora="open -a Typora.app"

alias -s html='vim'   # 在命令行直接输入后缀为 html 的文件名，会在 Vim 中打开
alias -s rb='vim'     # 在命令行直接输入 ruby 文件，会在 Vim 中打开
# alias -s py='vscode'      # 在命令行直接输入 python 文件，会用 vscode 中打开，以下类似
alias -s md='Typora'
alias -s ipynb='vscode'
alias -s js='vim'
alias -s c='vscode'
alias -s json='vscode'
# alias -s sh='vscode'
alias -s java='vim'
alias -s txt='vscode'
alias -s gz='tar -xzvf' # 在命令行直接输入后缀为 gz 的文件名，会自动解压打开
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias cpath='pwd|pbcopy' # copy current directory path
alias ptop='bpytop'

# useful functions
# make life easier
pyup () {
	print -P "%B%F{blue}==> %fUpdating pip\n========="
	pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U --user
    pip install -U --user pip setuptools
	print -P "%B%F{red}==> %fUPDATE FINISHED"
  #  pipsi upgrade poetry
}


brewupdate () {
    print -P "%B%F{green}==> %fbrew update\n========"
    bubu
    print -P "%B%F{green}==> %fbrew cu -y\n======"
    brew cu -y
    print -P "%B%F{red}==> %fUPDATE FINISHED"
}

npmupdate(){
	print -P "%B%F{yellow}==> %fnpm update\n======="
	npm upgrade -g
	npm install -g npm
	print -P "%B%F{red}==> %fUPDATE FINISHED"
}

# TODO: update gitupdate function so that user can update accordingly.
#gitupdate () { 
#	print -P "%B%F{green}==> %fgit fetch: \n======"
#	git fetch $1
#	print -P "%B%F{green}==> %fgit status\n===="
#	git status
#	print -P "%B%F{green}==> %fgit add all changes\n===="
#	git add .
#	print -P "%B%F{green}==> %fgit commit $1\n===="
#	print -P "%fput the comment after the function name\n==="
#	git commit -m $2
#	print -P "%B%F{green}==> %fgit push $2 $3 \n===="
#	print -P "%fput branch after the function\n==="
#	git push $3 $4
#	print -P "%B%F{blue}==> %fGIT UPDATED"
#}

showip(){
	curl cip.cc
}

fileN(){
	# count the number of files in current directory.
	ls | wc -l
}

# Reset iCloud service when iCloud got stuck
rstcld(){
	killall bird
	killall cloudd
	echo 'iCloud services are restarted'
}
# Proxy list 
export http_proxy="http://0.0.0.0:8888"
export https_proxy="http://0.0.0.0:8888"
export ALL_PROXY="socks5://0.0.0.0:8889"

# Ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/ruby/lib $LDFLAGS"
# export CFLAGS="-I/usr/local/opt/ruby/include $CFLAGS"
# export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Linter
# export CFLAGS="-I/usr/local/Cellar/gsl/2.6/include $CFLAGS" # GSL Library
# export LDFLAGS="-L/usr/local/Cellar/gsl/2.6/lib $LDFLAGS"
# export CFLAGS="-I/usr/local/Cellar/hdf5/1.12.0/include $CFLAGS" # HDF5 Library
# export LDFLAGS="-L/usr/local/Cellar/hdf5/1.12.0/lib $LDFLAGS"
# export CFLAGS="-I/usr/local/opt/qt/include $CFLAGS" # QT Library
# export LDFLAGS="-L/usr/local/opt/qt/lib $LDFLAGS"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib $LDFLAGS" # Openssl
# export CFLAGS="-I/usr/local/opt/openssl@1.1/include $CFLAGS"

#Compiler
# export CC=gcc-9
# export CXX=g++-9

# gettext
# export PATH="/usr/local/opt/gettext/bin:$PATH"

# GNU get-opt
# export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# additional path settings
export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/qt/bin:$PATH" # QT
# export PATH="/usr/local/opt/make/libexec/gnubin:$PATH" # make PATH. 
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export MONO_GAC_PREFIX="/usr/local"


# FZF Configuration
# export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

# Change directory
fcd(){
    cd $(find * -type d | fzf)
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The Fuck
eval $(thefuck --alias)

# LLVM
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/llvm/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/llvm/include"

# libffi
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/libffi/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/libffi/include"
# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig"

# icu4c
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/icu4c/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/icu4c/include"
# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/icu4c/lib/pkgconfig"

# Openssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl@1.1/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

# SQLite
# export PATH="/usr/local/opt/sqlite/bin:$PATH"
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/sqlite/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/sqlite/include"
# export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"

# zlib
# export LDFLAGS="$LDFLAGS -L/usr/local/opt/zlib/lib"
# export CFLAGS="$CFLAGS -I/usr/local/opt/zlib/include"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"

# libxml2
# export PATH="/usr/local/opt/libxml2/bin:$PATH"

# v8
# export PATH="/usr/local/opt/v8@3.15/bin:$PATH"

# pyenv
 #export PATH="/Users/qianyiqian/.pyenv/bin:$PATH"
 #export PYENV_ROOT="$HOME/.pyenv"
 #export PATH="$PYENV_ROOT/bin:$PATH"
 #eval "$(pyenv init -)"
 #eval "$(pyenv virtualenv-init -)"
 
# rbenv
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/bin:$PATH"
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# MATLAB
# export PATH="/Applications/MATLAB_R2020a.app/bin:$PATH"

# Python 3.8
export PATH="$PATH:/Users/qyq/Library/Python/3.8/bin" # user packages first
# export PATH="$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/3.8/bin" # global packages
# export PYTHONPATH="/opt/local/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages:$PYTHONPATH"

# Python 3.9
# export PATH="$PATH:/Users/qyq/Library/Python/3.9/bin"
# Python site-package version: port first.

# PKG Config PATH
export PKG_CONFIG_PATH='$PKG_CONFIG_PATH:/opt/local/lib/pkgconfig'

# Suite Sparse
export SUITESPARSE_INCLUDE_DIR="/opt/local/include"
export SUITESPARSE_LIBRARY_DIR="/opt/local/lib"

# TEMPO2
# export TEMPO2="/opt/local/share/tempo2"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/qyq/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/qyq/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/qyq/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/qyq/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# deactivate conda
alias dc="conda deactivate"

# activate pulsar software env
alias psr='conda activate psrsoftwares'
