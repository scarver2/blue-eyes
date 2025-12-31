# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue_eyes version file' do
  let(:version_path) do
    File.expand_path(
      '../../../lib/blue_eyes/version.rb',
      __dir__
    )
  end

  it 'loads without raising an error' do
    expect { require version_path }.not_to raise_error
  end

  it 'defines the BlueEyes module' do
    require version_path
    expect(defined?(BlueEyes)).to eq('constant')
  end

  it 'defines a VERSION constant' do
    require version_path
    expect(BlueEyes::VERSION).not_to be_nil
  end

  it 'uses semantic versioning' do
    require version_path
    expect(BlueEyes::VERSION).to match(/^\d+\.\d+\.\d+$/)
  end
end
