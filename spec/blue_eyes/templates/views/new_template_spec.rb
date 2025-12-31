# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'new view template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/views/new.html.erb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  let(:context) do
    Struct.new(:singular_name).new('post')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'includes a form for the resource' do
    expect(render).to include('form_with')
  end

  it 'references the singular resource variable' do
    expect(render).to include('@post')
  end
end
