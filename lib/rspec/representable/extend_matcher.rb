module RSpec
  module Representable
    class ExtendMatcher < BaseMatcher
      def initialize(property, klass)
        super(property)
        @klass = klass
      end
      def description
        "extends with #{@klass}"
      end

      def matches?(subject)
        super(subject)
        options_for(property)[:extend] == @klass
      end
    end
  end
end
