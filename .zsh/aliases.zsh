alias vim=nvim
alias gd='git diff --staged'
alias be='bundle exec'
alias rspec='bundle exec rspec'
alias g=git
alias ag='ag --path-to-ignore ~/.agignore'
alias -g .w='build --file-watch'
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
