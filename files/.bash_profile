if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

# Added by Windsurf
export PATH="/Users/hugo/.codeium/windsurf/bin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
