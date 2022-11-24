# frozen_string_literal: true

module HexletCode
  # Модуль генерации тегов
  module Tag
    TAG_NAMES = %w[br img input textarea label].freeze

    def self.build(tag, attributes = {})
      raise "Tag #{tag} is not supported" unless TAG_NAMES.include? tag.downcase

      attributes_as_string = ""
      attributes.each do |attr_name, attr_value|
        attributes_as_string += " #{attr_name}=\"#{attr_value}\""
      end
      result = "<#{tag}#{attributes_as_string}>"
      if block_given?
        result += yield
        result += "</#{tag}>"
      end
      result
    end
  end
end
