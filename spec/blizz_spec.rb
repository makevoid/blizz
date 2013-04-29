require_relative "../lib/blizz"
require_relative "classes"

describe "Blizz" do
  it "loads simple hash" do
    hash = { a: "aaa", b: "bbb" }
    example = Blizz.load Example, hash
    example.a.should == "aaa"
    example.b.should == "bbb"
    example.should be_a Example
  end

  it "loads a more complex hash" do
    hash = {
      name: "aaa",
      contents: [
        {
          type: "Part", name: "111"
        },
        {
          type: "Part", name: "222"
        },
      ]
    }
    whole = Blizz.load Whole, hash
    whole.should be_a Whole
    whole.name.should == "aaa"
    whole.contents.should be_a Array
    part = whole.contents.first
    part.should be_a Part
    part.name.should == "111"
  end
end