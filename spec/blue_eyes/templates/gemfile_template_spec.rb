# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'Gemfile template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/app/Gemfile.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — Gemfile templates rarely need variables,
  # but some include an app name or comment header.
  let(:context) do
    Struct.new(:app_name).new('blue_eyes_app')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'includes the RubyGems source' do
    output = render
    expect(output).to include('source "https://rubygems.org"')
  end

  it 'includes the blue-eyes gem itself' do
    output = render
    expect(output).to match(/gem ["']blue-eyes["']/)
  end

  it 'includes rack or rails dependencies if defined' do
    output = render
    expect(output).to match(/gem ["']rack["']|gem ["']rails["']/)
  end

  it 'produces valid Gemfile structure' do
    output = render
    expect(output).to include('gem')
  end
end
