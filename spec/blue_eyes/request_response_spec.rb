# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'BlueEyes request/response objects' do
  let(:request_path) do
    File.expand_path(
      '../../../lib/blue_eyes/request.rb',
      __dir__
    )
  end

  let(:response_path) do
    File.expand_path(
      '../../../lib/blue_eyes/response.rb',
      __dir__
    )
  end

  before do
    require request_path
    require response_path
  end

  describe BlueEyes::Request do
    let(:env) do
      {
        'REQUEST_METHOD' => 'GET',
        'PATH_INFO' => '/hello',
        'QUERY_STRING' => 'name=Stan',
        'rack.input' => StringIO.new('')
      }
    end

    let(:request) { described_class.new(env) }

    it 'exposes the HTTP method' do
      expect(request.method).to eq('GET')
    end

    it 'exposes the path' do
      expect(request.path).to eq('/hello')
    end

    it 'parses query params' do
      expect(request.params['name']).to eq('Stan')
    end

    it 'exposes headers' do
      env['HTTP_X_TEST'] = '123'
      expect(request.headers['X_TEST']).to eq('123')
    end

    it 'provides deterministic values' do
      a = request.path
      b = request.path
      expect(a).to eq(b)
    end
  end

  describe BlueEyes::Response do
    let(:response) { described_class.new }

    it 'defaults to status 200' do
      expect(response.status).to eq(200)
    end

    it 'allows setting headers' do
      response.headers['Content-Type'] = 'text/plain'
      expect(response.headers['Content-Type']).to eq('text/plain')
    end

    it 'allows writing to the body' do
      response.write('Hello')
      response.write(' Stan')
      expect(response.body.join).to eq('Hello Stan')
    end

    it 'builds a valid Rack response triple' do
      response.status = 201
      response.headers['Content-Type'] = 'text/plain'
      response.write('OK')

      status, headers, body = response.finish

      expect(status).to eq(201)
      expect(headers['Content-Type']).to eq('text/plain')
      expect(body.join).to eq('OK')
    end

    it 'produces deterministic output' do
      response.write('A')
      a = response.finish
      response = described_class.new
      response.write('A')
      b = response.finish
      expect(a).to eq(b)
    end
  end
end
