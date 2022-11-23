# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # Модуль генерации тегов
  module Tag
    TAG_NAMES = %w[br img input].freeze

    def self.build(tag, attributes = {})
      raise "Tag #{tag} is not supported" unless TAG_NAMES.include? tag.downcase

      attributes_as_string = ""
      attributes.each do |attr_name, attr_value|
        attributes_as_string += " #{attr_name}=\"#{attr_value}\""
      end
      "<#{tag}#{attributes_as_string}>"
    end
  end
end
