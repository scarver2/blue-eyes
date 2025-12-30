# BlueEyes' TODO List

## Active Development

### BlueEyes gem
* [x] Change ownership to Stan Carver II
* [x] Consolidate LICENSE (also appears in README)
* [x] Move contribution guidelines to CONTRIBUTING
* [x] Replace RSpec test suite with MiniTest
* [x] Implement Guard test suite runner
* [x] Implement Rubocop linter and conform gem
* [x] Implement SimpleCov test coverage analysis
* [ ] Implement GitHub Actions workflow
* [x] Make gem fully-compatible with Ruby 3.x
* [x] Make gem compatible with Ruby 4.x
* [x] Fix folder naming convention (`lib/blue_eyes` instead of `lib/blue-eyes`)
* [x] Publish BlueEyes to RubyGems
* [ ] Create GitHub product page (scarver2.github.io/blue-eyes)
* [ ] Create GitHub Wiki
* [ ] Add Frankie's template for monolith
* [ ] Add Frankie's template for microsite
* [ ] Add Frankie's template for microservices
* [x] Fixup BlueEyes' logo

### BlueEyes generated app
* [ ] Add .gitattributes file
* [ ] Add .gitignore file
* [x] Add .ruby-version file
* [ ] Add .simplecov file
* [x] Add `blue-eyes` to `GEMFILE` for testing
* [ ] Add factory_bot gem and guard-factory_bot gem
* [x] Add guard gem
* [ ] Add guard-livereload gem
* [ ] Add guard-rack gem
* [ ] Add rubocop gem and guard-rubocop gem
* [ ] Add simplecov gem
* [ ] Document each gem’s purpose
* [x] Replace shotgun with Rackup
* [x] Replace Thin gem with Puma
* [x] Run generated app's test suite
* [x] Make app compatible with Ruby 3
* [x] Make app compatible with Ruby 4
* [ ] Modernize HTML templates, perhaps using [HTML5 Boilerplate](https://html5boilerplate.com) or [Tailwind](https://tailwindcss.com)
* [x] Add Procfile
* [x] Add Guardfile
* [ ] Add Rakefile
* [x] Add bin/dev script
* [ ] Generate README with AppName and instructions

## Under Consideration

* Consider removing BlueEyes's built-in `String` monkey-patch extensions module. Two robust Ruby Gem replacements are [StringEx](https://github.com/rsl/stringex) or [ActiveSupport](https://api.rubyonrails.org/classes/String.html).
* Account for syntax differences in versions of ActiveRecord
* Remove Rails' active_model_serializers dependency?
* Implement RIPL like [tux](https://github.com/cldwalker/tux) gem, if still relevant
