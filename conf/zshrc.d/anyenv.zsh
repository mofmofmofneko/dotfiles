if [ -e "$HOME/.anyenv" ]; then
  export ANYENV_ROOT="$HOME/.anyenv"
  export PATH="$ANYENV_ROOT/bin:$PATH"

  if ! [ -f /tmp/anyenv.cache ]; then
    anyenv init - --no-rehash > /tmp/anyenv.cache
    zcompile /tmp/anyenv.cache
  fi
  source /tmp/anyenv.cache
fi
