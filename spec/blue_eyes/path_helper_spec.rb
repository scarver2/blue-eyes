# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BlueEyes::PathHelper do
  let(:helper_path) do
    File.expand_path(
      '../../../lib/blue_eyes/path_helper.rb',
      __dir__
    )
  end
  let(:helper) { described_class.new }

  before do
    require helper_path
  end

  it 'responds to #join' do
    expect(helper).to respond_to(:join)
  end

  it 'responds to #template_path' do
    expect(helper).to respond_to(:template_path)
  end

  it 'joins paths consistently' do
    result = helper.join('a', 'b', 'c')
    expect(result).to end_with('a/b/c').or end_with('a\\b\\c')
  end

  it 'expands relative paths' do
    result = helper.template_path('app/Gemfile.tt')
    expect(result).to match(%r{templates/app/Gemfile\.tt})
  end

  it 'produces deterministic output' do
    a = helper.join('x', 'y')
    b = helper.join('x', 'y')
    expect(a).to eq(b)
  end
end
