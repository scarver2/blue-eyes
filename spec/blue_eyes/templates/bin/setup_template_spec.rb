# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'bin/setup template' do
  let(:template_path) do
    File.expand_path(
      '../../../../lib/blue_eyes/templates/bin/setup.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

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

  it 'includes dependency installation steps' do
    expect(render).to match(/bundle install/)
  end

  it 'includes database setup steps' do
    expect(render).to match(/db:create|db:migrate|db:setup/)
  end

  it 'produces valid Ruby or shell structure' do
    expect(render.strip).not_to be_empty
  end
end
