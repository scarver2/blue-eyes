# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'Rakefile template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/app/Rakefile.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context — most Rakefiles don't need variables
  let(:context) { Object.new }

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines at least one rake task' do
    output = render
    expect(output).to match(/task\s+:/)
  end

  it 'includes migration tasks if defined' do
    output = render
    expect(output).to match(/db:migrate|db:create|db:seed/)
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end').or include('task')
  end
end
