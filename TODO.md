# blue-eyes TODO List

## Active Development

* [x] Change ownership to Stan Carver II
* [ ] Consolidate LICENSE (appears in README)
* [ ] Move contribution guidelines to CONTRIBUTING
* [ ] Replace RSpec test suite with MiniTest
* [ ] Implement Guard test suite runner
* [ ] Implement Rubocop linter and conform gem
* [ ] Implement SimpleCov test coverage analysis
* [ ] Implement GitHub Actions workflow
* [ ] Make fully-compatible with Ruby 3.x

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

