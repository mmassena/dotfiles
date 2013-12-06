. ~/bin/bash_colors.sh

# Add paths that should have been there by default
export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:~/bin
export PATH=${PATH}:/usr/local/share/npm/bin

# Unbreak broken, non-colored terminal
export TERM='xterm-color'

# Is there any other?
export EDITOR=vim

# Aliases
alias ls='ls -G'
alias ll='ls -lG'
alias r='rails'
alias sr='screen -R'
alias sshs='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias vi='echo "use vim"'

# Aliases - Notes
alias idea='notes ideas.txt'
alias th='notes thailand.txt'
alias quotes='notes quotes.txt'

# Colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Git prompt components
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s)"`
        echo ${GIT_PROMPT}
    fi
}
PS1="\h:\W\$(grb_git_prompt) \u\$ "

source ~/bin/git-completion.bash

### Ghetto virtualenvwrapper
export VIRTUALENVS=~/.virtualenvs
source ~/.bashrc.d/virtualenv
