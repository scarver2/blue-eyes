# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue_eyes library entrypoint' do
  let(:entrypoint_path) do
    File.expand_path(
      '../../../lib/blue_eyes.rb',
      __dir__
    )
  end

  it 'loads without raising an error' do
    expect { require entrypoint_path }.not_to raise_error
  end

  it 'defines the BlueEyes module' do
    require entrypoint_path
    expect(defined?(BlueEyes)).to eq('constant')
  end

  it 'exposes a version constant' do
    require entrypoint_path
    expect(BlueEyes::VERSION).not_to be_nil
  end

  it 'requires internal components' do
    content = File.read(entrypoint_path)
    expect(content).to match(%r{require ["']blue_eyes/cli["']})
      .or match(%r{require ["']blue_eyes/generator["']})
  end

  it 'produces valid Ruby structure' do
    content = File.read(entrypoint_path)
    expect(content).to include('module BlueEyes')
    expect(content).to include('end')
  end
end
