function custom_precmd {
  vcs_info
  git_status=$(git status --porcelain 2>/dev/null)
  unadded_files=$(echo $git_status | egrep '^.[?ACMDRU] ' | wc -l | awk {'print $1'})
  added_files=$(echo $git_status   | egrep '^[ACMDR]. '   | wc -l | awk {'print $1'})

  if [ $added_files -eq 0 ] && [ $unadded_files -eq 0 ]; then
    vcs_status_string=""
  else
    vcs_status_string=" %F{red}$unadded_files %F{green}$added_files"
  fi

  job_info=$(jobs | tail | tac | sed -E 's/\([^)]*\)//' | sed -E 's/^\[([[:digit:]]+)\].*suspended[[:space:]]+([[:alpha:]]+).*$/\2:\1/' | tr '\n+' ' ')
  hostname=$(hostname)
  return_status="%F{red}%(?..!%? )%F{reset}"
}

add-zsh-hook precmd custom_precmd

PROMPT='%K{reset}%F{white}[%K{reset}${return_status}%F{yellow}${job_info}%F{blue}%n:%F{magenta}%~%F{yellow}${vcs_info_msg_0_}${vcs_status_string}%K{reset}%F{white}]%F{white}%F{reset}%K{reset} '
