function day_of_week_symbol {
  case $(date +%u) in
    1) echo "☾";;
    2) echo "⚣";;
    3) echo "☿";;
    4) echo "♃";;
    5) echo "⚢";;
    6) echo "♄";;
    7) echo "☉";;
  esac
}

function custom_precmd {
  vcs_info
  git_status=$(git status --porcelain 2>/dev/null)
  unadded_files=$(echo $git_status | egrep '^.[?ACMDR] ' | wc -l | awk {'print $1'})
  added_files=$(echo $git_status   | egrep '^[ACMDR]. '  | wc -l | awk {'print $1'})

  if [ $added_files -eq 0 ] && [ $unadded_files -eq 0 ]; then
    vcs_status_string=""
  else
    vcs_status_string=" %{$fg[red]%}$unadded_files %{$fg[green]%}$added_files%{$fg[cyan]%}"
  fi

  job_info=$(jobs | prompt_jobs)
  prompt_symbol=$(day_of_week_symbol)
  hostname=$(hostname)
  return_status="%{$fg[red]%}%(?..[%?] )%{$reset_color%}"
  dirname=$(print -P %~)
}
add-zsh-hook precmd custom_precmd

PROMPT='${return_status}%{$fg[magenta]%}${job_info}%{$fg[blue]%}${dirname}%{$fg[green]%}${vcs_info_msg_0_}${vcs_status_string}%{$reset_color%}%{$fg[magenta]%} ${prompt_symbol}%{$reset_color%} '
