# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/per.sjostrom/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

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
DISABLE_UPDATE_PROMPT="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(
    # iterm2
    # brew
    # magic-enter
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

alias dir='ls -AlG'
alias home='cd'
alias cd..='cd ..'
alias ..='cd ..'

alias initpush='git push -u origin HEAD'
alias push='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push'
alias pull='git pull'
alias stash='git stash'
alias apply='git stash apply'
alias gs='git status'
alias gmm='git checkout master && git fetch upstream && git merge upstream/master'
alias grm='git checkout master && git fetch upstream && git rebase upstream/master'
alias gmmn='git checkout main && git fetch upstream && git merge upstream/main'
alias lg='git log'
alias amend='git add . && git commit --amend'
alias force='git push --force'
alias rebase='stash && gmm && b && git rebase master && apply'
alias merge='stash && gmm && b && apply && git merge master'
alias b='git checkout -'
alias add='git add .'
alias gitclean='git clean -fdx'
alias gd='git diff'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;killall Finder /System/Library/CoreServices/Finder.app'

alias ni='npm install'
alias nu='npm update --dev'
alias run='yarn watch'
alias nrd='npm run dev'

alias zshsource='source ~/.zshrc'
alias zshrc='code ~/.zshrc'

alias q='cd /Users/per.sjostrom/code/qmk_firmware'
alias qsofle='qmk compile -kb sofle -km psjostrom'
alias qboardwalk='qmk compile -kb boardwalk -km psjostrom'
alias qpreonic='qmk compile -kb preonic/rev3_drop -km psjostrom'
alias qnyquist='qmk compile -kb keebio/nyquist/rev3 -km psjostrom'
alias qplaidpad='qmk compile -kb keycapsss/plaid_pad/rev3 -km psjostrom'
alias qmurph='qmk compile -kb mechwild/murphpad -km psjostrom'

function create-branch() {
  sfe2 && git checkout -b $1 && initpush;
}

function co() {
  git checkout $1;
}

function killp() {
  sudo lsof -i :$1;
  echo 'Which PID should I kill?'
  read pid
  kill -9 $pid;
}

function json() {
  node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 3));" \ $1;
}

function commit() {
  git add . && git commit -am $1;
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
