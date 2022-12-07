# dotfiles

[![Build Status](https://github.com/nekolaboratory/dotfiles/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/nekolaboratory/dotfiles/actions/workflows/main.yml)

## What's this?
my configuration files

## How to install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nekolaboratory/dotfiles/main/install.sh)"
```

## Full setup via HomeBrew
```
brew bundle --file '.dotfiles/Brewfile'
```

## Change macOS settings

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nekolaboratory/dotfiles/main/.macos)"
```

## Install AppStore apps

```
# System Preferences > App Store > Password Settings > Free Downloads: [Save Password]
mas signin APPLE_ID PASSWORD
for app in `cat $HOME/.dotfiles/mas.list | awk '{ print $1 }'`
do
  mas install $app
done
```
