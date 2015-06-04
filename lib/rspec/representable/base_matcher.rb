module RSpec
  module Representable
    class BaseMatcher

      attr_reader :property, :subject, :submatchers

      def initialize(property)
        @property    = property.to_s
        @submatchers = []
      end

      def matches?(subject)
        @subject = subject
      end

      def default_matches?
        exists = property_exists?
        return false unless exists
        @check_submatches = true
        submatchers_match?
      end

      def description
        description = "have Representable #{property}"
        [description, submatchers.map(&:description)].flatten.join(' ')
      end

      def failure_message
        "Expected #{expectation} with #{failing_submatchers.map(&:expectation).join(' and ')}"
      end

      alias failure_message_for_should failure_message

      def failure_message_when_negated
        "Did not expect #{expectation} with #{failing_submatchers.map(&:expectation).join(' and ')}"
      end

      alias failure_message_for_should_not failure_message_when_negated

      def property_exists?
        !definitions_for(property).nil?
      end

      protected

      def expectation
        "#{subject.class} to have a Representable #{property_type_description} called #{property}"
      end

      def options_for(property)
        definitions_for(property).instance_variable_get(:@options)
      end

      def definitions_for(property)
        properties[:definitions][property]
      end

      def properties
        @properties ||= subject.__send__(:representable_attrs)
      end

      def add_submatcher(matcher)
        @submatchers << matcher
      end

      def submatchers_match?
        failing_submatchers.empty?
      end

      def failing_submatchers
        return [] unless @check_submatches
        @failing_submatchers ||= submatchers.reject do |matcher|
          matcher.matches?(subject)
        end
      end
    end
  end
end