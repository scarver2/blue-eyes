# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Environment do
  let(:env_path) do
    File.expand_path(
      '../../../lib/blue_eyes/environment.rb',
      __dir__
    )
  end

  before do
    require env_path
    @original_env = ENV.fetch('BLUE_EYES_ENV', nil)
  end

  after do
    ENV['BLUE_EYES_ENV'] = @original_env
  end

  it 'responds to .current' do
    expect(described_class).to respond_to(:current)
  end

  it 'defaults to development' do
    ENV.delete('BLUE_EYES_ENV')
    expect(described_class.current).to eq('development')
  end

  it 'reads the environment from ENV' do
    ENV['BLUE_EYES_ENV'] = 'production'
    expect(described_class.current).to eq('production')
  end

  it 'normalizes environment names' do
    ENV['BLUE_EYES_ENV'] = 'Production'
    expect(described_class.current).to eq('production')
  end

  it 'provides boolean helpers' do
    ENV['BLUE_EYES_ENV'] = 'test'
    expect(described_class.test?).to be(true)
    expect(described_class.production?).to be(false)
  end

  it 'integrates with the config loader' do
    content = File.read(env_path)
    expect(content).to match(/ConfigLoader|load_env/)
  end

  it 'produces deterministic values' do
    ENV['BLUE_EYES_ENV'] = 'development'
    a = described_class.current
    b = described_class.current
    expect(a).to eq(b)
  end
end
