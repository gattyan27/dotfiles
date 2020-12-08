#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting'   # 追加

# alias
alias t="tmux a"

# 環境変数
export LANG=ja_JP.UTF-8
export KCODE=u           # KCODEにUTF-8を設定

## 色を使用出来るようにする
autoload -Uz colors
colors

## 補完機能を有効にする
autoload -Uz compinit
compinit

# 'cd' なしで移動する
setopt auto_cd
setopt auto_pushd

# 重複するディレクトリは記録しないようにする
setopt correct

# 'cd -' [Tab] で以前移動したディレクトリに移動する
setopt pushd_ignore_dups

# 移動した後は 'ls' する
function chpwd() { ls -F }

## タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイル名を表示可能にする
setopt print_eight_bit

## ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

## ヒストリー検索設定
stty -ixon

