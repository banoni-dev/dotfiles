# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh
source ~/.config/zshrc.d/dots-hyprland.zsh

alias rcp='~/my_stuff/scripts/cp/rust-template.sh'
alias d='docker'
alias dc='docker compose'
alias cpc='~/my_stuff/scripts/cp/cpp-template.sh'
alias cat='bat'
alias l='exa -al --git --icons --color=always --long --no-permissions --no-user --no-filesize --git --no-time'
alias ls='exa -al --git --icons' 
alias lg='exa -alG --git --icons --color=always --long --no-permissions --no-user --no-filesize --git --no-time'
alias v='nvim'
alias gs='git status'
alias gc='git commit -m'
alias ga='git add .'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias rofi='exec ~/.config/rofi/scripts/launcher_t7'
alias m='mkdir'
alias ps='pass show -c' 
alias pso='pass otp -c' 
alias codelldb='~/my_stuff/unzipped_files/codelldb/extension/adapter/codelldb --port 13000' 
alias cd='z' 
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

export PATH=$HOME/.config/rofi/scripts:$PATH
export PATH=”$PATH:/usr/local/bin/python312”
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz compinit
compinit
export PATH=$PATH:~/swww/target/release

# Created by `pipx` on 2024-02-20 06:21:57
export PATH="$PATH:/home/ahmed/.local/bin"

# bun completions
[ -s "/home/ahmed/.bun/_bun" ] && source "/home/ahmed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/ahmed/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export EDITOR=nvim
source <(fzf --zsh)
eval "$(zoxide init zsh)"
# pnpm end
#
#
#
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
