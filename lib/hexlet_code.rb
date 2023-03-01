# frozen_string_literal: true

require_relative "hexlet_code/version"
# root module
module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag.rb"
  autoload :FormCreate, "hexlet_code/form.rb"

  def self.form_for(user, url: "#", **options)
    attributes_form = { action: url, method: "post" }.merge(options)
    Tag.build("form", attributes_form) do
      f = FormCreate.new user
      value = yield(f) if block_given?
      if f.get_result.empty?
        value
      else
        f.get_result
      end
    end
  end
end
