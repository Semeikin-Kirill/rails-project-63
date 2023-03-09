# frozen_string_literal: true

module HexletCode
  # generation tags
  module Tag
    @single_tags_list = %w[link input meta param source track wbr keygen area base br col embed hr img]

    class << self
      def build(tag_name, attributes = {})
        text_attributes = attribute_generation attributes

        if @single_tags_list.include?(tag_name)
          "<#{tag_name}#{text_attributes}>"
        else
          result = block_given? ? yield : ''
          "<#{tag_name}#{text_attributes}>#{result}</#{tag_name}>"
        end
      end

      def attribute_generation(attributes)
        return '' if attributes.empty?

        result = attributes.to_a.map { |key, value| " #{key}=\"#{value}\"" }
        result.join
      end
    end
  end
end
