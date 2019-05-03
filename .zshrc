 # If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation
  export ZSH=~/.oh-my-zsh

EMOJI=( 🐦 🚀 🐞  🍕  👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾  🍪 🌞 🌍 ✨ ☁️ 💦 🐽 🐝 🦄 🌴 🍏 🍎 🍊 🍋 🍉 🍒 🥝 🥕 🍯 ⛵️ 🏝 🐌 🐓 🍄 🐾 🐛 💚 🐬 🐤 👀)

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function stash_note {
  echo $(date; cat ~/tmp/note) >> ~/tmp/notes && cat /dev/null > ~/tmp/note
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
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="$(random_emoji) "

COMPLETION_WAITING_DOTS="true"

# PLUGINS
plugins=(
  git
  zsh-autosuggestions
  wd
  fzf-zsh
)

source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_COMMAND='rg --files ---hidden --follow -g "!.git" 2> /dev/null'

# Set language environment
export LANG=en_US.UTF-8

export EDITOR=vim

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

## git
alias gpf="git push fork $(current_branch)"
alias ggmsg="git commit -m"

# other stuff
alias schedule="ruby ~/dev/ti31-schedule/fetch_schedule.rb"
alias todo='vim ~/tmp/todo'
alias notes='vim ~/tmp/notes'
alias note='vim ~/tmp/note && stash_note'

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

# Add gem binaries
export PATH="$PATH:$GEM_HOME/bin"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
