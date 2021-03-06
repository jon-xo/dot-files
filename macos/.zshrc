# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jonn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Prompt Customization
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="yellow"

#ZSH_THEME="powerlevel10k"

# DEFAULT_USER='whoami'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment to skip the verification of oh-my-zsh directories
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins+=(zsh-better-npm-completion)
plugins+=(git-open)
plugins+=(osx)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/local/sbin:$PATH"
# export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Export vim clipboard to macOS

# yank to clipboard
# if has ("clipboard")
#	set clipboard=unnamed " copy to the system clipboard
#	if has ("unnamedplus") " X11 support
#		set clipboard+=unnamedplus
#	endif
# endif

#
# Load in fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Type "fz" to open a directory using fzf
fz() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Remove duplicates from PATH
typeset -U PATH

# Preferred editor for local and remote sessions

export EDITOR='nvim'

# Set default browser

# export BROWSER='/Applications/Google\ Chrome\ Canary.app --args --auto-open-devtools-for-tabs'

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
# General aliases
alias zconf="nvim ~/.zshrc"
alias zsrc="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias ll="ls -lah"
alias cmx="chmod 755"
alias cc="clear"
alias rmx="rm -rfv"
alias pathf="echo $PATH | tr ':' '\n'"
alias nwp='open -a /System/Applications/Utilities/Terminal.app .'
alias dtb="bash ~/bin/dot-files/dot-back.sh"

# git aliases

preexec(){ _lc=$1; }
setopt interactive_comments
alias gm="git commit -m "${_lc#gm }" #"
alias gs="git status"
alias gb="git branch"
alias gba="git branch --all"
alias gaw="git add ./*"
alias ga="git add"
alias gaa="git add --all"
alias gpo="git push origin "
alias glo="git pull origin "


# Set Homebrew Python3 as default, macOS version remains @ /usr/bin/python 
# alias python=/usr/local/bin/python3

# Look for pyenv Python version

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Function includes

# Download base .gitignore
gig() {
   curl https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore > .gitignore
}

## Create directory and change to new directory.
mg() {
  mkdir -p "$1" && cd -P $_
}

# cd one level
up() {
	for i in {1..$1};
	do
		cd ..
	done
}

## Test specificed git branch

ttb () {
    git fetch --all
    git checkout $1
    git pull origin $1
}

# Change the remote repository URL.
changeorigin () {
    git remote remove origin
    git remote add origin $1
}

## C# functions
### Create a new project

newt () {
   dotnet new console -n $1 -o .
}

### Run program
alias dtr="dotnet run"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Import Python3 venv.bash https://github.com/wuub/venv

# source [ -f ~/.venv/venv.bash ] || source ~/.venv/venv.bash

#eval “$(starship init zsh)”
