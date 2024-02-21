function custom_precmd {
  vcs_info
  git_status=$(git status --porcelain 2>/dev/null)
  unadded_files=$(echo $git_status | grep -E '^.[?ACMDRU] ' | wc -l | awk {'print $1'})
  added_files=$(echo $git_status   | grep -E '^[ACMDR]. '  | wc -l | awk {'print $1'})

  if [ $added_files -eq 0 ] && [ $unadded_files -eq 0 ]; then
    vcs_status_string=""
  else
    vcs_status_string=" %F{red}$unadded_files %F{green}$added_files%F{reset}"
  fi

  hostname=$(hostname)
  return_status="%F{red}%(?..!%? )%F{reset}"
  job_info="%F{yellow}%(1j.%%%j .)"
  dirname="%F{blue}$(print -P %~)"
}
add-zsh-hook precmd custom_precmd

PROMPT='%K{reset}%F{white}[${return_status}${job_info}${dirname}%F{magenta}${vcs_info_msg_0_}${vcs_status_string}%F{white}]%K{reset}%F{reset} '
