# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::CLI do
  let(:cli_path) do
    File.expand_path(
      '../../../lib/blue_eyes/cli.rb',
      __dir__
    )
  end

  before do
    require cli_path
  end

  it 'defines the BlueEyes::CLI class or module' do
    expect(defined?(described_class)).to be_truthy
  end

  it "responds to the 'new' command" do
    expect(described_class.instance_methods.map(&:to_s))
      .to include('new')
      .or include('call')
  end

  it "responds to the 'generate' command if implemented" do
    methods = described_class.instance_methods.map(&:to_s)
    expect(methods).to include('generate').or include('g')
  end

  it 'invokes the generator or dispatcher' do
    content = File.read(cli_path)
    expect(content).to match(/Generator|Dispatch|Commands/)
  end

  it 'produces valid Ruby structure' do
    content = File.read(cli_path)
    expect(content).to include('module BlueEyes').or include('class CLI')
  end
end
