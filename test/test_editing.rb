require 'minitest/autorun'
require 'edit'


class EditingTest < Minitest::Test  
  describe "when editing strings" do
    it "should append strings to the end" do
      test_string = ""
      new_text = edit(test_string) do
        append "Hello"
      end
      new_text.must_equal "Hello"
    end

    it "should add new lines to the end" do
      test_string = "Hello"
      new_text = edit(test_string) do
        append_line "World"
      end
      new_text.must_equal "Hello\nWorld"
    end

    it "should add new lines to the start" do
      test_string = "World"
      new_text = edit(test_string) do
        prepend_line "Hello"
      end
      new_text.must_equal "Hello\nWorld"
    end

    it "should add chars to the start of a string" do
      test_string = "World"
      new_text = edit(test_string) do
        prepend "Hello"
      end
      new_text.must_equal "HelloWorld"
    end

    it "should add arbitrary characters at any place" do
      test_string = "World"
      new_text = edit(test_string) do
        write "T", :at => 0
        write "h", :at => 1
        write "e", :at => 2
        write " ", :at => 3
      end
      new_text.must_equal "The World"
    end
  end
end