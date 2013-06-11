# Blizz
[ruby]

Blizz let's you easily load hashes into objects, adding accessors, without modifying too much your base class

```ruby
class Example
  include Blizz::Resource
end

hash = { a: "b", c: "d" }

example = Blizz.load Example, hash
p example.a # => "b"
p example.c # => "d"
p example.class # => Example
```

Simple isn't it?

Useful for prototyping domain models, DDD, etc :)


TODO: release it as a gem asap :)
