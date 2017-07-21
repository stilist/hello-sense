require_relative 'lib/hello_sense/version'

Gem::Specification.new do |s|
  s.date = Time.now.strftime('%Y-%m-%d')
  s.description = "Ruby implementation of Sense's private API"
  s.name = 'hello-sense'
  s.required_ruby_version = ['>= 2.3.0', '< 2.5.0']
  s.summary = 'TK'
  s.version = Sense::VERSION

  s.authors = ['Jordan Cole']
  s.email = ['stilist@ratafia.info']
  s.homepage = 'https://github.com/stilist/hello-sense'

  s.files = Dir[__FILE__, 'LICENSE', '*.md', 'lib/**/*']
  s.metadata['yard.run'] = 'yri'

  s.add_development_dependency('byebug', '~> 9.0', '>= 9.0.0')
  s.add_development_dependency('rake', '~> 11.0', '>= 11.0.0')
  s.add_development_dependency('rspec-core', '~> 3.6', '>= 3.6.0')
  s.add_development_dependency('rspec-expectations', '~> 3.6', '>= 3.6.0')
  s.add_development_dependency('rubocop', '~> 0.48', '>= 0.48.0')
  s.add_development_dependency('yard', '~> 0.9', '>= 0.9.0')
end
