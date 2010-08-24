# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY

  s.name        = "liquid"
  s.version     = '2.2.3'
  s.summary     = "A secure, non-evaling end user template engine with aesthetic markup."

  s.authors     = ["Tobias Luetke"]
  s.email       = ["tobi@leetsoft.com"]
  s.homepage    = "http://www.liquidmarkup.org"

  s.description = "A secure, non-evaling end user template engine with aesthetic markup."

  s.required_rubygems_version = ">= 1.3.7"

  s.files             = Dir.glob("{lib}/**/*") + %w(MIT-LICENSE README.md History.txt)

  s.extra_rdoc_files  = %w(MIT-LICENSE README.md History.txt)

  s.require_path = 'lib'
end
