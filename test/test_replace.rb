require 'minitest/autorun'
require 'edit'


class ReplaceTest < Minitest::Test  
  describe "when replacing strings" do
    it "should replace only one instance at a time" do
      test_string = "That is an example string that is used for the string manipulation"  
      new_text = edit(test_string) do
        replace "is", "might be"
      end
      new_text.must_equal "That might be an example string that is used for the string manipulation"
    end

    it "should replace all instances at once" do
      test_string = "That is an example string that is used for the string manipulation"  
      new_text = edit(test_string) do
        replace_all "is", "might be"
      end
      new_text.must_equal "That might be an example string that might be used for the string manipulation"
    end

    it "should not modify anything if the string didnt contain the required term" do
      test_string = "That is an example string that is used for the string manipulation"  
      new_text = edit(test_string) do
        replace_all "legend", "car"
      end
      new_text.must_equal "That is an example string that is used for the string manipulation"
    end
  end
end