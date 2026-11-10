EDITOR=nano

source ~/.zsh-interactive-only

export GCP_PROJECT=beast-ai-engr
export GCP_REGION=us-east5

# History — share across shells, keep a lot, write immediately
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY        # append, don't overwrite the history file
setopt INC_APPEND_HISTORY    # write each command immediately (not just at shell exit)
# SHARE_HISTORY omitted — each shell keeps its own up-arrow context
# INC_APPEND_HISTORY (above) ensures all commands still reach the shared file immediately
setopt HIST_IGNORE_ALL_DUPS  # drop older duplicate entries
setopt HIST_IGNORE_SPACE     # don't record commands starting with a space
setopt HIST_REDUCE_BLANKS    # trim extra whitespace before saving
setopt EXTENDED_HISTORY      # record timestamp of each command

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

  # zinit light lukechilds/zsh-nvm  # Lazy-loads nvm automatically

  # zinit light unixorn/rvm-plugin

  zinit snippet OMZ::plugins/git/git.plugin.zsh

  zinit snippet OMZP::git
  alias gap="git add -p"
  alias gs="git status"
  alias gcv="git commit -v"

  echo "✅ zinit happy"
else
  echo "⚠️ Zinit not found; skipping plugin load"
fi

git config --global user.name ralston
git config --global user.email 231297+ralston@users.noreply.github.com

source ~/.aliases


export PATH="$HOME/bin:$PATH"
export PATH="~/.local/share/mise/shims:$PATH"

eval "$(mise activate zsh)"
eval "$(starship init zsh)"

killport() { lsof -ti:"$1" | xargs kill -9; }
export PATH="$HOME/.local/bin:$PATH"

# sentry
fpath=("/Users/ralston.clarke/.local/share/zsh/site-functions" $fpath)

# add Pulumi to the PATH
export PATH=$PATH:/Users/ralston.clarke/.pulumi/bin


### aws
export AWS_PROFILE=platform-eng-base

# bun completions
[ -s "/Users/ralston.clarke/.bun/_bun" ] && source "/Users/ralston.clarke/.bun/_bun"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ralston.clarke/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ralston.clarke/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ralston.clarke/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ralston.clarke/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
setopt interactive_comments
