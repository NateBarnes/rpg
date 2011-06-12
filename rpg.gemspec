require File.expand_path('../lib/rpg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'rpg'
  gem.summary = %q{Framework for handling pen and paper RPGs}
  gem.description = gem.summary

  gem.homepage = 'https://github.com/NateBarnes/rpg'

  gem.authors = ["Nathaniel Barnes"]
  gem.email   = ['nathaniel.r.barnes@gmail.com']

  gem.version  = RPG::VERSION

  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rspec', '~> 2.6'
end
