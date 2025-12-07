![BlueEyes](lib/blue_eyes/generators/app/templates/public/images/blue-eyes-small.png)

## Why BlueEyes Exists

Original creator Ben Lamb was looking for a way to build a Sinatra skeleton similar to running how Rails creates applications using `rails new APP-NAME`. 
[Corneal](http://thebrianemory.github.io/corneal/) was the closest thing he could find and this gem is based largely off of it. Corneal does for Sinatra what running `rails new` would do. Over time, Brian's focus would shift to the Elixir language, so Ben Lamb forked and renamed the repository to *blue-eyes*. Ben's contributions kept the gem operatational with Ruby 2.

Fast-forward to 2025, [Stan Carver II](https://scarver2.github.io) maintains the *BlueEyes* gem as a compliment to his ongoing work on [Frankie](https://github.com/scarver2/frankie), the essential Sinatra boilerplate repository. His work on BlueEyes supports Ruby 3 and newer versions of Sinatra, Rails, and other gems. He has also added features to aid rapid development of microsites and APIs.

## How to Start

Install the gem, run `blue_eyes new APP-NAME`, run `bundle install`, and you're all set! You can start up your server with `rackup` and verify everything is working. It is as simple as that!

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
├── config
│   ├── initializers
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
├── config.ru
├── Gemfile
├── Gemfile.lock
├── Rakefile
└── README		
```

## Installation

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

You can then start your server with `rackup`:

```bash
    bundle exec rackup
```

You can generate a model and migration file:

 ```bash
    blue-eyes model NAME
```

You can also generate an entire Rails-style MVC structure complete with a migration file:

```bash
    blue-eyes scaffold NAME
```

The resulting structure will look like this:

```
└─app
  ├── controllers
  │   ├──application_controller.rb
  │   └──new_model_controller.rb
  ├── models
  │   └──new_model.rb
  └── views
      ├──new_models
      │  ├──index.html.rb.erb
      │  ├──show.html.rb.erb
      │  ├──new.html.rb.erb
      │  └──edit.html.rb.erb
      ├── layout.erb
      └── welcome.erb
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

Visit http://localhost:9292 to verify your app is running.

You can also verify it is working by running `rspec` to see the passing test:

```bash
    1 example, 0 failures
```

# Important Files

[CONTRIBUTING](https://github.com/scarver2/blue-eyes/CONTRIBUTING.md)
[LICENSE](https://github.com/scarver2/blue-eyes/LICENSE)
[TODO](https://github.com/scarver2/blue-eyes/TODO.md)


&copy;2025 Stan Carver II
