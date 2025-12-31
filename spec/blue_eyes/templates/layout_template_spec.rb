# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'layout template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/layouts/application.html.erb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — most layout templates don't need variables,
  # but we include a title to simulate typical usage.
  let(:context) do
    Struct.new(:app_name).new('BlueEyesApp')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'contains a valid HTML5 structure' do
    output = render
    expect(output).to include('<!DOCTYPE html>')
    expect(output).to include('<html')
    expect(output).to include('</html>')
  end

  it 'includes a head section' do
    output = render
    expect(output).to include('<head>')
  end

  it 'includes a body section' do
    output = render
    expect(output).to include('<body>')
  end

  it 'includes a yield call' do
    output = render
    expect(output).to include('<%= yield %>')
  end

  it 'references the application name if present' do
    output = render
    expect(output).to include('BlueEyesApp')
  end
end
