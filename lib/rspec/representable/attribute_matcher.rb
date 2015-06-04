module RSpec
  module Representable
    class AttributeMatcher < BaseMatcher

      def initialize(property, attribute)
        super(property)
        @attribute = attribute
      end

      def description
        "and #{@attribute ? 'is' : 'is not'} attribute"
      end

      def matches?(subject)
        super(subject)
        options_for(property)[:attribute] == @attribute
      end


      def expectation
        "attribute => #{@attribute}"
      end

    end
  end
end
