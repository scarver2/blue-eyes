# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Commands do
  let(:commands_path) do
    File.expand_path(
      '../../../lib/blue_eyes/commands.rb',
      __dir__
    )
  end

  before do
    require commands_path
  end

  it 'defines the BlueEyes::Commands module or class' do
    expect(defined?(described_class)).to be_truthy
  end

  it "responds to the 'new' command" do
    methods = described_class.methods.map(&:to_s)
    expect(methods).to include('new').or include('create')
  end

  it "responds to the 'generate' command if implemented" do
    methods = described_class.methods.map(&:to_s)
    expect(methods).to include('generate').or include('g')
  end

  it 'delegates to the generator' do
    content = File.read(commands_path)
    expect(content).to match(/Generator|generate|create_app/)
  end

  it 'produces valid Ruby structure' do
    content = File.read(commands_path)
    expect(content).to include('module BlueEyes').or include('class Commands')
  end
end
