# frozen_string_literal: true

require_relative "hexlet_code/version"
# root module
module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag.rb"

  def self.form_for(_user, options = {})
    action = options.fetch :url, "#"
    "<form action=\"#{action}\" method=\"post\"></form>"
  end
end
