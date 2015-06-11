module RSpec
  module Representable
    class ContentMatcher < BaseMatcher

      def initialize(property, content)
        super(property)
        @content = content
      end

      def description
        "and #{@content ? 'is' : 'is not'} content value"
      end

      def matches?(subject)
        super(subject)
        options_for(property)[:content] == @content
      end


      def expectation
        "content => #{@content}"
      end

    end
  end
end
