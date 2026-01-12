# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- default Oh My Zsh theme
ZSH_THEME="darkblood"

# Which plugins would you like to load?
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

alias ls='colorls --sort-dirs -1'
alias lc='colorls -lA --sd'

export PATH="/opt/homebrew/bin:$PATH"

# eza setup
alias ls='eza -l --icons=always --color=always --group-directories-first'
alias ll='eza -lah --icons=always --git --color=always --group-directories-first'
alias lt='eza --tree --level=2 --icons=always --color=always'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fastfetch
# neofetch
eval "$(starship init zsh)"
# Added by Antigravity
export PATH="/Users/surya.dev/.antigravity/antigravity/bin:$PATH"


# zoxide
eval "$(zoxide init zsh)"

alias cd="z"

alias python="python3"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/surya.dev/.lmstudio/bin"
# End of LM Studio CLI section

#--Yazi Setup--
export EDITOR="nvim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

source /Users/surya.dev/.config/broot/launcher/bash/br
