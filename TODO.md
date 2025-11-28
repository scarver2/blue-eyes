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
* [ ] Publish to RubyGems

## Future Development

* [ ] Add templates for monolith. 
* [ ] Add template for microsite.
* [ ] Add template for microservices Sinatra app,
* [ ] Remove Rails dependency
* [ ] Create GitHub product page (scarver2.github.io/blue-eyes)
* [ ] Create GitHub Wiki

## Under Consideration

Consider removing `blue-eyes`'s built-in `String` monkey-patch extensions module. Two replacement robust Ruby Gem options are:
* [StringEx](https://github.com/rsl/stringex)
* Rails' [ActiveSupport](https://api.rubyonrails.org/classes/String.html)

