lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'blue-eyes/version'

Gem::Specification.new do |spec|
  spec.name        = "blue-eyes"
  spec.version     = BlueEyes::VERSION::STRING
  spec.summary     = "A Sinatra app generator."
  spec.description = "blue-eyes is a Sinatra app generator with Rails-like simplicity."
  spec.email       = "bennyfactor@iaatb.net"
  spec.homepage    = "http://github.com/scarver2/blue-eyes/"
  spec.authors     = ["Brian Emory, Ben Lamb, Stan Carver II"]
  spec.licenses    = "MIT"

  spec.executables = ['blue-eyes']

  spec.require_paths = [%q{lib}]

  spec.files = Dir.glob("lib/**/*") +
    [
      "lib/blue-eyes/generators/app/templates/app/models/.gitkeep",
      "lib/blue-eyes/generators/app/templates/public/images/.gitkeep",
      "lib/blue-eyes/generators/app/templates/public/javascripts/.gitkeep"
    ] +
    Dir.glob("spec/**/*") +
    %w(Gemfile Gemfile.lock LICENSE README.md Rakefile)

  spec.add_runtime_dependency('thor', '~> 1.2')
  spec.add_runtime_dependency('activesupport', '~> 7.1')
  spec.add_development_dependency('bundler', '~> 2.5', '>= 2.5.3')
  spec.add_development_dependency('minitest', '~> 5.2')
end
