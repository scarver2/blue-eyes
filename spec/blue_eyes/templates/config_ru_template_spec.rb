# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'config.ru template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/app/config.ru.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — config.ru templates rarely need variables
  let(:context) do
    Struct.new(:app_name).new('BlueEyesApp')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'requires the application file' do
    output = render
    expect(output).to match(%r{require_relative ["']\./config/application["']})
  end

  it 'runs the application class' do
    output = render
    expect(output).to match(/run BlueEyesApp::Application/)
  end

  it 'produces valid Rack structure' do
    output = render
    expect(output).to include('run')
  end
end
