ps_for_stat() {
    ps aux | awk {'if ($8 ==  "'"$1"'") print $1" "$2" "$11'}
}
sleeping() {
  ps_for_stat "T"
}
