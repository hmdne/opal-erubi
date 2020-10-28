# This file is for sprockets support.

require 'opal-sprockets'

module Opal
  module Erubi
    class Processor < Opal::Sprockets::Processor
      def call
        @data = Opal::Erubi.compile_erubi @data, context.logical_path.sub(/#{Opal::REGEXP_START}templates\//, '')
        super
      end
    end
  end
end

Sprockets.register_mime_type 'application/html+erubi', extensions: ['.erubi']
Sprockets.register_transformer 'application/html+erubi', 'application/javascript', Opal::Erubi::Processor
Opal::Sprockets.register_mime_type 'application/html+erubi'
