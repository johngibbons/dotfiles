fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

export PATH="/usr/local/opt/openssl/bin:$PATH"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick --quiet refresh

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

# OLD - Deprecated
# alias syncup='rsync -azP ~/code jgibbons@jgibbons-ld1:~' #not really using anymore
# alias work='watch.sh' #not really using anymore

# Git
alias gs='git status'
alias grc='git review create --no-prompt --owners --open'
alias gca='git commit --amend --no-edit'
alias push_it='git add -A && gca'
git_review_update() {
  update_commit.sh "$1" && git review update -r "$1"
}
git_parent_review_update() {
  git review update -r "$1" --parent="$2"
}
ghp() {
  set -e
  if [[ -z "$1" ]]; then
    read -p "Enter Commit Message: " commit_message
  else
    commit_message=$1
  fi
  git add -A && git commit -m commit_message && git push
}
alias validate_review='git review status --verify-diff'

# SSH
alias linux='ssh jgibbons-ld1'
alias connect='ssh jgibbons-ld1'

# Zsh/Bash
alias bash_reload='. ~/.bash_profile'
alias bash_profile='code ~/.bash_profile'
alias zsh_reload='exec zsh'
alias zshconfig='code ~/.zshrc'
alias gitconfig='code ~/.gitconfig'
kill_all_grep() {
  kill $(ps aux | grep "$1" | awk '{print $2}')
}
kill_port() {
  kill $(lsof -t -i :"$1")
}
kill_hard_port() {
  kill -kill $(lsof -t -i :"$1")
}

# tscp-admin-frontend
alias testp='chmod -R +x ~/code/tscp-admin-frontend_trunk/tscp-admin-frontend/target/sc-temp/public/lebowski/dust-compiler/'
alias mup='mint update && mint clean && testp'
alias unit_test='mint test-js-units'
alias diff_test='mint test-testem-diff'
alias clean_sync='git clean -fd'
alias jsbuild='ligradle jsBuild'
alias run_stubs='ligradle clean test -DquitChrome=true'
mtestem() {
  testp && just npm run testem spec "$1"
}

mtestemprint() {
  testp && just npm run testem ci spec "$1"
}

# Campaign Manager API
alias api_debug='ligradle -Pdebug=true runPlayBinary -t'
alias api_run='ligradle runPlayBinary'
alias api_test='ligradle testPlayBinary --rerun-tasks'
alias api_test_int='ligradle iTestPlayBinary'
alias api_rebuild='ligradle -Prest.model.compatibility=ignore build'
alias api_update='ligradle clean && ligradle idea && ligradle build'
alias cd_api='cd ~/code/campaign-manager-api_trunk'
ati() {
  ligradle iTestPlayBinary --tests *"$1" class
}

# Campaign Manger Web
alias cd_web='cd ~/code/campaign-manager-web_trunk'
alias ember_test_all='just yarn run test | tee output.txt && sed -n "/not ok/,/\.\.\./p" output.txt && rm -rf output.txt'
alias ember_test_browser='just ember exam --server'
alias ember_log='tail -f logs/serve.log'
alias serve_mirage='USE_MIRAGE=true just ember serve'
alias mint_update='mint update && just init --clean'
alias ember_reset='rm -rf tmp/ build/ && just init --clean'
alias docs_open='open build/reports/apidoc/html/index.html'
alias docs_build='mint apidoc'

alias ingraphs_checkout='ingraphs dashboard checkout'

web_run() {
  just ember serve
}

web_run_port() {
  just ember serve --port "$1"
}
eto() {
  just ember exam --server --filter=":ONLY"
}
etf() {
  just ember exam --server --filter="$1"
}
etm() {
  just ember exam --server --module="$1"
}
etml() {
  just ember exam --module="$1"
}
get_screenshots() {
  just ember build --screenshot --environment test && just ember jstf --path dist --launch jstf_firefox_52.0 --preset desktop_1920_1080 --locale "$1"
}
esm() {
  just ember jstf --path dist --launch jstf_firefox_52.0 --preset desktop_1920_1080 --module "$1" --locale "$2"
}
esmb() {
  just ember build --screenshot --environment test && just ember jstf --path dist --launch jstf_firefox_52.0 --preset desktop_1920_1080 --module "$1" --locale "$2"
}
wc_test() {
  mint wc-test -d "$1"
}

# Voyager Web
alias qprod_setup_ei="qdt --target ei deployment add -a voyager-web -p 4443 --host jgibbons-mn2.linkedin.biz --scheme https"
alias qprod_setup_prod="qdt --target prod deployment add -a voyager-web -p 4443 --host jgibbons-mn2.linkedin.biz --scheme https"
alias qprod_get_id="qdt --target prod deployment list -u jgibbons"
qprod_use_ip_ei() {
  qdt --target ei deployment update -i "$1" --use_my_ip
}
qprod_use_ip_ei() {
  qdt --target prod deployment update -i "$1" --use_my_ip
}
alias voyager_start_ei_qprod="FABRIC=qdtei-lca1 just ember s"
alias voyager_start_prod_qprod="FABRIC=qdtprod-lva1 just ember s"
alias voyager_start_local="just ember serve --app=extended"

# Personal Notes
alias cd_notes='cd ~/code/personal_notes'

# Codesearch
search_web() {
  cs "$1" mp:campaign-manager-web
}

search_api() {
  cs "$1" mp:campaign-manager-api
}

search_taf() {
  cs "$1" mp:tscp-admin-frontend
}

search_ads() {
  cs "$1" mp:campaign-manager-web mp:campaign-manager-api mp:tscp-admin-frontend mp:tscp-api
}

# LI cookie for nserwn@li.com/password
li_at=AQEDAw2QnYEEdxIIAAABaM6bC_wAAAFo3wHLNVQAgwQNzzXLCKrnn9zJDCfPTZl9PESnwHrmJ9cwvZWDp-0mzTYIwZRy8LaX2Mcl3EcC57P9DEpq7r0hOCtPZvIVHOEt-2neA9hswVRvY-emDOuasBz-

# Curli
function restli() {
  curli -H 'Authenticate: X-RestLI SUPERUSER:urn:li:system:3038986662'  --dv-auth SELF --logging-level ERROR --pretty-print  -H "X-RestLi-Protocol-Version: 2.0.0" -H "Accept: application/json" "$@"
}

function restli_get() {
  restli "$@"
}

# input from stdin
function restli_post() {
  restli -d @- -X POST "$@"
}

# input from stdin, patch wrapper already present
function restli_patch() {
  jq '{patch: .}' | restli_post -H "X-RestLi-Method: partial_update" "$@"
}

# input from stdin, patch wrapper already present
function restli_batch_patch() {
  jq '{patch .}' | restli_post -H "X-RestLi-Method: batch_partial_update" "$@"
}
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
