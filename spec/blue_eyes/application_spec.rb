# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Application do
  let(:app_path) do
    File.expand_path(
      '../../../lib/blue_eyes/application.rb',
      __dir__
    )
  end
  let(:root) { File.expand_path('../../tmp/app_runtime_test', __dir__) }
  let(:app)  { described_class.new(root: root) }

  before do
    require app_path
    FileUtils.rm_rf(root)
    FileUtils.mkdir_p(root)
    File.write(File.join(root, 'config.yml'), <<~YAML)
      default:
        greeting: "Hello"
      development:
        greeting: "Hi dev"
    YAML
  end

  after do
    FileUtils.rm_rf(root)
  end

  it 'initializes with a root path' do
    expect(app.root).to eq(root)
  end

  it 'loads configuration' do
    config = app.config
    expect(config['greeting']).to eq('Hi dev')
  end

  it 'exposes the environment' do
    expect(app.environment).to be_a(BlueEyes::Environment)
  end

  it 'provides a logger' do
    expect(app.logger).to respond_to(:info)
  end

  it 'provides deterministic configuration' do
    a = app.config
    b = app.config
    expect(a).to eq(b)
  end

  it 'bootstraps without raising errors' do
    expect { app.boot }.not_to raise_error
  end
end
