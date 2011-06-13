# base-files version 3.9-3

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP=/tmp
# export TEMP=/tmp

# Or use TMPDIR instead
# export TMPDIR=/tmp

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
#shopt -s nocaseglob
#shopt -s nocasematch

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
#case $- in
#  *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
#esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=auto'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..

alias gs='git status'
alias gd='git diff --staged'
alias gc='git commit'
alias gtc='git tfs ct --build-default-comment'
alias gtf='git tfs fetch'
alias gtm='git merge refs/remotes/tfs/default'


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

#### BEGIN msysGit ssh-agent setup:

SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
}

# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_agent
        fi
    fi
}

# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
	test_identities
    fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
        test_identities
    else
        start_agent
    fi
fi

## END msysGit ssh-agent setup

#### BEGIN JSD add-ons:

export PATH=$PATH:/cygdrive/c/TFS/TFC/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/Common7/Tools/
export PATH=$PATH:/cygdrive/c/Program\ Files/7-Zip/
export PATH=$PATH:/cygdrive/c/Program\ Files/GitExtensions/

export PATH=$PATH:/cygdrive/c/WINDOWS/Microsoft.NET/Framework/v3.5:/c/WINDOWS/Microsoft.NET/Framework/v2.0.50727
export PATH=$PATH:/cygdrive/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem
export PATH=$PATH:/cygdrive/c/WINDOWS/system32/WindowsPowerShell/v1.0
export PATH=$PATH:/cygdrive/c/Program\ Files/Bitvise\ Tunnelier
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/Common7/IDE
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/VC/BIN
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/Common7/Tools
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/VC/VCPackages
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ Visual\ Studio\ 9.0/Team\ Tools/Performance\ Tools/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SDKs/Windows/v6.0A/bin
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/80/Tools/Binn/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/90/Tools/binn/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/90/DTS/Binn/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/90/Tools/Binn/VSShell/Common7/IDE/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/100/Tools/Binn/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/100/DTS/Binn/
export PATH=$PATH:/cygdrive/c/Program\ Files/Microsoft\ SQL\ Server/100/Tools/Binn/VSShell/Common7/IDE/

cd /cygdrive/c/TFS/git/K/KVU/KUC-Development/Solution/

#### END JSD add-ons
