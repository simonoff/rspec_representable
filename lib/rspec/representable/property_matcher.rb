module RSpec
  module Representable
    class PropertyMatcher < BaseMatcher
      def description
        'property'
      end
      def matches?(subject)
        super(subject)
        options_for(property)[:collection].nil?
      end
    end
  end
end
