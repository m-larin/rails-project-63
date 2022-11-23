# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  module Tag
    TAG_NAMES = %w[br img input].freeze

    def self.build(tag, attributes = {})
      if TAG_NAMES.include? tag.downcase
        attributes_as_string = ''
        attributes.each do |attr_name, attr_value|
          attributes_as_string += " #{attr_name}=\"#{attr_value}\""
        end
        "<#{tag}#{attributes_as_string}>"
      else
        raise "Tag #{tag} is not supported"
      end
    end
  end
end
