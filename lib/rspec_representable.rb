require 'rspec/core'
require 'rspec/representable/version'
require 'rspec/representable/base_matcher'
require 'rspec/representable/option_matchers'
require 'rspec/representable/property_matcher'
require 'rspec/representable/collection_matcher'
require 'rspec/representable/have_representable_collection_matcher'
require 'rspec/representable/have_representable_property_matcher'

module RSpec
  module Representable
    def have_representable_property(attribute)
      ::RSpec::Representable::HaveRepresentablePropertyMatcher.new(attribute)
    end

    def have_representable_collection(attribute)
      ::RSpec::Representable::HaveRepresentableCollectionMatcher.new(attribute)
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Representable
end
