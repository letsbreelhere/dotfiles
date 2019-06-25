require 'irb/ext/save-history'
IRB.conf[:PROMPT][:DEFAULT] = {
  :PROMPT_I    => '> ',
  :PROMPT_S    => '%l> ',
  :PROMPT_C    => '.. ',
  :RETURN      => "=> %s\n"
}

IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
