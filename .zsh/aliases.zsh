alias vim=nvim
alias vi=nvim
alias ls='ls --color=auto'
alias be='bundle exec'
alias g=git
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
alias dra='sudo dev run app'

function col() {
  awk "{print \$$1}"
}
