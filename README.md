![BlueEyes](lib/blue_eyes/generators/app/templates/public/images/blue-eyes-small.png)

## Why BlueEyes Exists

BlueEye's original creator, Ben Lamb, was searching for a way to build a Sinatra skeleton similar to running how Rails creates applications using `rails new APP-NAME`.
[Corneal](http://thebrianemory.github.io/corneal) was the closest thing he could find and this gem is based largely off of it.
Corneal does for Sinatra what running Rails' generators would do for a Ruby on Rails application. 
Over time, Brian's focus would shift to the Elixir language and Corneal development would languish.
Ben Lamb got the inspiration to continue development and forked Corneal with a new name *blue-eyes* as a shout-out to Sinatra.
Ben's contributions kept the gem operational with Ruby 2.

Fast-forward to 2025, [Stan Carver II](https://scarver2.github.io) maintains the *BlueEyes* gem to compliment to his ongoing work on [Frankie](https://github.com/scarver2/frankie), the essential Sinatra boilerplate repository. 
His open-source contributions allows BlueEyes to fully support Ruby 3 and newer versions of Sinatra, Rails, and other gems.
BlueEyes now generates full test suites tools to aid with rapid development of microsites and APIs.

## How to Begin

`gem install blue-eyes` gem, run `blue-eyes new APP-NAME`, `cd` into your app's folder, then run `bundle install`. 
You're all set to start developing your Sinatra application.
You can start up your server with `rackup` and verify everything is working. It is as simple as that!

### App Directory Structure

BlueEyes creates a file structure similar to Ruby on Rails.

```
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   └── views
│       ├── layout.erb
│       └── welcome.erb
├── bin
│   └── dev
├── config
│   ├── initializers
│   │   ├── database.rb
│   │   └── redis.rb
│   └── environment.rb
├── db
│   └── migrate
├── lib
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── main.css
├─── spec
│   ├── application_controller_spec.rb
│   └── spec_helper.rb
├── .rubocop_todo.yml
├── .rubocop.yml
├── .simplecov
├── config.ru
├── Gemfile
├── Gemfile.lock
├── Guardfile
├── Procfile
├── Procfile.dev
├── Rakefile
└── README		
```

## Installation

BlueEyes should be installed in the global gem space rather than in a Gemfile.

```bash
gem install blue-eyes
```

## Commands

```bash
blue-eyes -v              # Show BlueEyes version number
blue-eyes help [COMMAND]  # Describe available commands or one specific command
blue-eyes new APP-NAME    # Creates a new Sinatra application
blue-eyes model NAME      # Generate a model
blue-eyes controller NAME # Generate a controller
blue-eyes scaffold NAME   # Generate a model with its associated views and controllers
```

### Flags

The controller generator also have an optional views flag `--no-views` to create controllers without views.

## Using BlueEyes

To generate your app:

```bash
blue-eyes new APP-NAME
```

Once BlueEyes has generated your app, run `bundle install` from your app's directory:

```bash
cd APP-NAME
bundle install
```

You can then start your server with the bundled `rackup` gem and visit http://localhost:9292 to verify your running web application.

```bash
bundle exec rackup
```

In similar Rails' fashion, you can generate a model and migration file:

```bash
blue-eyes model NAME
```

You can also generate an entire Rails-style MVC structure complete with a migration file:

```bash
blue-eyes scaffold NAME
```

The resulting structure will look like this:

```
└─ app
│  ├── controllers
│  │   ├── application_controller.rb
│  ├── models
│  │   └── model_name.rb
│  └── views
│      └── model_names
│          ├──index.html.erb
│          ├──show.html.erb
│          ├──new.html.erb
│          └──edit.html.erb
└── db/migrate
    └── timestamp_create_models.rb
```

You can also add your model attributes when you generate the scaffold structure and have them added to your migration file:

```bash
blue-eyes [model/scaffold] NAME name:string age:integer
```

```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.age :integer

      t.timestamps null: false
    end
  end
end
```

After creating a model or scaffold, you will need to run `bundle exec rake db:migrate` to update the database table.

You can run the test suite with `bundle exec rspec` to ensure your app is still operational:

```bash
Run options: include {focus: true}

All examples were filtered out; ignoring {focus: true}
....

Finished in 0.04369 seconds (files took 2.31 seconds to load)
4 examples, 0 failures, 0 pending
```

You can run `bundle exec rubocop -A` to automatically fix any linting issues. It can uncover bugs too!

You can run `bundle exec guard` for continuous testing and linting while developing your application.

**Better yet**, you can execute `bin/dev` to start your server, run your tests, and lint your code all at once.
Any changes to your application will automatically reload your application, run your tests, and/or lint your code.
💙 Developer happiness acheived. 💙

# Important Files

[CONTRIBUTING](https://github.com/scarver2/blue-eyes/blob/main/CONTRIBUTING.md)
[LICENSE](https://github.com/scarver2/blue-eyes/blob/main/LICENSE)
[TODO](https://github.com/scarver2/blue-eyes/blob/main/TODO.md)

&copy;2025 Stan Carver II
