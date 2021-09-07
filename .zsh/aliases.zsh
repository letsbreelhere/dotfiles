alias vim=nvim
alias be='bundle exec'
alias rspec='bundle exec rspec'
alias g=git
alias ag='rg'
alias glint='eslint `git diff master --name-only`'
alias pretty='prettier --write `git diff master --name-only`'
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
alias restartnetwork='sudo nmcli con up "Wired connection 1"'

# surfshark vpn aliases
alias ssv="sudo surfshark-vpn"
alias ssvs="sudo surfshark-vpn status"
alias ssva="sudo surfshark-vpn attack"
alias ssvd="sudo surfshark-vpn down"
