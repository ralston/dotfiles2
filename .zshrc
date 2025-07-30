EDITOR=nano

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### zinit plugins: 

autoload -Uz compinit && compinit

if (( $+functions[zinit] )); then
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting	
  zinit light junegunn/fzf
  zinit light Aloxaf/fzf-tab

  zinit ice lucid wait'0'
  zinit light joshskidmore/zsh-fzf-history-search

  zinit light sindresorhus/pure

  zinit light lukechilds/zsh-nvm  # Lazy-loads nvm automatically

  zinit light unixorn/rvm-plugin

  zinit snippet OMZ::plugins/git/git.plugin.zsh

  echo "zinit done"
else
  echo "⚠️ Zinit not found; skipping plugin load"
fi
