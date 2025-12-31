# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'test environment template' do
  let(:template_path) do
    File.expand_path(
      '../../../../lib/blue_eyes/templates/environments/test.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  let(:context) do
    Struct.new(:app_module_name).new('BlueEyesApp')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the environment module' do
    expect(render).to include('module BlueEyesApp')
  end

  it 'contains test-specific configuration' do
    expect(render).to match(/config\.cache_classes\s*=\s*true/)
  end

  it 'produces valid Ruby structure' do
    expect(render).to include('end')
  end
end
