module RSpec
  module Representable
    class AsMatcher < BaseMatcher

      def initialize(property, as)
        super(property)
        @as = as
      end

      def description
        "as #{@as}"
      end

      def matches?(subject)
        super(subject)
        options_for(property)[:as] == @as
      end


      def expectation
        "as => #{@as}"
      end

    end
  end
end
