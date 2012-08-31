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

        specify { str.should == "12453" }
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

  describe "rewrite action" do
    context "on the same level" do
      before { str << "1" }
      action { str << "3" }
      action { str << "4" }
      before { str << "2" }

      specify { str.should == "124" }
    end

    context "on the deeper level" do
      before { str << "1" }
      action { str << "3" }
      before { str << "2" }

      specify { str.should == "123" }

      context "second level" do
        action { str << "4" }
        specify { str.should == "124" }
      end
    end
  end
end
