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
└── public
|   ├── images
|   ├── javascripts
|   └── stylesheets
|       └── main.css
└── spec
    ├── application_controller_spec.rb
    └── spec_helper.rb
```

## Installation

    gem install blue-eyes

## Commands
```
blue-eyes -v              # Show blue-eyes version number
blue-eyes help [COMMAND]  # Describe available commands or one specific command
blue-eyes new APP-NAME    # Creates a new Sinatra application
blue-eyes model NAME      # Generate a model
blue-eyes controller NAME # Generate a controller
blue-eyes scaffold NAME   # Generate a model with its associated views and controllers
```
The controller generator also have an optional views flag `--no-views` to create controllers without views.

## Using blue-eyes

To generate your app:

    blue-eyes new APP-NAME

After blue-eyes is done generating your app, run `bundle install` from your app's directory:

    cd APP-NAME
    bundle install

You can then start your server with `rackup`:

    bundle exec rackup

You can generate a model and migration file:

    blue-eyes model NAME

You can also generate an entire MVC structure complete with a migration file:

    blue-eyes scaffold NAME

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

    blue-eyes [model/scaffold] NAME name:string age:integer

```
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

Visit [http://localhost:9292/](http://localhost:9292/) to verify your app is running.

You can also verify it is working by running `rspec` to see the passing test:

    1 example, 0 failures

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scarver2/blue-eyes. Feel free to contribute, but please consider that any contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. In summary, be excellent to each other, and party on dudes.

## License

    Copyright (c) 2016 Brian Emory (originally the Corneal Ruby Gem)
    Copyright (c) 2024 Ben Lamb
    Copyright (c) 2025 Stan Carver II

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
