 # If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation
  export ZSH=~/.oh-my-zsh

# Powerline
# powerline-daemon -q
# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# Set name of the theme to load. If you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
EMOJI=(💩 🐦 🚀 🐞 🎨 🍕 🐭 👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾  🍪 🌞 🌍 ✨ ☁️ 💦 🐽 🐝 🦄 🌴 🍏 🍎 🍊 🍋 🍉 🍒 🥝 🥕 🍯 ⛵️ 🏝 🐌 🐓 🍄 🐾 🐛 💚 🐬 🐤 👀)

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function stash_note {
  echo $(date; cat ~/tmp/note) >> ~/tmp/notes && cat /dev/null > ~/tmp/note
}

function run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

# ZSH_THEME="flazz"
ZSH_THEME="sunrise"
# ZSH_THEME="wuffers"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="fino"
# ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="$(random_emoji) "

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
 COMPLETION_WAITING_DOTS="true"

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
plugins=(
  git
  zsh-autosuggestions
  wd
  fzf-zsh
)

source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_COMMAND='rg --files ---hidden --follow -g "!.git" 2> /dev/null'

# export MANPATH="/usr/local/man:$MANPATH"

# Set language environment
export LANG=en_US.UTF-8

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# ALIASES
alias vim="nvim"
alias todo='vim ~/tmp/todo'
alias notes='vim ~/tmp/notes'
alias note='vim ~/tmp/note && stash_note'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias alaconf="vim $HOME/.config/alacritty/alacritty.yml"
alias tmuxconf="vim ~/.tmux.conf"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias be="bundle exec"

## git
alias gpf="git push fork $(current_branch)"
alias ggmsg="git commit -m"

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

# Add gem binaries
export PATH="$PATH:$GEM_HOME/bin"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"
