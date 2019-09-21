require 'opal'

module Opal
  module BuilderProcessors
    class ErubiProcessor < RubyProcessor
      handles :erubi

      def initialize(*args)
        super
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

  # You could do this if you wanted to reclaim "erb" extension but I'm afraid
  # it may cause some problems. ERB is used for preprocessing (Opal) Ruby code.
  #Builder.processors.delete(BuilderProcessors::ERBProcessor)
end
