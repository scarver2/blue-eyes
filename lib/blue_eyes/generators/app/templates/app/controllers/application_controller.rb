# frozen_string_literal: true

require './config/environment'

# Entrypoint for Rack
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end
end
