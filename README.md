![BlueEyes](lib/blue_eyes/generators/app/templates/public/images/blue-eyes-small.png)

## Why this exists

Original creator Ben Lamb was looking for a way to build a Sinatra skeleton similar to running how Rails creates applications using `rails new APP-NAME`. [Corneal](http://thebrianemory.github.io/corneal/) was the closest thing he could find and this gem is based largely off of it. Corneal basically does everything equivalent for Sinatra that running `rails new` would do, except, it doesn't seem to be maintained anymore, and thus no longer compatible with modern Ruby. Thus, Ben has forked and renamed it *blue-eyes*.

[Stan Carver II]() now maintains the *BlueEyes* gem as part of his ongoing work on [Frankie](https://github.com/scarver2/frankie), the essential Sinatra boilerplate.

## How to start

Install the gem, run `blue-eyes new APP-NAME`, run `bundle install`, and you're all set! You can start up your server with `shotgun` and verify everything is working. It is as simple as that.

It uses a file structure similar to what you would see with Rails.

Directory structure:

```
├── config.ru
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── README
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
│   └── .gitkeep
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── main.css
└── spec
    ├── application_controller_spec.rb
    └── spec_helper.rb
```

## Installation

BlueEyes should be installed in the global gem space rather than in a Gemfile.

```bash
    gem install blue-eyes
```

## Commands

```bash
blue-eyes -v              # Show blue-eyes version number
blue-eyes help [COMMAND]  # Describe available commands or one specific command
blue-eyes new APP-NAME    # Creates a new Sinatra application
blue-eyes model NAME      # Generate a model
blue-eyes controller NAME # Generate a controller
blue-eyes scaffold NAME   # Generate a model with its associated views and controllers
```
The controller generator also have an optional views flag `--no-views` to create controllers without views.

## Using BlueEyes

To generate your app:

```bash
blue-eyes new APP-NAME
```

Once BlueEyes is done generating your app, run `bundle install` from your app's directory:

```bash
cd APP-NAME
bundle install
```

You can then start your server with `rackup` and visit http://localhost:9292 to verify your app is running.

```bash
bundle exec rackup
```

You can generate a model and migration file:

 ```bash
blue-eyes model NAME
```

You can also generate an entire MVC structure complete with a migration file:

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

After creating a model or scaffold, you will need to run `bundle exec rake db:migrate` to update the database table.

You can then start your server with `rackup`:

```bash
bundle exec rackup
```

You can also verify it is working by running `bundle exec rspec` to ensure your app is still operational:

```bash
Run options: include {focus: true}

All examples were filtered out; ignoring {focus: true}
....

Finished in 0.04369 seconds (files took 2.31 seconds to load)
4 examples, 0 failures, 0 pending
```

You can run `bundle exec rubocop -A` to automatically fix any linting issues. It can uncover bugs too!

You can run `bundle exec guard` for continuous testing and linting while developing your application. Or,

Better yet, you can execute `bin/dev` to start your server, run your tests, and lint your code all at once. Any changes to your application will automatically reload your application, run your tests, and/or lint your code. 💙 Developer happiness acheived. 💙

# Important Files

[CONTRIBUTING](https://github.com/scarver2/blue-eyes/blob/main/CONTRIBUTING.md)
[LICENSE](https://github.com/scarver2/blue-eyes/blob/main/LICENSE)
[TODO](https://github.com/scarver2/blue-eyes/blob/main/TODO.md)

&copy;2025 Stan Carver II
