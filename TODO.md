# blue-eyes TODO List

## Active Development

### blue-eyes gem
* [x] Change ownership to Stan Carver II
* [ ] Consolidate LICENSE (also appears in README)
* [ ] Move contribution guidelines to CONTRIBUTING
* [x] Replace RSpec test suite with MiniTest
* [x] Implement Guard test suite runner
* [x] Implement Rubocop linter and conform gem
* [x] Implement SimpleCov test coverage analysis
* [ ] Implement GitHub Actions workflow
* [ ] Make gem fully-compatible with Ruby 3.x
* [ ] Fix gem naming convention e.g. `blue_eyes` instead of `blue-eyes`
* [ ] Publish BlueEyes to RubyGems
* [ ] Create GitHub product page (scarver2.github.io/blue-eyes)
* [ ] Create GitHub Wiki
* [ ] Add Frankie's template for monolith
* [ ] Add Frankie's template for microsite
* [ ] Add Frankie's template for microservices
* [ ] Remove Rails dependency?
* [ ] Implement tux gem if still relevant

### BlueEyes generated app
* [ ] Account for various versions of ActiveRecord
* [ ] Add .gitattributes file
* [ ] Add .gitignore file
* [ ] Add .ruby-version file
* [x] Add `blue-eyes` to `GEMFILE` for testing
* [ ] Add guard gem
* [ ] Add guard-rubocop 
* [ ] Add rubocop
* [ ] Add rubocop gem
* [ ] Add simplecov
* [ ] Add simplecov gem
* [ ] Document each gem’s purpose
* [ ] Replace shotgun with Rackup
* [ ] Replace Thin gem with Puma
* [ ] Run generated app's test suite
* [ ] Update app template for Ruby 3

## Under Consideration

Consider removing `blue-eyes`'s built-in `String` monkey-patch extensions module. Two replacement robust Ruby Gem options are:
* [StringEx](https://github.com/rsl/stringex)
* Rails' [ActiveSupport](https://api.rubyonrails.org/classes/String.html)

