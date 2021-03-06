alias vim=nvim
alias be='bundle exec'
alias rspec='bundle exec rspec'
alias g=git
alias ag='rg'
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
