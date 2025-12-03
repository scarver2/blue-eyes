# frozen_string_literal: true

require 'thor'

module BlueEyes
  # BlueEyes CLI
  class CLI < Thor
    desc '-v', 'Show BlueEyes version number'
    map %w[-v --version] => :version
    # USAGE: blue-eyes -v
    def version
      say "BlueEyes #{BlueEyes::VERSION::STRING}"
    end

    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register BlueEyes::Generators::AppGenerator, 'new', 'new APP_PATH', 'Creates a new Sinatra application'
    register BlueEyes::Generators::ModelGenerator, 'model', 'model NAME', 'Generate a model'
    register BlueEyes::Generators::ControllerGenerator, 'controller', 'controller NAME', 'Generate a controller'
    register BlueEyes::Generators::ScaffoldGenerator, 'scaffold', 'scaffold NAME',
             'Generate a model with its associated views and controllers'

    def self.exit_on_failure
      true
    end
  end
end
