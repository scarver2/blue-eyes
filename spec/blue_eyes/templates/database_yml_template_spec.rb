# frozen_string_literal: true

require 'spec_helper'
require 'erb'
require 'yaml'

RSpec.describe 'database.yml template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/config/database.yml.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — many database.yml templates use app_name or env vars
  let(:context) do
    Struct.new(:app_name).new('blue_eyes_app')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'produces valid YAML' do
    expect { YAML.safe_load(render) }.not_to raise_error
  end

  it 'defines development, test, and production environments' do
    yaml = YAML.safe_load(render)
    expect(yaml.keys).to include('development', 'test', 'production')
  end

  it 'uses an adapter' do
    yaml = YAML.safe_load(render)
    expect(yaml['development']).to have_key('adapter')
  end

  it 'references the application name if applicable' do
    output = render
    expect(output).to include('blue_eyes_app')
  end
end
