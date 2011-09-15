require "spec_helper"

describe RSpec::Core::Hooks do
  def str; @str ||= ""; @str end

  describe "simple example" do
    before { str << "1" }
    action { str << "3" }
    before { str << "2" }

    specify { str.should == "123" }
  end

  describe "example with two expecations" do
    before { str << "1" }
    action { str << "3" }
    before { str << "2" }

    specify { str.should == "123" }
    specify { str.should == "123" }
  end

  describe "two-level example" do
    action { str << "3" }
    context "level one" do
      before { str << "1" }
      before { str << "2" }

      specify { str.should == "123" }

      context "level two" do
        before { str << "4" }
        before { str << "5" }

        specify { str.should == "123453" }
      end
    end
  end

  describe "two examples" do
    action { str << "3" }
    context "first example" do
      before { str << "1" }
      before { str << "2" }
      specify { str.should == "123" }
    end
    context "second example" do
      before { str << "5" }
      before { str << "4" }
      specify { str.should == "543" }
    end
  end
end
