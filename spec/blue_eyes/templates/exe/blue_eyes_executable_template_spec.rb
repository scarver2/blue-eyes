# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'exe/blue_eyes template' do
  let(:template_path) do
    File.expand_path(
      '../../../../lib/blue_eyes/templates/exe/blue_eyes.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — CLI templates rarely need variables
  let(:context) { Object.new }

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'starts with a Ruby shebang' do
    expect(render).to start_with('#!/usr/bin/env ruby')
  end

  it 'requires the blue-eyes library' do
    expect(render).to match(/require ["']blue[-_]eyes["']/)
  end

  it 'invokes the CLI or command dispatcher' do
    expect(render).to match(/BlueEyes::CLI|BlueEyes::Commands|run/)
  end

  it 'produces valid Ruby structure' do
    expect(render.strip).not_to be_empty
  end
end
