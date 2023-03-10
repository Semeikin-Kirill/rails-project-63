# frozen_string_literal: true

module HexletCode
  # generation form
  class FormCreate
    def initialize(user)
      @user = user
      @form = []
    end

    def input(name, as: nil, **options)
      value = @user.public_send name
      label name
      if as.nil?
        options_input = { name: name.to_s, type: 'text', value: value }.merge(options)
        input = HexletCode::Tag.build 'input', options_input
        @form << "  #{input}"
      else
        textarea name, value, options
      end
    end

    def textarea(name, value, options)
      options_text = { name: name.to_s, cols: '20', rows: '40' }.merge(options)
      textarea = HexletCode::Tag.build('textarea', options_text) { value }
      @form << "  #{textarea}"
    end

    def label(name)
      label = HexletCode::Tag.build('label', for: name.to_s) { name.to_s.capitalize }
      @form << "  #{label}"
    end

    def submit(value = 'Save')
      submit = HexletCode::Tag.build('input', { type: 'submit', value: value })
      @form << "  #{submit}"
    end

    def result
      if @form.any?
        ["\n", @form.join("\n"), "\n"].join
      else
        ''
      end
    end
  end
end
