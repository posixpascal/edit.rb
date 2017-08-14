require 'minitest/autorun'
require 'edit'


class RangesTest < Minitest::Test  
  describe "when using ranges" do
    it "should overwrite text within a range" do
      test_string = "0123456789"
      new_text = edit(test_string) do
        range :from => 0, :to => 5 do
          write "43210"
        end
      end
      new_text.must_equal "4321056789"
    end

    it "should add overwrite text at the beginning" do
      test_string = "123456789"
      new_text = edit(test_string) do
        range :from => 0, :to => 5 do
          prepend "0"
        end
      end
      new_text.must_equal "023456789"
    end

    it "should be possible to leave overwrite mode" do
      test_string = "123456789"
      new_text = edit(test_string) do
        range :from => 0, :to => 5, :overwrite => false do
          prepend "0"
        end
      end
      new_text.must_equal "0123456789"
    end
  end
end