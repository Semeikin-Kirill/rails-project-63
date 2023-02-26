# frozen_string_literal: true

require "test_helper"

describe "Tag generation" do
  it "generate br" do
    expected = "<br>"
    result = HexletCode::Tag.build("br")
    assert_equal expected, result
  end
  it "generate img" do
    expected = '<img src="path/to/image">'
    result = HexletCode::Tag.build("img", src: "path/to/image")
    assert_equal expected, result
  end
  it "generate input" do
    expected = '<input type="submit" value="Save">'
    result = HexletCode::Tag.build("input", type: "submit", value: "Save")
    assert_equal expected, result
  end
  it "generate label" do
    expected = "<label>Email</label>"
    result = HexletCode::Tag.build("label") { "Email" }
    assert_equal expected, result
  end
  it "generate label with attributes" do
    expected = '<label for="email">Email</label>'
    result = HexletCode::Tag.build("label", for: "email") { "Email" }
    assert_equal expected, result
  end
  it "generate div" do
    expected = "<div></div>"
    result = HexletCode::Tag.build("div")
    assert_equal expected, result
  end
end
