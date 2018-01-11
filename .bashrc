echo "Loaded .bashrc"
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h:\[\033[34m\]$(parse_git_branch)\[\033[0m\]:\[\033[32m\]\w\[\033[0m\]> '

# config command for storing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# set colored output for git diff
export LESS="- M -I -r"

# ri
export RI="--format ansi --width 80"

alias gs='git status'
alias gc='git commit'
alias gh='git hist'

alias l='ls -al'
alias ..='cd ..'

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
