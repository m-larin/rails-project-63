# frozen_string_literal: true

require 'hexlet_code/version'

# Модуль учебной задачи Hexlet
module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'

  # Генератор полей формы
  class FormInputGenerator
    def initialize(obj)
      @form_obj = obj
      @result = String.new
    end

    def input(name, attrs = {})
      object_value = @form_obj.public_send name

      tag = attrs[:as] == :text ? 'textarea' : 'input'

      tag_attrs = attrs.except(:as).merge name: name

      @result += HexletCode::Tag.build('label', { for: name }) { name.to_s.capitalize }

      if tag == 'textarea'
        tag_attrs = { cols: '20', rows: '40' }.merge(tag_attrs)
        @result += HexletCode::Tag.build(tag, tag_attrs) { object_value }
      else
        tag_attrs = { type: 'text' }.merge(tag_attrs).merge(value: object_value)
        @result += HexletCode::Tag.build(tag, tag_attrs)
      end
    end

    def submit(val = 'Save')
      @result += HexletCode::Tag.build 'input', type: 'submit', value: val
    end

    def to_s
      @result
    end
  end

  def self.form_for(obj, attributes = {})
    action = attributes[:url]
    action ||= '#'

    result = "<form action=\"#{action}\" method=\"post\">"
    if block_given?
      generator = FormInputGenerator.new obj
      yield(generator)
      result += generator.to_s
    end
    result += '</form>'
    result
  end
end
