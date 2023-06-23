if [ -e "$HOME/.anyenv" ]; then
    export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if ! [ -f /tmp/pyenv.cache ]; then
      pyenv init - > /tmp/pyenv.cache
      zcompile /tmp/pyenv.cache
   fi
   source /tmp/pyenv.cache
fi
