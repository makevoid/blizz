# Blizz
[ruby]

Blizz let's you easily load hashes into objects

    class Example
      include Blizz::Resource
    end

    example = Blizz.load Example, hash
    example.a.should == "aaa"
    example.b.should == "bbb"
    example.should be_a Example