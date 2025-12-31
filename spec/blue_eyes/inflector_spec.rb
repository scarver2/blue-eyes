# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::Inflector do
  let(:inflector_path) do
    File.expand_path(
      '../../../lib/blue_eyes/inflector.rb',
      __dir__
    )
  end
  let(:inflector) { described_class.new }

  before do
    require inflector_path
  end

  it 'responds to #camelize' do
    expect(inflector).to respond_to(:camelize)
  end

  it 'responds to #underscore' do
    expect(inflector).to respond_to(:underscore)
  end

  it 'camelizes snake_case strings' do
    expect(inflector.camelize('blue_eyes_app')).to eq('BlueEyesApp')
  end

  it 'camelizes hyphenated strings' do
    expect(inflector.camelize('blue-eyes-app')).to eq('BlueEyesApp')
  end

  it 'underscores CamelCase strings' do
    expect(inflector.underscore('BlueEyesApp')).to eq('blue_eyes_app')
  end

  it 'handles mixed-format input' do
    expect(inflector.camelize('blue_eyes-app')).to eq('BlueEyesApp')
  end

  it 'produces deterministic output' do
    a = inflector.camelize('blue_eyes_app')
    b = inflector.camelize('blue_eyes_app')
    expect(a).to eq(b)
  end
end
