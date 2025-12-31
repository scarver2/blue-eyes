# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'model template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/model/model.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context object to simulate Thor template variables
  let(:context) do
    Struct.new(:class_name).new('Post')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the correct model class' do
    output = render
    expect(output).to include('class Post')
  end

  it 'inherits from ApplicationRecord' do
    output = render
    expect(output).to match(/<\s*ApplicationRecord/)
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end')
  end
end
