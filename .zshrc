# OS X用
#function toon {
#  echo -n ""
#}

if [ $SHLVL = 1 ]; then
#    ssh-add ~/.ssh/id_rsa
    screen -U
fi

export TERMCAP="xterm-256color:Co#256:pa#256:AF=\E[38;5;%dm:AB=\E[48;5;%dm:"
export TERM="xterm-256color"

alias ...='cd ../..'
alias ....='cd ../../..'

alias e="emacs"
alias ll="ls -lh"

# EDITOR
export EDITOR=emacs

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%s@*%F{yellow}!"
zstyle ':vcs_info:*' unstagedstr "%s@*%F{red}+"
zstyle ':vcs_info:*' formats ' : %s@*%F{green}%b%f'
zstyle ':vcs_info:*' actionformats ' : %s@*%F{green}%b%f(%F{red}%a%f)'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }

# プロンプト表示
PROMPT='[%F{green}%n%f $(toon) %F{cyan}%M%u%f${vcs_info_msg_0_}]%~/%f%(!.#.
$) '

# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
bindkey -e

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=10

# 自動補完を有効にする
autoload -U compinit; compinit
setopt auto_cd

setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

## ヒストリーファイル設定
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384

#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups

zstyle ':completion:*:default' menu select=1

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
