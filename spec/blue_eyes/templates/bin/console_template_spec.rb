# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'bin/console template' do
  let(:template_path) do
    File.expand_path(
      '../../../../lib/blue_eyes/templates/bin/console.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  let(:context) do
    Struct.new(:app_name).new('blue_eyes_app')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'starts with a Ruby shebang' do
    expect(render).to start_with('#!/usr/bin/env ruby')
  end

  it 'requires the application environment' do
    expect(render).to match(%r{require_relative ["']\.\./config/environment["']})
  end

  it 'invokes an interactive console' do
    expect(render).to match(/IRB|Pry/i)
  end
end
