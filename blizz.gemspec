# encoding: utf-8
gem_name = "blizz"

require File.expand_path("../lib/#{gem_name}", __FILE__)

Gem::Specification.new do |s|
  s.name         = gem_name
  s.author       = "Francesco 'makevoid' Canessa"
  s.email        = "makevoid@gmail.com"
  s.summary      = "Easily load hashes into objects"
  s.homepage     = "http://github.com/makevoid/#{gem_name}"
  s.version      = Blizz::VERSION

  s.description  = <<-DESC
    Blizz let's you easily load hashes into objects
  DESC

  s.files        = %w(Readme.md)
  s.files       += Dir["{lib}/**/*"]
end
