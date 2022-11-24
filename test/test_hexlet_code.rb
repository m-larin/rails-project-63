# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    String.send(:define_method, :delete_spaces) do
      gsub(/(\n|\t|\r)/, " ").squeeze(" ").gsub(/(> <)/, "><").strip
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build
    assert { HexletCode::Tag.build("br") == "<br>" }
    assert { HexletCode::Tag.build("img", src: "path/to/image") == '<img src="path/to/image">' }
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save") == '<input type="submit" value="Save">' }
    assert_raises { HexletCode::Tag.build("unknown") }
  end

  def test_form_build
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form = HexletCode.form_for user do |f|
    end
    assert { form == "<form action=\"#\" method=\"post\"></form>" }

    form = HexletCode.form_for user, url: "/users" do |f|
    end
    assert { form == "<form action=\"/users\" method=\"post\"></form>" }

    form = HexletCode.form_for user, url: "/users" do |f|
    end
    assert { form == "<form action=\"/users\" method=\"post\"></form>" }

    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    form_check = '
    <form action="#" method="post">
      <label for="name">Name</label>
      <input type="text" name="name" value="rob">
      <label for="job">Job</label>
      <textarea cols="20" rows="40" name="job">hexlet</textarea>
    </form>
    '
    assert { form == form_check.delete_spaces }

    form = HexletCode.form_for user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
    end
    form_check = '
    <form action="#" method="post">
      <label for="name">Name</label>
      <input type="text" class="user-input" name="name" value="rob">
      <label for="job">Job</label>
      <input type="text" name="job" value="hexlet">
    </form>
    '
    assert { form == form_check.delete_spaces }

    form = HexletCode.form_for user do |f|
      f.input :job, as: :text
      f.submit
    end
    form_check = '
    <form action="#" method="post">
     <label for="job">Job</label>
     <textarea cols="20" rows="40" name="job">hexlet</textarea>
     <input type="submit" value="Save">
    </form>
    '
    assert { form == form_check.delete_spaces }

    form = HexletCode.form_for user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit "Wow"
    end
    form_check = '
    <form action="#" method="post">
      <label for="job">Job</label>
      <textarea cols="50" rows="50" name="job">hexlet</textarea>
      <input type="submit" value="Wow">
    </form>
    '
    assert { form == form_check.delete_spaces }

    assert_raises NoMethodError do
      HexletCode.form_for user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end
end
