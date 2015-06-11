module RSpec
  module Representable
    class CollectionMatcher < BaseMatcher

      def description
        'collection'
      end

      def expectation
        'collection'
      end

      def matches?(subject)
        super(subject)
        options_for(property)[:collection] == true
      end
    end
  end
end
