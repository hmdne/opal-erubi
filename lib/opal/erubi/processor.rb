# This file is for sprockets support.

require 'opal-sprockets'

module Opal
  module Erubi
    class Processor < ::Opal::Processor
      self.default_mime_type = 'application/javascript'

      def evaluate(context, locals, &block)
        @data = Opal::Erubi.compile_erubi @data, context.logical_path.gsub(/\Atemplates\//, '')
        super
      end

      def self.compiler_options
        # otherwise would check current class `attr_accessor`s
        ::Opal::Processor.compiler_options
      end
    end
  end
end

if Opal::Sprockets.respond_to? :register_mime_type # Sprockets 4.0 support
  Sprockets.register_mime_type 'application/html+erubi', extensions: ['.erubi']
  Sprockets.register_transformer 'application/html+erubi', 'application/javascript', Opal::Erubi::Processor
  Opal::Sprockets.register_mime_type 'application/html+erubi'
else
  if Sprockets.respond_to? :register_transformer
    extra_args = [{mime_type: 'application/javascript', silence_deprecation: true}]
  else
    extra_args = []
  end
  Sprockets.register_engine '.erubi', Opal::Erubi::Processor, *extra_args
end