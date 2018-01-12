function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}
export PS1='\[\e[34m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\] \[\e[32m\]\w\[\e[0m\] $ '

# config command for storing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# set colored output for git diff
export LESS="- M -I -r"

# set colors
export CLICOLOR=1

# ri
export RI="--format ansi --width 80"

alias gs='git status'
alias gc='git commit'
alias gh='git hist'

alias l='ls -al'
alias ..='cd ..'

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'

echo "Loaded .bashrc"
