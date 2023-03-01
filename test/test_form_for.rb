# frozen_string_literal: true

require 'test_helper'

describe 'Form generation' do
  model = Struct.new(:name, :job, keyword_init: true)
  it 'generate form' do
    user = model.new name: 'rob'
    expected = "<form action=\"#\" method=\"post\"></form>"
    result = HexletCode.form_for user do |f|
    end
    assert_equal expected, result
  end

  it 'generate form with attribute' do
    user = model.new name: 'rob'
    expected = "<form action=\"/users\" method=\"post\"></form>"
    result = HexletCode.form_for user, url: '/users' do |f|
    end
    assert_equal expected, result
  end
end

describe 'Form generation with block' do
  model = Struct.new(:name, :job, :gender, keyword_init: true)
  user = model.new name: 'rob' job: 'hexlet', gender: 'm'
  it "generate form with two inputs" do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"name\">Name</label>
  <input name=\"name\" type=\"text\" value=\"rob\">
  <label for=\"job\">Job</label>
  <textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>
</form>"
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected, result
  end
end

describe 'form with class' do
  model = Struct.new(:name, :job, :gender, keyword_init: true)
  user = model.new name: 'rob', job: 'hexlet', gender: 'm'
  it "generate form with class" do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"name\">Name</label>
  <input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\">
  <label for=\"job\">Job</label>
  <input name=\"job\" type=\"text\" value=\"hexlet\">
</form>"
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal expected, result
  end
end

describe 'Form gen' do
  model = Struct.new(:name, :job, :gender, keyword_init: true)
  user = model.new name: 'rob', job: 'hexlet', gender: 'm'
  it "generate form with textarea" do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"job\">Job</label>
  <textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>
</form>"
    result = HexletCode.form_for user do |f|
      f.input :job, as: :text
    end
    assert_equal expected, result
  end

  it 'generate form with class' do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"job\">Job</label>
  <textarea name=\"job\" cols=\"50\" rows=\"50\">hexlet</textarea>
</form>"
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal expected, result
  end
end

describe 'Form generation with submit' do
  model = Struct.new(:name, :job, :gender, keyword_init: true)
  user = model.new job: 'hexlet'

  it 'generate form with two inputs and submit' do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"name\">Name</label>
  <input name=\"name\" type=\"text\" value=\"\">
  <label for=\"job\">Job</label>
  <input name=\"job\" type=\"text\" value=\"hexlet\">
  <input type=\"submit\" value=\"Save\">
</form>"
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, result
  end
end

describe 'Form with submit' do
  model = Struct.new(:name, :job, :gender, keyword_init: true)
  user = model.new job: 'hexlet'
  it "generate form with two inputs and submit with text" do
    expected = "<form action=\"#\" method=\"post\">
  <label for=\"name\">Name</label>
  <input name=\"name\" type=\"text\" value=\"\">
  <label for=\"job\">Job</label>
  <input name=\"job\" type=\"text\" value=\"hexlet\">
  <input type=\"submit\" value=\"Wow\">
</form>"
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal expected, result
  end
end
