# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'
require 'rack/mock'

RSpec.describe 'BlueEyes integration smoke test' do
  let(:root) { File.expand_path('../../tmp/integration_app', __dir__) }
  let(:app_class_path) do
    File.expand_path('../../../lib/blue_eyes/application.rb', __dir__)
  end

  before do
    FileUtils.rm_rf(root)
    FileUtils.mkdir_p(root)

    # minimal config
    File.write(File.join(root, 'config.yml'), <<~YAML)
      default:
        greeting: "Hello"
    YAML

    # minimal app.rb
    FileUtils.mkdir_p(File.join(root, 'app'))
    File.write(File.join(root, 'app', 'app.rb'), <<~RUBY)
      require app_class_path
      #{'  '}
            class App
              def call(env)
                [200, { "Content-Type" => "text/plain" }, ["Hello from BlueEyes"]]
              end
            end
    RUBY
  end

  after do
    FileUtils.rm_rf(root)
  end

  it 'boots the application and responds to a request' do
    app = BlueEyes::Application.new(root: root)
    app.boot

    rack_app = app.to_rack_app
    request = Rack::MockRequest.new(rack_app)

    response = request.get('/')

    expect(response.status).to eq(200)
    expect(response.body).to eq('Hello from BlueEyes')
  end

  it 'produces deterministic responses' do
    app = BlueEyes::Application.new(root: root)
    app.boot

    rack_app = app.to_rack_app
    request = Rack::MockRequest.new(rack_app)

    a = request.get('/').body
    b = request.get('/').body

    expect(a).to eq(b)
  end
end
