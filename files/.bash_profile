if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"
