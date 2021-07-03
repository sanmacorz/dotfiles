# Initialize the starship prompt, and export the environment for the config file
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Setting up the aliases used in the shell
alias fans-low="nbfc set -f 0 1 -a"
alias fans-high="nbfc set -f 0 1 -s 100"
alias ls="exa -al --color=always --group-directories-first"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias ps="procs"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# Open pftech at startup
pfetch
