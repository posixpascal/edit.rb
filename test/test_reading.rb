require 'minitest/autorun'
require 'edit'


class ReadingTest < Minitest::Test  
  describe "when reading strings" do
    it "should get the correct size of bytes" do
      test_string = "Hello World"
      new_text = edit(test_string) do
        text = read(5)
        text.must_equal "Hello"
      end
    end
end
end