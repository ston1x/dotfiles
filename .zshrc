 # If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# Path to oh-my-zsh installation
  export ZSH=~/.oh-my-zsh

EMOJI=( 🐦 🚀 🐞  🍕  👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾  🍪 🌞 🌍 ✨ ☁️ 💦 🐽 🐝 🦄 🌴 🍏 🍎 🍊 🍋 🍉 🍒 🥝 🥕 🍯 ⛵️ 🏝 🐌 🐓 🍄 🐾 🐛 💚 🐬 🐤 👀)

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function stash_note {
  echo "# $(date)\n$(cat ~/tmp/note.md)\n" >> ~/tmp/notes.md && cat /dev/null > ~/tmp/note.md
}

function emoji() {
  SPACESHIP_CHAR_SYMBOL="$1 "
}

function run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

function gentags() {
  echo "Exporting tags..."
  ripper-tags -R -f .git/rubytags --tag-relative=yes
}

# THEMES
# ZSH_THEME="flazz"
ZSH_THEME="sunrise"
# ZSH_THEME="sunrise-ruby"
# ZSH_THEME="wuffers"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="fino"
# ZSH_THEME="crunch"
# ZSH_THEME="cypher"
# ZSH_THEME="cypher-ruby"
# ZSH_THEME=macovsky
 # ZSH_THEME=refined
# ZSH_THEME=refined-recoloured
# ZSH_THEME=reemojined

# ZSH_THEME="daveverwer"
ZSH_DISABLE_COMPFIX=true
#ZSH_THEME="sunrise-ruby"
# ZSH_THEME="spaceship"
# SPACESHIP_CHAR_SYMBOL="$(random_emoji) "
SPACESHIP_CHAR_SYMBOL="➜  "

COMPLETION_WAITING_DOTS="true"


[ -f ~/.ff.zsh ] && source ~/.fzf.zsh
# PLUGINS
plugins=(
  git
  zsh-autosuggestions
  wd
  fzf
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{node_modules/*,log/*,vendor/bundle/*,tmp/*,.git/*}"'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# export FZF_DEFAULT_COMMAND='rg --files ---hidden --follow -g "!.git" 2> /dev/null'

# Set language environment
export LANG=en_US.UTF-8

export EDITOR=nvim

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# ALIASES
alias vim="nvim"
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias alaconf="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="vim ~/.tmux.conf"
alias ohmyzsh="vim ~/.oh-my-zsh"

## bundler and rails
alias be="bundle exec"
alias bes="bundle exec sidekiq -C config/sidekiq.yml"
alias ber="bundle exec rspec"
alias rs="bin/rails server"
alias rsp="bin/rails server -p"
alias rc="bin/rails console"
alias rr="bin/rails routes"
alias brc="bundle exec rubocop"
alias rdb="bin/rails db:"

alias rubocopdiff='git diff master --name-only --diff-filter=d | grep "\.rb" | xargs bundle exec rubocop --force-exclusion -A'

## git
alias gpf="git push fork $(current_branch)"
alias ggmsg="git commit -m"

## docker
alias dcps="docker-compose ps"
alias dst="docker stats"

# other stuff
alias schedule="ruby ~/dev/ti31-schedule/fetch_schedule.rb"
alias todo='vim ~/tmp/todo.md'
alias notes='vim ~/tmp/notes.md'
alias note='vim ~/tmp/note.md && stash_note'
# alias separator="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock"
alias 'am_i_bulgarian_yet?'='ruby ~/dev/bg/bg_citizenship_status.rb'

# kill unicorn
alias ku='ps aux | grep 'unicorn' | awk '{print $2}' | xargs sudo kill -9'


# prepare parallel specs
alias pp="RAILS_ENV=test ./bin/rake parallel:drop && RAILS_ENV=test ./bin/rake parallel:create && RAILS_ENV=test ./bin/rake parallel:load_schema"

# run parallel specs
alias pr="RAILS_ENV=test ./bin/bundle exec rake parallel:spec"

# Update from 19.12.2023 - this is not necessary anymore since rbenv uses its own gem home
# export GEM_HOME=$HOME/.gem
# export GEM_PATH=$HOME/.gem
# Add gem binaries
# export PATH="$PATH:$GEM_HOME/bin"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="/usr/local/opt/postgresql@13.3/bin:$PATH"
export THEOS=~/theos
THEOS_DEVICE_IP=panettone.local
export THEOS_DEVICE_PORT=22
export BAT_THEME="Solarized (light)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# eval "$(pyenv init -)"

# added by travis gem
[ -f /Users/nstoianov/.travis/travis.sh ] && source /Users/nstoianov/.travis/travis.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
# export PATH="/usr/local/opt/libpq/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

# Temporary fix for RubyMine not running tests (NSCFConstantString issue)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
