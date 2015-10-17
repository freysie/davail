require_relative 'lib/davail/version'

Gem::Specification.new do |s|
  s.name    = 'davail'
  s.version = Davail::VERSION_STRING

  s.authors  = ['Freya Ariel']
  s.email    = ['hifreyaariel@icloud.com']
  s.homepage = 'https://github.com/freyaariel/davail'

  s.summary     = "Determine domain name availability."
  s.description = "A command line utility for easily determining domain name availability."

  s.license = "MIT"

  s.required_ruby_version = Gem::Requirement.new '>= 2'
  s.required_rubygems_version = Gem::Requirement.new '>= 1.2'

  s.files = %w[
    bin/davail
    lib/davail.rb
    lib/davail/version.rb
    README.md
    LICENSE.md
  ]

  s.executables = %w[davail]
  s.require_paths = %w[lib]

  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency 'rspec', ['~> 3.0']

  # Utility classes and Ruby extensions
  s.add_runtime_dependency 'activesupport', ['~> 4.2']

  # Colorizing printed text on ANSI terminals
  s.add_runtime_dependency 'rainbow', ['~> 2.0']

  # Simple domain name internationalization
  s.add_runtime_dependency 'simpleidn', ['= 0.0.5']

  # Pure Ruby WHOIS client
  s.add_runtime_dependency 'whois', ['~> 3.4']
end
