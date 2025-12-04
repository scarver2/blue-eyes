# frozen_string_literal: true

require_relative 'spec_helper'

describe ApplicationController do
  before do
    get '/'
  end

  it 'responds with HTTP status 200 OK' do
    expect(last_response.status).to eq(200)
  end

  it 'responds with a welcome message' do
    expect(last_response.body).to include('Welcome to the Sinatra Template!')
  end
end
