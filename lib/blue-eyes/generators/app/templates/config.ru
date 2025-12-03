# frozen_string_literal: true

require './config/environment'

# TODO: detect which version of ActiveRecord
# if ActiveRecord::Base.connection.migration_context.needs_migration?
# raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

ActiveRecord::Migration.check_all_pending!

run ApplicationController
