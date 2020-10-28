require 'opal'

module Opal
  module BuilderProcessors
    class ErubiProcessor < RubyProcessor
      handles :erubi

      def initialize(*args)
        super
        @filename = ::Opal::Compiler.module_name(@filename)
        @source = prepare(@source, @filename)
      end

      def requires
        ['erubi'] + super
      end

      private

      def prepare(source, path)
        ::Opal::Erubi::compile_erubi(source, path)
      end
    end
  end
end
