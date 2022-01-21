#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# Setting paths with export
export PATH="$PATH:/home/santiago/.local/bin:/home/santiago/.emacs.d/bin:/usr/google/appinventor/commands-for-Appinventor/:$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/go/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:"
export NVM_DIR="$HOME/.nvm"
export EDITOR=vim
export VISUAL=vim
export HISTCONTROL=ignoreboth
export ZDOTDIR="$HOME/.config/zsh/"

# Initializing the starship prompt and setting the paths
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Setting up the aliases used in the shell
alias fans-low="nbfc set -f 0 1 -a"
alias fans-high="nbfc set -f 0 1 -s 100"
alias ls="exa -al --color=always --group-directories-first"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias ..="cd .."
alias R="R --quiet"
alias mapscii="telnet mapscii.me"
alias code='codium'
alias vim='nvim'
alias ed="ed -p ':' -v"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias xampp-gui="cd /opt/lampp && sudo ./manager-linux-x64.run && cd"
alias xampp-start="sudo /opt/lampp/lampp start"
alias xampp-stop="sudo /opt/lampp/lampp stop"
alias update="sudo pacman -Syyuu --noconfirm && yay -Syyuu --noconfirm && sudo snap refresh && sudo flatpak update && pip-review --auto && cargo install-update -a && npm update && sudo gem update"
alias clean-cache="sudo rm -R /home/santiago/.cache && sudo rm -R /home/santiago/Pictures/Screenshots/* && sudo rm -R /var/cache && trash-empty"

# Setting the history options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=/home/santiago/.cache/zsh/history

# Setting options
unsetopt menu_complete
unsetopt flowcontrol
setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Adding plugins
source /home/santiago/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/santiago/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/santiago/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh

# Setting pyenv paths
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
# echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
# echo 'eval "$(pyenv init --path)"' >> ~/.profile
# echo 'eval "$(pyenv init -)"' >> ~/.config/zsh/.zshrc
# eval "$(pyenv init -)"

# Setting conda paths
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

# Launching programs at startup
pfetch

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# RVM bash completion
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
