
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
homeshick --quiet refresh

# remove duplicates in PATH:
PATH=$(echo ${PATH} | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')
PATH="${PATH%:}"    # remove trailing colon
export PATH
