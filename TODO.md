# blue-eyes TODO List

## Active Development

* [x] Change ownership to Stan Carver II
* [ ] Consolidate LICENSE (appears in README)
* [ ] Move contribution guidelines to CONTRIBUTING
* [x] Replace RSpec test suite with MiniTest
* [x] Implement Guard test suite runner
* [x] Implement Rubocop linter and conform gem
* [x] Implement SimpleCov test coverage analysis
* [ ] Implement GitHub Actions workflow
* [ ] Make gem fully-compatible with Ruby 3.x
* [ ] Fix gem naming convention e.g. `blue_eyes` instead of `blue-eyes`
* [ ] Update app template for Ruby 3
* [ ] Publish BlueEyes to RubyGems
* [ ] Add `blue-eyes` to `GEMFILE` of generated app
* [ ] Run generated app's test suite
* [ ] Add .ruby-version file to generated app with version of Ruby used to generate app
* [ ] Add .gitignore file to generated app with files to ignore
* [ ] Add .gitattributes file to generated app
* [ ] Replace Thin gem with Puma
* [ ] Replace shotgun with Rackup
* [ ] Document each gem’s purpose in App

## Future Development

* [ ] Add templates for monolith. 
* [ ] Add template for microsite.
* [ ] Add template for microservices Sinatra app,
* [ ] Remove Rails dependency
* [ ] Create GitHub product page (scarver2.github.io/blue-eyes)
* [ ] Create GitHub Wiki
* [ ] Account for variations in ActiveRecord

## Under Consideration

Consider removing `blue-eyes`'s built-in `String` monkey-patch extensions module. Two replacement robust Ruby Gem options are:
* [StringEx](https://github.com/rsl/stringex)
* Rails' [ActiveSupport](https://api.rubyonrails.org/classes/String.html)

