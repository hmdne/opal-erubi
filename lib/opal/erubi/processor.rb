# This file is for sprockets support.

require 'opal-sprockets'

module Opal
  module Erubi
    class Processor < ::Opal::Processor
      self.default_mime_type = 'application/javascript'

      def evaluate(context, locals, &block)
        @data = Opal::Erubi.compile_erubi @data, context.logical_path.sub(/^templates\//, '')
        super
      end

      def self.compiler_options
        # otherwise would check current class `attr_accessor`s
        ::Opal::Processor.compiler_options
      end
    end
  end
end

if Sprockets.respond_to? :register_transformer
  extra_args = [{mime_type: 'application/javascript', silence_deprecation: true}]
else
  extra_args = []
end

Sprockets.register_engine '.erubi', Opal::Erubi::Processor, *extra_args