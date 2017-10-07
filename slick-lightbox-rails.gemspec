# -*- encoding: utf-8 -*-
require File.expand_path('../lib/slick/lightbox/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "slick-lightbox-rails"
  s.version     = Slick::Lightbox::Rails::VERSION
  s.authors     = ["Scott Johnson"]
  s.email       = ["jaywir3@gmail.com"]
  s.homepage    = "https://github.com/jwir3/slick-lightbox-rails"
  s.summary     = "A lightbox wrapper for Ken's amazing slick carosel."
  s.description = "slick-lightbox, a lightbox wrapper for Ken's amazing slick carosel, packaged as a gem for simple use within Rails applications"
  s.license     = "MIT"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "railties", ">= 3.2.16"

  s.add_development_dependency "json", "~> 2.0"

  s.files         = `git ls-files`.split("\n").reject { |f| f =~ /^slick-lightbox/ }
  #s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
end

