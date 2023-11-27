#!/data/data/com.termux/files/usr/bin/zsh
# Trace start up time
# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '
#
# tracelogfile=$(mktemp zsh_profile.XXXXXX)
# echo "Logging to $tracelogfile"
# exec 3>&2 2>$tracelogfile
#
# setopt XTRACE
#
# recover no matches found when * in cmd
setopt +o nomatch
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:$PREFIX/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TRASH="$HOME/.local/share/Trash/files"
export TERMUXROOT="/data/data/com.termux/files"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Add newly installed software into auto complete
zstyle ':completion:*' rehash true
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
plugins=(
	auto-ls-fork
  #smart-cd
  git
	zsh-autosuggestions
	extract
	cp
  git-open
	#themes
	zsh-proxy
  z
	safe-paste
  autoupdate
	zsh-syntax-highlighting
  you-should-use
  #web-search
	)

source $ZSH/oh-my-zsh.sh

# User configuration
# Plugins setting
# lib `you-shoule-use`
YSU_MESSAGE_POSITION="after"
YSU_MESSAGE_FORMAT="Use %alias_type ${BOLD}${PURPLE}\`%alias\`${NONE} instead of ${RED}${BOLD}\`%command\`$NONE."
YSU_IGNORED_ALIASES=("g")

export TERM=xterm-256color

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE

# lib `smart-cd`
#SMART_CD_LS=true
# export SMART_CD_GIT_STATUS=false

# lib for `auto-ls`
export AUTO_LS_NEWLINE=false
export AUTO_LS_COMMANDS=("$PREFIX/bin/ls -C --color=tty " "git-status")

# lib `autoupdate`
# Uncomment the following line to change how often to auto-update (in days).
UPDATE_ZSH_DAYS=3
# ZSH_CUSTOM_AUTOUPDATE_QUIET=true


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
# export LC_ALL=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-aarch64"
export CARGO_BUILD_TARGET="aarch64-linux-android"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export ALIDAVPORT=13300

alias chcolor='$HOME/.termux/colors.sh'
alias chfont='/$HOME.termux/fonts.sh'

alias xx=exit

pud(){
  echo 'Checking pip update...'
  export new_pip=($(                \
    pip list -o                     \
        --format json               \
        --no-python-version-warning \
        |jq -r '.[].name'))

  export new_pip=(${new_pip[@]/pip})
  if [[ -n "$new_pip" ]]; then
    echo "$new_pip can upgrade"
    # new_pip+=('pip')
  else
    echo 'PIPs are at the newest'
  fi
}

pug(){
  for pkg in $new_pip; do
    pip install -U $pkg
  done
  unset pkg
}

alias ud="pkg update"
alias udp="(pud &); pkg update"
alias ug="apt upgrade"
alias ugp='apt upgrade; pug'

alias zshconf='vim $HOME/.zshrc'
reloadzsh(){
  [[ "$1" == '-q' ]] && rm $HOME/.SHOWSTARTUP
  omz reload
}

# safe rm
alias rm="safe-rm -rf"
alias lst='ls -shAU1 $TRASH'

# _saferm_comp(){
  # _path_files -W $TRASH }

compdef "_path_files -W $TRASH" rmrm rerm

rerm(){
  local AUTO_LS_CHPWD=false

  cd $TRASH
  (( $# >= 1 )) && mv -i -t $HOME "$@"
  cd $OLDPWD
}

rmrm(){
  local AUTO_LS_CHPWD=false

  cd $TRASH
  nfile=`ls -AU1 | wc -l`
  (( $# > 0 && $# < $nfile )) && command rm -rf "$@"
  cd $OLDPWD
}

clean(){
  setopt localoptions rmstarsilent

  lst
  echo "-------------------"
  read -k 1 "?Delete files above (Y/y)? "
  echo

  if [[ "$REPLY" =~ "Y|y" ]]; then
    command rm -rf $TRASH/* $TRASH/.* > /dev/null
    echo "Trashbin emptied."
  fi
}

source ~/scripts/backupfile.sh
alias bk=backupfile

motd_figlet(){
  MOTDSTRING="TERMUX"
  FONTPATH="$PREFIX/share/figlet"
  export FIGFONT=`ls -U $FONTPATH/*.flf|shuf -n 1`

  echo $fg[blue]
  figlet -t -f $FIGFONT $MOTDSTRING

  alias delcurfont='mv $FIGFONT $FIGFONT.rm'
}

alias delcurcolor='mv $COLORSCHEME $COLORSCHEME.rm'

motd_startup(){
  ppid=$(pgrep -f "zsh" -n)
  #e=($(echo $ppid |tr "\n" " "))[-1]
  etime=$(ps -p $ppid -o etimes=)
  echo "$fg[green]Start time: $etime s"
  echo
}

[[ -f $HOME/.SHOWSTARTUP ]] && motd_figlet
[[ -f $HOME/.SHOWSTARTUP ]] && zsh $HOME/scripts/hitokoto.sh

touch $HOME/.SHOWSTARTUP

# zsh $HOME/scripts/schdBackup.sh

export TERLOGDIR="$HOME/.cache/termuxBackup"
backuplog(){
  case "$1" in
    backup | ignore)
      ls -t $TERLOGDIR/$1/*.log|head -1|xargs cat|more
      ;;

    current)
      local curLog=`ls -t $TERLOGDIR/current|head -1`
      if [[ -n "$curLog" ]]; then
        tail -f $TERLOGDIR/current/$curLog
      else
        echo "No current."
        return 78
      fi
      ;;

    all) ls -t $TERLOGDIR/*/*.log|head -1|xargs cat|less
      ;;

    *)
      backuplog current
      (( $?==78 )) && backuplog all
      ;;
  esac
  }

# bind [Esc][Esc] = clear
bindkey -s "\e\e" "clear^J"

source $HOME/scripts/urltest.sh
source $HOME/scripts/iniparse.sh
#zmodload zsh/zprof
# unsetopt XTRACE
# exec 2>&3 3>&-
sv-enable crond
# motd_startup
# echo $*

compdef "_path_files -W $TRASH" gm

