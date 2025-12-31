# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'index view template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/views/index.html.erb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  let(:context) do
    Struct.new(:plural_name).new('posts')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'references the plural resource name' do
    expect(render).to include('@posts')
  end

  it 'includes a link to create a new resource' do
    expect(render).to include('New Post')
  end
end
