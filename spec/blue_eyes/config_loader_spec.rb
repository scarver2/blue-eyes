# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'
require 'yaml'

RSpec.describe BlueEyes::ConfigLoader do
  let(:loader_path) do
    File.expand_path(
      '../../../lib/blue_eyes/config_loader.rb',
      __dir__
    )
  end
  let(:tmp_dir) { File.expand_path('../../tmp/config_loader_test', __dir__) }
  let(:config_file) { File.join(tmp_dir, 'config.yml') }
  let(:loader) { described_class.new }

  before do
    require loader_path
    FileUtils.rm_rf(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)

    File.write(config_file, <<~YAML)
      default:
        greeting: "Hello"
        enabled: true

      development:
        greeting: "Hi dev"

      production:
        enabled: false
    YAML
  end

  after do
    FileUtils.rm_rf(tmp_dir)
  end

  it 'responds to #load' do
    expect(loader).to respond_to(:load)
  end

  it 'responds to #load_env' do
    expect(loader).to respond_to(:load_env)
  end

  it 'loads YAML configuration' do
    config = loader.load(config_file)
    expect(config['default']['greeting']).to eq('Hello')
  end

  it 'loads environment-specific configuration' do
    config = loader.load_env(config_file, 'development')
    expect(config['greeting']).to eq('Hi dev')
  end

  it 'merges default and environment settings' do
    config = loader.load_env(config_file, 'production')
    expect(config['greeting']).to eq('Hello')
    expect(config['enabled']).to be(false)
  end

  it 'raises an error for missing files' do
    missing = File.join(tmp_dir, 'missing.yml')
    expect do
      loader.load(missing)
    end.to raise_error(Errno::ENOENT)
  end

  it 'produces deterministic output' do
    a = loader.load_env(config_file, 'development')
    b = loader.load_env(config_file, 'development')
    expect(a).to eq(b)
  end
end
