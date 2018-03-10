fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jgibbons/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump common-aliases debian docker encode64 git-extras httpie history jira sbt scala ssh-agent sudo supervisor brews gpg-agent gradle)


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/bin/sh:$PATH"
export PATH="~/tools:$PATH"
export PATH="~/Documents/tools/scala-2.12.4/bin:$PATH"
export PATH="~/Documents/tools/sbt/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias grc='git review create --no-prompt --owners --open'
alias syncup='rsync -azP ~/code jgibbons@jgibbons-ld1:~' #not really using anymore
alias work='watch.sh' #not really using anymore
alias linux='ssh jgibbons-ld1'
alias testp='chmod -R +x ~/code/tscp-admin-frontend_trunk/tscp-admin-frontend/target/sc-temp/public/lebowski/dust-compiler/'
alias mup='mint update && mint clean && testp'
alias unit_test='mint test-js-units'
alias diff_test='mint test-testem-diff'
alias clean_sync='git clean -fd'
alias jsbuild='ligradle jsBuild'
alias gca='git commit --amend --no-edit'
alias bash_reload='. ~/.bash_profile'
alias push_it='git add -A && gca'
alias connect='ssh jgibbons-ld1'
alias run_stubs='ligradle clean test -DquitChrome=true'
alias ember_log='tail -f logs/serve.log'
alias serve_mirage='USE_MIRAGE=true just serve'
alias ember_test_all='just yarn run test | tee output.txt && sed -n "/not ok/,/\.\.\./p" output.txt && rm -rf output.txt'
alias ember_test_browser='just ember exam --server'
alias mint_update='mint update && just init --clean'
alias api_debug='ligradle -Pdebug=true runPlayBinary -t'
alias run_api='ligradle runPlayBinary -t'
alias test_api='ligradle testPlayBinary -t'
alias int_test_api='ligradle iTestPlayBinary'
alias cd_api='cd ~/code/campaign-manager-api_trunk'
alias cd_web='cd ~/code/campaign-manager-web_trunk'
alias bash_profile='vim ~/.bash_profile'
alias reload='exec zsh'
alias zshconfig='vim ~/.zshrc'
alias gitconfig='vim ~/.gitconfig'

mtestem() {
  testp && just npm run testem spec "$1"
}

mtestemprint() {
  testp && just npm run testem ci spec "$1"
}

etf() {
  just ember exam --server --filter="$1"
}

etm() {
  just ember exam --server --module="$1"
}

git_review_update() {
  update_commit.sh "$1" && git review update -r "$1"
}
export PATH="/usr/local/opt/openssl/bin:$PATH"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"