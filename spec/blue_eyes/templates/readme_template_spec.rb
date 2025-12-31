# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'README template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/app/README.md.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — README templates usually include the app name
  let(:context) do
    Struct.new(:app_name).new('blue_eyes_app')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'includes the project name' do
    output = render
    expect(output).to include('blue_eyes_app')
  end

  it 'includes installation instructions' do
    output = render
    expect(output.downcase).to include('install')
  end

  it 'includes usage instructions' do
    output = render
    expect(output.downcase).to include('usage')
  end

  it 'references the blue-eyes framework or generator' do
    output = render
    expect(output).to match(/blue[-_]eyes/i)
  end

  it 'produces valid markdown structure' do
    output = render
    expect(output).to include('#')
  end
end
