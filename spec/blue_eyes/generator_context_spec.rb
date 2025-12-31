# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::GeneratorContext do
  let(:context_path) do
    File.expand_path(
      '../../../lib/blue_eyes/generator_context.rb',
      __dir__
    )
  end
  let(:context) { described_class.new(app_name: 'blue_eyes_app') }

  before do
    require context_path
  end

  it 'initializes with an app name' do
    expect(context.app_name).to eq('blue_eyes_app')
  end

  it 'derives a module name from the app name' do
    expect(context.app_module_name).to eq('BlueEyesApp')
  end

  it 'derives a class name from the app name' do
    expect(context.app_class_name).to eq('BlueEyesApp')
  end

  it 'provides a binding for ERB templates' do
    b = context.get_binding
    expect(b).to be_a(Binding)
  end

  it 'exposes context variables inside the binding' do
    template = ERB.new('Hello <%= app_name %>')
    output = template.result(context.get_binding)
    expect(output).to eq('Hello blue_eyes_app')
  end

  it 'produces deterministic values' do
    a = context.app_module_name
    b = context.app_module_name
    expect(a).to eq(b)
  end
end
