module RSpec
  module Representable
    class HaveRepresentableCollectionMatcher < BaseMatcher
      include OptionMatchers
      def initialize(property)
        super(property)
        add_representable_collection_submatcher
      end

      def matches?(subject)
        super(subject)
        default_matches?
      end

      private

      def property_type_description
        'collection'
      end

      def add_representable_collection_submatcher
        add_submatcher(CollectionMatcher.new(property))
      end
    end
  end
end
