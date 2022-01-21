#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# Setting up the aliases used in the shell
alias fans-low="nbfc set -f 0 1 -a"
alias fans-high="nbfc set -f 0 1 -s 100"
alias ls="exa -al --color=always --group-directories-first"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias ps="procs"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias ..="cd .."
alias R="R --quiet"
alias mapscii="telnet mapscii.me"
alias code='codium'
alias vim='nvim'
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias xampp-gui="cd /opt/lampp && sudo ./manager-linux-x64.run && cd"
alias xampp-start="sudo /opt/lampp/lampp start"
alias xampp-stop="sudo /opt/lampp/lampp stop"
alias update="sudo pacman -Syyuu --noconfirm && yay -Syyuu --noconfirm && pip-review --auto && cargo install-update -a && npm update"

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

unset use_color safe_term match_lhs sh
xhost +local:root > /dev/null 2>&1
shopt -s checkwinsize
shopt -s expand_aliases
# export QT_SELECT=4
# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.cargo/env"
APPINVENTOR=/usr/google/appinventor/commands-for-Appinventor
export PATH=$PATH:$APPINVENTOR

# Initializes the starship prompt.
eval "$(starship init bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/santiago/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/santiago/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/santiago/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/santiago/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv init -)"
