#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
MITAMAE_BIN="$HOME/bin/mitamae"
MITAMAE_VERSION="v1.12.10"
MITAMAE_URL="https://github.com/itamae-kitchen/mitamae/releases/download/$MITAMAE_VERSION/"

if [ `uname` = 'Darwin' ]; then
  # Install Command Line tools
  echo "Checking Xcode CLI tools"
  xcode-select -p &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Xcode CLI tools not found. Installing them..."
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    PROD=$(softwareupdate -l | grep "\*.*Command Line" | grep -v "beta" | tail -n 1 | sed 's/^[^C]* //')
    echo "Prod: ${PROD}"
    softwareupdate -i "$PROD" --verbose;
  fi
  echo "Xcode CLI tools OK"
  
  # Install homebrew
  echo "Checking homebrew"
  which brew > /dev/null
  if [ "$?" -ne 0 ]; then
    echo "homebrew not found. Installing them..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    case "$(uname -m)" in
        "x86_64")
            eval $(/usr/local/bin/brew shellenv)
            ;;
        "arm64")
            eval $(/opt/homebrew/bin/brew shellenv)
            ;;
        *)
            echo "unsupported architecture: $(uname -m)"
            exit 1
            ;;
    esac
  fi
  echo "homebrew OK"
  
  # Install rosetta
  case "$(uname -m)" in
      "arm64")
          echo "Checking rosetta"
          if ! /usr/bin/pgrep -q oahd; then
            echo "rosetta not found. Installing them..."
            softwareupdate --install-rosetta --agree-to-license
          fi
          echo "rosetta OK"
          ;;
      *)
          ;;
  esac
fi

# Install mitamae
if [ ! -e $HOME/bin ]; then
  mkdir $HOME/bin
fi
if [ ! -e $MITAMAE_BIN ]; then
  case "$(uname -m)" in
      "x86_64")
          mitamae_arch="x86_64"
          ;;
      "arm64")
          mitamae_arch="aarch64"
          ;;
      *)
          echo "unsupported architecture: $(uname -m)"
          exit 1
          ;;
  esac
  curl -L "${MITAMAE_URL}mitamae-${mitamae_arch}-`uname`" -o $MITAMAE_BIN
  chmod +x $MITAMAE_BIN
fi
$MITAMAE_BIN version

# Clone nekolaboratory/.dotfiles
if [ ! -e $DOTFILES_DIR ]; then
  git clone https://github.com/nekolaboratory/dotfiles.git $DOTFILES_DIR
fi
cd $DOTFILES_DIR

# Run mitamae
$MITAMAE_BIN local -y nodes/`uname`.yml entry.rb --log-level=debug
