# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Middleware::Base do
  let(:middleware_path) do
    File.expand_path(
      '../../../lib/blue_eyes/middleware/base.rb',
      __dir__
    )
  end
  let(:app) do
    ->(_env) { [200, { 'Content-Type' => 'text/plain' }, ['OK']] }
  end
  let(:middleware) { described_class.new(app) }

  before do
    require middleware_path
  end

  it 'initializes with an app' do
    expect(middleware.app).to eq(app)
  end

  it 'responds to #call' do
    expect(middleware).to respond_to(:call)
  end

  it 'delegates to the next app' do
    status, headers, body = middleware.call({})
    expect(status).to eq(200)
    expect(headers['Content-Type']).to eq('text/plain')
    expect(body.join).to eq('OK')
  end

  it 'allows subclasses to modify the environment' do
    subclass = Class.new(described_class) do
      def call(env)
        env[:touched] = true
        super
      end
    end

    instance = subclass.new(app)
    env = {}
    instance.call(env)
    expect(env[:touched]).to be(true)
  end

  it 'produces deterministic behavior' do
    a = middleware.call({})
    b = middleware.call({})
    expect(a).to eq(b)
  end
end
