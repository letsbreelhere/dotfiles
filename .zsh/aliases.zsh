alias vim='nvim'
alias vi='nvim'
alias be='bundle exec'
alias rspec='bundle exec rspec'
alias g=git
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ls='ls --color=auto'
alias open=xdg-open
