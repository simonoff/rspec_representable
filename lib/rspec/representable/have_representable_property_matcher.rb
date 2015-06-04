module RSpec
  module Representable
    class HaveRepresentablePropertyMatcher < BaseMatcher
      include OptionMatchers
      def initialize(property)
        super(property)
        add_representable_property_submatcher
      end

      def matches?(subject)
        super(subject)
        default_matches?
      end

      private

      def property_type_description
        'property'
      end

      def add_representable_property_submatcher
        add_submatcher(PropertyMatcher.new(property))
      end
    end
  end
end
