require 'rspec/representable/as_matcher'
require 'rspec/representable/extend_matcher'
require 'rspec/representable/attribute_matcher'
module RSpec
  module Representable
    module OptionMatchers
      def as(value)
        add_submatcher(AsMatcher.new(property, value))
        self
      end

      def extends(value)
        add_submatcher(ExtendMatcher.new(property, value))
        self
      end

      def with_attribute(value = true)
        add_submatcher(AttributeMatcher.new(property, value))
        self
      end
    end
  end
end
