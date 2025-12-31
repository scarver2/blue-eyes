# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'BlueEyes error classes' do
  let(:errors_path) do
    File.expand_path(
      '../../../lib/blue_eyes/errors.rb',
      __dir__
    )
  end

  before do
    require errors_path
  end

  it 'defines a base error class' do
    expect(defined?(BlueEyes::Error)).to eq('constant')
    expect(BlueEyes::Error).to be < StandardError
  end

  it 'defines specific error subclasses' do
    expect(defined?(BlueEyes::TemplateError)).to eq('constant')
    expect(defined?(BlueEyes::FileError)).to eq('constant')
    expect(defined?(BlueEyes::ConfigError)).to eq('constant')
  end

  it 'ensures subclasses inherit from the base error' do
    expect(BlueEyes::TemplateError).to be < BlueEyes::Error
    expect(BlueEyes::FileError).to be < BlueEyes::Error
    expect(BlueEyes::ConfigError).to be < BlueEyes::Error
  end

  it 'allows raising and rescuing custom errors' do
    expect do
      raise BlueEyes::TemplateError, 'template failed'
    end.to raise_error(BlueEyes::TemplateError)
  end

  it 'produces deterministic class hierarchy' do
    a = BlueEyes::Error.ancestors
    b = BlueEyes::Error.ancestors
    expect(a).to eq(b)
  end
end
