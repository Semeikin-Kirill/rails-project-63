# frozen_string_literal: true

module HexletCode
  class FormCreate
    def initialize(user)
      @user = user
      @form = []
    end

    def input(name, as: nil, **options)
      value = @user.public_send name
      if as.nil?
        options_input = { name: name.to_s, type: "text", value: value }.merge(options)
        label = HexletCode::Tag.build("label", for: name.to_s) { name.to_s.capitalize }
        @form << "  #{label}"
        input = HexletCode::Tag.build "input", options_input
        @form << "  #{input}"
      else
        options_text = { name: name.to_s, cols: "20", rows: "40" }.merge(options)
        textarea = HexletCode::Tag.build("textarea", options_text) { value }
        @form << "  #{textarea}"
      end
    end

    def submit(value = "Save")
      submit = HexletCode::Tag.build "input", type: "submit", value: value
      @form << "  #{submit}"
    end

    def get_result
      if @form.any?
        ["\n", @form.join("\n"), "\n"].join
      else
        ""
      end
    end
  end
end
