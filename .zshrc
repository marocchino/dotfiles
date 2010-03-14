# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="wezm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GAEJ_HOME=~/Library/appengine-java-sdk-1.3.0
export PATH=/opt/local/bin:/opt/local/sbin:$PATH:/usr/local/MzScheme\ v4.2.2/bin:~/Library/flex_sdk_3.4/bin:~/Library/android-sdk-mac/tools:$GAEJ_HOME/bin:/opt/local/share/java/jruby/lib/ruby/gems/1.8/bin

if [[ -s /Users/marocchino/.rvm/scripts/rvm ]] ; then source /Users/marocchino/.rvm/scripts/rvm ; fi

#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/local/MzScheme v4.2.2/bin:/Users/marocchino/Library/flex_sdk_3.4/bin:/Users/marocchino/Library/android-sdk-mac/tools:/Users/marocchino/Library/appengine-java-sdk-1.3.0/bin:/opt/local/share/java/jruby/lib/ruby/gems/1.8/bin
