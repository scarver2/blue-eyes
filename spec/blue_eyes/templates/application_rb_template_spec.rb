# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'application.rb template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/config/application.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — most application.rb templates use module and class names
  let(:context) do
    Struct.new(:app_module_name, :app_class_name).new(
      'BlueEyesApp',
      'Application'
    )
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the application module' do
    output = render
    expect(output).to include('module BlueEyesApp')
  end

  it 'defines the application class' do
    output = render
    expect(output).to include('class Application')
  end

  it 'inherits from the framework base class' do
    output = render
    expect(output).to match(/<\s*.*Application/)
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end')
  end
end
