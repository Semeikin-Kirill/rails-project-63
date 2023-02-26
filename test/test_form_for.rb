# frozen_string_literal: true

require "test_helper"

describe "Form generation" do
  model = Struct.new(:name, :job, keyword_init: true)
  it "generate form" do
    user = model.new name: "rob"
    expected = "<form action=\"#\" method=\"post\"></form>"
    result = HexletCode.form_for user
    assert_equal expected, result
  end

  it "generate form with attribute" do
    user = model.new name: "rob"
    expected = "<form action=\"/users\" method=\"post\"></form>"
    result = HexletCode.form_for user, url: "/users"
    assert_equal expected, result
  end
end
