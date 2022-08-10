if [ -e "$HOME/.anyenv" ]; then
    export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init --path)"
        if command -v pyenv 1>/dev/null 2>&1; then
            eval "$(pyenv init -)"
        fi
    fi
fi
