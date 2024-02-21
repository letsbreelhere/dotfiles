alias vim=nvim
alias vi=nvim
alias ls='ls --color=auto'
alias be='bundle exec'
alias g=git
alias killbg='kill -9 ${${(v)jobstates##*:*:}%=*}'
alias dra='dev run app'
alias open=xdg-open
alias vpnstop='openvpn3 session-manage --pause --config ifttt'
alias vpnresume='openvpn3 session-manage --resume --config ifttt'
alias vpnquit='openvpn3 session-manage --disconnect --config ifttt'

function vpnstart() {
  login=$(op item get "IFTTT Bastion VPN" --fields username)
  otp=$(op item get "IFTTT Bastion VPN" --otp)
  pass=$(op item get "IFTTT Bastion VPN" --fields password)
  echo -e "$login\n$pass\n$otp" | openvpn3 session-start --config ifttt
}

function col() {
  awk "{print \$$1}"
}

# Bindings for fzf

alias hg="fzf --header 'C-O: Open in browser	Enter: copy' \
              --bind 'start:reload:echo' \
              --bind 'change:reload:hoogle -l --count=100 -q {q}' \
              --bind 'enter:execute-silent(echo -n {2} | xclip -selection clipboard)+abort' \
              --bind 'ctrl-o:execute-silent(xdg-open {-1})+abort' \
              --height=50% --layout=reverse \
              --preview 'hoogle --info {1}.{2}'"

alias psf="ps -ef | fzf -n8.. --header 'C-R: reload	C-Q: kill	Enter: copy PID' \
              --bind 'ctrl-r:reload(ps -ef)' \
              --bind 'ctrl-q:execute-silent(kill -9 {2})+reload(ps -ef)' \
              --bind 'enter:execute-silent(echo -n {2} | xclip -selection clipboard)+abort' \
              --height=50% --layout=reverse"
