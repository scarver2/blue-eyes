# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Router do
  let(:router_path) do
    File.expand_path(
      '../../../lib/blue_eyes/router.rb',
      __dir__
    )
  end
  let(:router) { described_class.new }

  before do
    require router_path
  end

  it 'responds to HTTP verb methods' do
    %i[get post put patch delete].each do |verb|
      expect(router).to respond_to(verb)
    end
  end

  it 'registers routes' do
    router.get '/hello' do |_env|
      [200, {}, ['hi']]
    end

    expect(router.routes[:get].keys).to include('/hello')
  end

  it 'dispatches to the correct route' do
    router.get '/hello' do |_env|
      [200, {}, ['world']]
    end

    status, _headers, body =
      router.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/hello')

    expect(status).to eq(200)
    expect(body.join).to eq('world')
  end

  it 'returns 404 for unknown routes' do
    status, _headers, _body =
      router.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/missing')

    expect(status).to eq(404)
  end

  it 'supports multiple HTTP methods' do
    router.post '/submit' do |_env|
      [201, {}, ['ok']]
    end

    status, _headers, body =
      router.call('REQUEST_METHOD' => 'POST', 'PATH_INFO' => '/submit')

    expect(status).to eq(201)
    expect(body.join).to eq('ok')
  end

  it 'produces deterministic routing behavior' do
    router.get '/ping' do |_env|
      [200, {}, ['pong']]
    end

    a = router.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/ping')
    b = router.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/ping')

    expect(a).to eq(b)
  end
end
