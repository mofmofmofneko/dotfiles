#!/usr/bin/env bash

wget -P $HOME https://raw.githubusercontent.com/nekolaboratory/dotfiles/main/conf/zshrc.d/darwin.zsh
mv -f $HOME/zshrc $HOME/.dotfiles/conf/zshrc.d/darwin.zsh
touch -cm -t200001010000.00 $HOME/.dotfiles/conf/zshrc.d/darwin.zsh
