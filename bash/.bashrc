# set terminal window title
PS1_SET_TITLE="\[\e]0;\u@\h:\w\a\]"

# get current branch in git repo
function git_prompt() {
    git rev-parse --is-inside-work-tree 2> /dev/null | grep -q true && {
        [ "$(git status --short | wc -l)" = "0" ] && echo -en "\e[32m" || echo -en "\e[31m"
        echo -n "$(git rev-parse --abbrev-ref HEAD 2> /dev/null) "
    }
}

PS1="$PS1_SET_TITLE\[\e[34m\]\u@\h:\w \`git_prompt\`\[\e[34m\]❯\[\e[m\] "

export PS1
