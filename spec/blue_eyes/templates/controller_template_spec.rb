# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'controller template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/controller/controller.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context object to simulate Thor template variables
  let(:context) do
    Struct.new(:controller_class_name, :actions).new(
      'PostsController',
      %w[index show new edit]
    )
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the correct controller class' do
    output = render
    expect(output).to include('class PostsController')
  end

  it 'inherits from ApplicationController' do
    output = render
    expect(output).to match(/<\s*ApplicationController/)
  end

  it 'includes the expected action methods' do
    output = render
    %w[index show new edit].each do |action|
      expect(output).to include("def #{action}")
    end
  end
end
