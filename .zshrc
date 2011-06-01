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
plugins=(git github osx ruby rails3 brew gem node npm)

source $ZSH/oh-my-zsh.sh
export TERM=linux

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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
export GREP_OPTIONS=
alias gup="ssh dev-2 \"cd dev-2/iadmin;git up\";rsync  -avlz -e ssh dev-2:dev-2/iadmin/ ~/dev-2/iadmin"
alias gdc="ssh dev-2 \"cd dev-2/iadmin;git svn dcommit\";rsync  -avlz -e ssh dev-2:dev-2/iadmin/ ~/dev-2/iadmin"
