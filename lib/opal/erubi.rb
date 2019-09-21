require 'erubi'

require 'opal/erubi/version'
require 'opal/erubi/builder'

#require 'opal/erubi/processor' <<< sprockets support, disabled by default

Opal.append_path File.expand_path('../../../lib-opal', __FILE__).untaint

module Opal
  module Erubi
    def self.compile_erubi(source, path)
      ::Erubi::Engine.new(source.to_s, 
        bufval: "__buf",
        postamble: "_buf.join }",
        escape: true,
        src: "require 'erubi';Template.new('#{path}') { |__buf| ",
        filename: path).src.dup
    end
  end
end