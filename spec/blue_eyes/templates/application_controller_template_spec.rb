# frozen_string_literal: true

require 'spec_helper'
require 'erb'

RSpec.describe 'application controller template' do
  let(:template_path) do
    File.expand_path(
      '../../../lib/blue_eyes/templates/controller/application_controller.rb.tt',
      __dir__
    )
  end

  let(:template) { ERB.new(File.read(template_path), trim_mode: '-') }

  # Fake context object — most application controller templates don't need variables
  let(:context) do
    Struct.new(:controller_class_name).new('ApplicationController')
  end

  def render
    context.instance_eval { template.result(binding) }
  end

  it 'renders without raising an error' do
    expect { render }.not_to raise_error
  end

  it 'defines the ApplicationController class' do
    output = render
    expect(output).to include('class ApplicationController')
  end

  it 'inherits from ActionController::Base' do
    output = render
    expect(output).to match(/<\s*ActionController::Base/)
  end

  it 'produces valid Ruby structure' do
    output = render
    expect(output).to include('end')
  end
end
