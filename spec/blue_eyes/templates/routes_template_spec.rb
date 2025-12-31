# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'routes template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/routes/routes.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context object to simulate Thor template variables
  let(:context) do
    Struct.new(:plural_name).new('posts')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines a routes block' do
    output = render
    expect(output).to include('Rails.application.routes.draw do')
  end

  it 'includes a resources line for the plural name' do
    output = render
    expect(output).to include('resources :posts')
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end')
  end
end
