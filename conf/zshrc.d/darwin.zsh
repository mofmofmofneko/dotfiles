export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/flutter/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 17);
path_remove() {
        export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`;
}
device_backup_enable() {
        sudo chmod 755 ~/Library/Application\ Support/MobileSync/Backup
}
device_backup_disable() {
        sudo chmod 0000 ~/Library/Application\ Support/MobileSync/Backup
}
jdk() {
        path_remove "$JAVA_HOME/bin"
        unset JAVA_HOME
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v "$version");
        export PATH=$JAVA_HOME/bin:$PATH
        java -version
}
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_VERSION=$(ls -t $ANDROID_HOME/ndk | head -n 1)
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/$ANDROID_NDK_VERSION"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$(ls -t $ANDROID_HOME/build-tools/ | head -n 1):$ANDROID_NDK_HOME:$PATH"

typeset -gU path PATH

if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# alias
alias ghidra='jdk 17 && /opt/homebrew/bin/ghidraRun'
alias brew='PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'
alias dnscache_clear='sudo killall -HUP mDNSResponder'
alias ddprogress='while true; do sudo killall -INFO dd; sleep 2; done'
alias libtool='glibtool'
alias libtoolize='glibtoolize'
if type ggrep &>/dev/null; then
  alias grep='ggrep'
fi
