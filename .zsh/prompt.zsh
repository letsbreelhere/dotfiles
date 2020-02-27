function custom_precmd {
  vcs_info
  git_status=$(git status --porcelain 2>/dev/null)
  unadded_files=$(echo $git_status | egrep '^.[?ACMDR] ' | wc -l | awk {'print $1'})
  added_files=$(echo $git_status   | egrep '^[ACMDR]. '  | wc -l | awk {'print $1'})

  if [ $added_files -eq 0 ] && [ $unadded_files -eq 0 ]; then
    vcs_status_string=""
  else
    vcs_status_string=" %F{red}$unadded_files %F{green}$added_files%F{cyan}"
  fi

  job_info=$(jobs | sed -E 's/\([^)]*\)//' | sed -E 's/^\[([[:digit:]]+)\].*suspended[[:space:]]+([[:alpha:]]+).*$/\2:\1/' | tr '\n+' ' ')
  hostname=$(hostname)
  return_status="%F{196}%(?..⚠:%? )%F{}"
  dirname=$(print -P %~)
}
add-zsh-hook precmd custom_precmd

PROMPT='%F{237}┌%K{237}${return_status}%F{yellow}${job_info}%F{blue}${dirname}%F{magenta}${vcs_info_msg_0_}${vcs_status_string}%K{}%F{237}
%F{237}└⮞%F{}%K{} '
