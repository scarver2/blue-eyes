# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'gitignore template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/app/gitignore.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — .gitignore templates rarely need variables
  let(:context) { Object.new }

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'ignores log files' do
    output = render
    expect(output).to include('log/')
  end

  it 'ignores temporary files' do
    output = render
    expect(output).to include('tmp/')
  end

  it 'ignores system or editor files' do
    output = render
    expect(output).to match(/\.DS_Store|\.swp|\.idea/)
  end

  it 'produces valid gitignore structure' do
    output = render
    expect(output.strip).not_to be_empty
  end
end
