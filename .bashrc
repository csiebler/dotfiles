function parse_git_dirty {
  #[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "🤞" || echo "👌"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

# Original
#export PS1='\[\e[34m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\] \[\e[32m\]\w\[\e[0m\] $ '

# New 2019
export PS1='⚡️ \[\e[34m\]\u\[\e[0m\]\[\e[38m\]$(parse_git_branch)\[\e[0m\] \[\e[32m\]\w\[\e[0m\] $ '

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
export PATH=/usr/local/bin:$PATH

echo "Loaded .bashrc"
