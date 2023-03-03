alias vim=nvim
alias vi=nvim
alias be='bundle exec'
alias rspec='bundle exec rspec'
alias g=git
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
alias dra='dev run app'

function col() {
  awk "{print \$$1}"
}
