# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'migration template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/migration/migration.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context object to simulate Thor template variables
  let(:context) do
    Struct.new(:migration_class_name, :table_name).new(
      'CreatePosts',
      'posts'
    )
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the correct migration class' do
    output = render
    expect(output).to include('class CreatePosts')
  end

  it 'defines the correct table name' do
    output = render
    expect(output).to include('create_table :posts')
  end

  it 'includes a change method' do
    output = render
    expect(output).to include('def change')
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end')
  end
end
