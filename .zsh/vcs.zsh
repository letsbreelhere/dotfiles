autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " %b"
zstyle ':vcs_info:git*' actionformats " %b (%a)"
