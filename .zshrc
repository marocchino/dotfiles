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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github osx ruby rails brew gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GAEJ_HOME=~/Library/appengine-java-sdk-1.3.0
export PATH=/opt/local/bin:/opt/local/sbin:$PATH:/usr/local/MzScheme\ v4.2.2/bin:~/Library/flex_sdk_3.4/bin:~/Library/android-sdk-mac/tools:$GAEJ_HOME/bin:/opt/local/share/java/jruby/lib/ruby/gems/1.8/bin

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
chpwd_check_rvm() {
    current_version=$(rvm info | grep " version:" | grep "1\." | cut -d '"' -f2 | cut -d 'p' -f1)
    dir=$(pwd)
    while [ "${dir}" != "" ]; do
        cfg="${dir}/.rvminfo"

        if [ -f ${cfg} ]; then
            want_version=$(cat ${cfg})
            if [ "${want_version}" != "${current_version}" ]; then
                 rvm use ${want_version}
            fi
            break
        else

            dir=${dir%/*}
        fi
    done
}
chpwd_functions=( chpwd_check_rvm chpwd )
rvm 1.9.2

#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:/usr/local/MzScheme v4.2.2/bin:/Users/marocchino/Library/flex_sdk_3.4/bin:/Users/marocchino/Library/android-sdk-mac/tools:/Users/marocchino/Library/appengine-java-sdk-1.3.0/bin:/opt/local/share/java/jruby/lib/ruby/gems/1.8/bin
