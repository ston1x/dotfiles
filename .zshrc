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

# THEMES
# ZSH_THEME="flazz"
# ZSH_THEME="sunrise"
# ZSH_THEME="wuffers"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="fino"
# ZSH_THEME="crunch"
# ZSH_THEME="cypher-ruby"
# ZSH_THEME=macovsky
 ZSH_THEME=refined
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
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
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
alias rs="rails server"
alias rsp="rails server -p"
alias rc="rails console"
alias rr="rails routes"
alias brc="bundle exec rubocop"
alias rdb="rails db:"

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

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

# Add gem binaries
export PATH="$PATH:$GEM_HOME/bin"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export THEOS=~/theos
THEOS_DEVICE_IP=panettone.local
export THEOS_DEVICE_PORT=22

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# eval "$(pyenv init -)"

# added by travis gem
[ -f /Users/nstoianov/.travis/travis.sh ] && source /Users/nstoianov/.travis/travis.sh
