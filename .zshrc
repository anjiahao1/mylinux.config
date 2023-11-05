# If you come from bash you might have to change your $PATH.#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="/home/ajh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

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
plugins=(git fzf-tab zsh-fzf-history-search zsh-autosuggestions zsh-syntax-highlighting extract web-search)

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

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

[[ -s /home/ajh/.autojump/etc/profile.d/autojump.sh ]] && source /home/ajh/.autojump/etc/profile.d/autojump.sh

export LANGUAGE=en_US.UTF-8
export PATH="/home/ajh/programm1/dldtool1600:$PATH"
export PATH="$PATH:/opt/xtensa-esp32-elf/bin"
export PATH="/home/ajh/lib/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi/bin:$PATH"
export PATH="/home/ajh/lib/nodejs/bin:$PATH"
export PATH="/home/ajh/work/vela_all/prebuilts/gcc/linux/risc-v/bin:$PATH"
export PATH="/home/ajh/work/vela_all/prebuilts/clang/linux/arm/bin:$PATH"
export PATH="/home/ajh/lib/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf/bin:$PATH"
export PATH="/home/ajh/lib/xtensa-esp32s3-elf/bin:$PATH"
export PATH="/home/ajh/lib/xtensa-esp-elf-gdb/bin:$PATH"
export PATH="/home/ajh/work/crosstool-ng/output/bin:$PATH"
export PATH="/home/ajh/work/vela_all/prebuilts/clang/linux/armclang/bin:$PATH"

export PATH="/home/ajh/xtensa/XtDevTools/install/tools/RI-2021.8-linux/XtensaTools/bin:$PATH"

alias jdqreboot="sudo /home/ajh/work/86p/jdq.py"
alias donwloada='jdqreboot &&  sudo /home/ajh/work/sim/vendor/bes/prebuild/m1/dldtool /dev/flash /home/ajh/work/sim/vendor/bes/prebuild/m1/programmer.bin -m 0x2C300000/0xBE57EC1C --reboot'
alias donwloadt='jdqreboot &&  sudo /home/ajh/work/sim/vendor/bes/prebuild/m1/dldtool /dev/flash /home/ajh/work/sim/vendor/bes/prebuild/m1/programmer.bin -m 0x2C200000/0xBE57EC1C --reboot'
alias donwloado='jdqreboot && sudo /home/ajh/work/sim/vendor/bes/prebuild/m1/dldtool /dev/flash /home/ajh/work/sim/vendor/bes/prebuild/m1/programmer.bin --reboot'
alias emmcd='sudo /home/ajh/programm1/dldtool1600 /dev/flash /home/ajh/programm1/emmc_programmer.bin --reboot --addr 0x9a025'

alias reporeset="repo forall -c 'git reset --hard'"
alias repoclean="repo forall -c 'git clean -xdf'"
alias reposync="repo sync -d --force-sync"
alias reposyncd="reporeset && reposync && repoclean"

alias makebl=' ./build.sh vendor/bes/boards/best1600_ep/configs/bootloader -j16'
alias makeota=' ./build.sh vendor/bes/boards/best1600_ep/configs/ota -j16'
alias makeap=' ./build.sh vendor/bes/boards/best1600_ep/configs/ap -j16'
alias makeaudio=' ./build.sh vendor/bes/boards/best1600_ep/configs/audio -j16'
alias makesensor=' ./build.sh vendor/bes/boards/best1600_ep/configs/sensor -j16'
alias maketee=' ./build.sh vendor/bes/boards/best1600_ep/configs/tee -j16'
alias makecp=' ./build.sh vendor/bes/boards/best1600_ep/configs/cp -j16'
alias makeall='makebl && makeota && maketee&& makeap && makeaudio && makesensor && makecp '


alias mmakebl=' ./build.sh vendor/bes/boards/best1600_ep/configs/bootloader menuconfig -j16'
alias mmakeota=' ./build.sh vendor/bes/boards/best1600_ep/configs/ota menuconfig -j16'
alias mmakeap=' ./build.sh vendor/bes/boards/best1600_ep/configs/ap menuconfig -j16'
alias mmakeaudio=' ./build.sh vendor/bes/boards/best1600_ep/configs/audio menuconfig -j16'
alias mmakesensor=' ./build.sh vendor/bes/boards/best1600_ep/configs/sensor menuconfig -j16'
alias mmaketee=' ./build.sh vendor/bes/boards/best1600_ep/configs/tee menuconfig -j16'
alias mmakecp=' ./build.sh vendor/bes/boards/best1600_ep/configs/cp meunconfig -j16'

alias mkota='./build.sh vendor/bes/boards/best2003_ep/k03/configs/ota -j15'
alias mmkota='./build.sh vendor/bes/boards/best2003_ep/k03/configs/ota menuconfig -j15'

alias tl='tmux list-sessions'
alias tkss='tmux kill-session -t'
alias ta='tmux attach -t'
alias ts='tmux new-session -s'

alias rm="trash"

alias cd='test(){cd $1;ls -l;};test'

alias dw='sudo /home/ajh/work/k03/vendor/bes/prebuild/m0/dldtool /dev/ser /home/ajh/work/k03/vendor/bes/prebuild/m0/programmer2003.bin '

alias vim='~/.local/bin/lvim'
alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export PICO_SDK_PATH=/home/ajh/lib/pico-sdk
function cf(){
  code $(fzf)
}

function vf(){
  vim $(fzf)
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
	echo $pid | xargs kill -${1:-9}
  fi
}

function f()
{
  if [ $# -eq 1 ]; then
    rg --no-ignore --no-ignore-dot $1
  elif [ $# -eq 2 ]; then
    fd --glob --no-ignore $1 | xargs rg --no-ignore --no-ignore-dot $2
  fi
}

function targz()
{
  if [ $# -eq 1 ]; then
    tar -czvf $1.tar.gz $1
  elif [ $# -eq 2 ]; then
    tar -czvf $1.tar.gz $2
  fi
}

function stm32()
{
  while [ 1 ];
  do
    stm32flash -i '-dtr-rts,,,-rts:dtr,rts,-rtsrts' -w nuttx.bin -v  /dev/ttyUSB0 -b 460800 -m 8n1
    if [ $? -eq 0 ]; then
      break
    fi
  done
}

alias v="lvim"
alias ls="lsd"
alias lg="lazygit"
alias ol="/bin/ls"
alias lsc="lsd --classic"
alias rgn="rg --no-ignore --no-ignore-dot"
alias c="clear"
alias r="realpath"

# function fzf-history { () { zle -U "$(cat ~/.zsh_history | fzf --layout=reverse)" } }; zle -N fzf-history; bindkey '^R' fzf-history;

# bindkey ',' autosuggest-accept
alias tizion="export https_proxy=127.0.0.1:7890 && export http_proxy=127.0.0.1:7890"
alias tizioff="unset http_proxy https_proxy"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
