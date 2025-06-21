# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# Пути
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# История
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history             # Добавлять команды в конец истории
setopt hist_ignore_all_dups      # Не сохранять дубликаты
setopt share_history             # Делить историю между сессиями
setopt inc_append_history        # Сохранять команду сразу после ввода
setopt extended_history          # Сохранять дату/время выполнения

# Автодополнение
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select   # стрелками выбирать из меню автодополнения
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # регистронезависимость

# Подсветка синтаксиса и автодополнение из истории
# Убедись, что эти плагины установлены (см. ниже)
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Подсказки серым справа
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#ec() {
#  # \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0435\u043c\u0441\u044f \u043d\u0430 \u0440\u0430\u0431\u043e\u0447\u0435\u0435 \u043f\u0440\u043e\u0441\u0442\u0440\u0430\u043d\u0441\u0442\u0432\u043e 5
#  bspc desktop -f ^5
#
#  # \u043e\u0442\u043a\u0440\u044b\u0432\u0430\u0435\u043c \u0444\u0430\u0439\u043b \u0432 emacsclient, \u0441\u043e\u0437\u0434\u0430\u0432\u0430\u044f \u043d\u043e\u0432\u044b\u0439 GUI-\u0444\u0440\u0435\u0439\u043c \u0438 \u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u0443\u044f \u0442\u0435\u0440\u043c\u0438\u043d\u0430\u043b
#  emacsclient -c -n "$@"
#}
precmd() { print -Pn "\e]0;%~\a" }

# Created by `pipx` on 2025-06-08 21:55:08
export PATH="$PATH:/home/sergey/.local/bin"

alias ec="emacsclient -t"

alias dis= 'mount /dev/sdc1 /run/media/sergey/MusicDisk'
alias undis= 'umount /run/media/sergey/MusicDisk'

eval "$(zoxide init zsh)"
