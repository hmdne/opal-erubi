require 'template'

module Erubi
  ESCAPE_TABLE={"&"=>"&amp;", "<"=>"&lt;", ">"=>"&gt;", "\""=>"&quot;", "'"=>"&#39;"}

  def self.h value
    value.to_s.gsub(/[&<>"']/, ESCAPE_TABLE)
  end
end

class Template
  class OutputBuffer
    alias << append
  end
end
