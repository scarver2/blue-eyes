# frozen_string_literal: true

require 'thor/group'

module BlueEyes
  module Generators
    # Generates a Sinatra application
    class AppGenerator < Thor::Group
      include Thor::Actions

      desc 'Creates a new Sinatra application'
      argument :name, type: :string, desc: 'The name of the new application'
      class_option :capistrano, type: :boolean, desc: 'Include Capistrano configuration'
      class_option :database, aliases: '-d', default: '', desc: 'The type of database to use'
      class_option :redis, type: :boolean, desc: 'Include Redis configuration'
      class_option :rvm, type: :boolean, desc: 'Create .ruby-version (ruby-2.1.0) and .ruby-gemset'
      class_option :bundle, type: :boolean, desc: 'Run bundle after generating the app'
      class_option :git, type: :boolean, desc: 'Initialize a Git repository'

      # Creates instance variables from options passed to BlueEyes.
      def setup
        @app_path = name.directory_name
        @name     = name.file_name

        options.each do |key, value|
          instance_variable_set :"@#{key}", value
        end
      end

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      # Create empty directories
      def create_empty_directories
        %w[bin config/initializers db/migrate lib spec].each do |dir|
          empty_directory File.join(@app_path, dir)
        end

        create_file File.join(@app_path, 'lib', '.gitkeep')
        template 'config/environment.rb', File.join(@app_path, 'config/environment.rb')
      end

      def create_bin_dev
        file_path = File.join(@app_path, 'bin/dev')
        copy_file 'bin/dev', file_path
        system "chmod a+x #{file_path}"
      end

      def create_public_directory
        %w[public/images public/javascripts public/stylesheets].each do |dir|
          directory dir, File.join(@app_path, dir)
        end

        template 'public/favicon.ico', File.join(@app_path, 'public/favicon.ico')
      end

      def create_app_directory
        %w[app/controllers app/views app/models].each do |dir|
          directory dir, File.join(@app_path, dir)
        end
      end

      def create_spec_directory
        template 'spec/application_controller_spec.rb', File.join(@app_path, 'spec/application_controller_spec.rb')
        template 'spec/spec_helper.rb', File.join(@app_path, 'spec/spec_helper.rb')
      end

      def create_ruby_version
        template '.ruby-version.erb', File.join(@app_path, '.ruby-version')
      end

      def create_rubocop_config
        copy_file '.rubocop_todo.yml.erb', File.join(@app_path, '.rubocop_todo.yml')
        template '.rubocop.yml.erb', File.join(@app_path, '.rubocop.yml')
      end

      def create_simplecov
        template '.simplecov.erb', File.join(@app_path, '.simplecov')
      end

      def create_rackup_config
        template 'config.ru.erb', File.join(@app_path, 'config.ru')
      end

      def create_gemfile
        template 'Gemfile.erb', File.join(@app_path, 'Gemfile')
      end

      def create_guardfile
        copy_file 'Guardfile.erb', File.join(@app_path, 'Guardfile')
      end

      def create_procfile
        copy_file 'Procfile.erb', File.join(@app_path, 'Procfile')
        copy_file 'Procfile.dev.erb', File.join(@app_path, 'Procfile.dev')
      end

      def create_rakefile
        template 'Rakefile.erb', File.join(@app_path, 'Rakefile')
      end

      def create_readme
        copy_file 'README.md', File.join(@app_path, 'README.md')
      end

      def create_db_config
        # TODO: return if @database.empty?

        template('config/db.yml', File.join(@app_path, 'config/db.yml'))
      end

      def create_database_initializer
        # TODO: return if @database.empty?

        template('config/initializers/database.rb.erb',
                 File.join(@app_path, 'config/initializers/database.rb'))
      end

      def create_redis_config
        return unless @redis

        copy_file('config/redis.yml', File.join(@app_path, 'config/redis.yml'))
      end

      def create_redis_initializer
        return unless @redis

        template('config/initializers/redis.rb', File.join(@app_path, 'config/initializers/redis.rb'))
      end

      def create_capistrano_config
        return unless @capistrano

        inside(@app_path) do
          run('cap install')
        end
      end

      def create_rvm_gemset
        # TODO: deprecate RVM
        return unless @rvm

        create_file(File.join(@app_path, '.ruby-gemset'), @app_path)

        @bundle = false
        puts "You need to run 'bundle install' manually."
      end

      def initialize_git_repo
        inside(@app_path) do
          run('git init .') if @git
        end
      end

      def install_dependencies
        inside(@app_path) do
          run('bundle') if @bundle
        end
      end
    end
  end
end
