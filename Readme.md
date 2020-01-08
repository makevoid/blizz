# Blizz
[ruby]

Blizz let's you easily load hashes into objects, adding accessors, without modifying too much your base class

```ruby
class Example
  include Blizz::Resource
  
  def foo
    "bar"
  end
end

hash = { a: "b", c: "d" }

example = Blizz.load Example, hash
p example.a # => "b"
p example.c # => "d"
p example.foo # => "bar"
p example.class # => Example
```

Simple isn't it?

Useful for prototyping domain models, DDD, etc :)


## more...

### load array of hases

load arrays of hashes, give them a :type and watch how Blizz casts them to classes!

### partial loading

load only some properties of the hash in to the classs selectively

example:

```
example = Blizz.load Example, hash, [:a]
```

will load `a: "b"` but not `c: "d"`





have fun!
@makevoid
