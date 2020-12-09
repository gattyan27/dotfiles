
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

function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

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
alias vi="vim"
alias l="ls -al"

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

# git ブランチ名を色付きで表示させるメソッド
#function rprompt-git-current-branch {
#  local branch_name st branch_status
# 
#  if [ ! -e  ".git" ]; then
#    # git 管理されていないディレクトリは何も返さない
#    return
#  fi
#  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#  st=`git status 2> /dev/null`
#  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#    # 全て commit されてクリーンな状態
#    branch_status="%F{green}"
#  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
#    # git 管理されていないファイルがある状態
#    branch_status="%F{red}?"
#  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
#    # git add されていないファイルがある状態
#    branch_status="%F{red}+"
#  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
#    # git commit されていないファイルがある状態
#    branch_status="%F{yellow}!"
#  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
#    # コンフリクトが起こった状態
#    echo "%F{red}!(no branch)"
#    return
# else
#    # 上記以外の状態の場合
#    branch_status="%F{blue}"
#  fi
  # ブランチ名を色付きで表示する
#  echo "${branch_status}[$branch_name]"
#}
 
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
 
# プロンプトの右側にメソッドの結果を表示させる
#RPROMPT='`rprompt-git-current-branch`'
