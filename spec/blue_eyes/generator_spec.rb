# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'

RSpec.describe BlueEyes::Generator do
  let(:generator_path) do
    File.expand_path(
      '../../../lib/blue_eyes/generator.rb',
      __dir__
    )
  end
  let(:tmp_dir) { File.expand_path('../../tmp/generator_test', __dir__) }
  let(:generator) do
    described_class.new(
      app_name: 'test_app',
      target_path: tmp_dir
    )
  end

  before do
    require generator_path
    FileUtils.rm_rf(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)
  end

  after do
    FileUtils.rm_rf(tmp_dir)
  end

  it 'defines the BlueEyes::Generator class' do
    expect(defined?(described_class)).to eq('constant')
  end

  it 'responds to #generate' do
    expect(generator).to respond_to(:generate)
  end

  it 'creates the application directory' do
    generator.generate
    expect(File).to exist(File.join(tmp_dir, 'test_app'))
  end

  it 'renders templates into the correct locations' do
    generator.generate
    expect(Dir.glob(File.join(tmp_dir, 'test_app', '**', '*'))).not_to be_empty
  end

  it 'writes files to disk' do
    generator.generate
    expect(File).to exist(File.join(tmp_dir, 'test_app', 'Gemfile'))
  end

  it 'invokes template rendering logic' do
    expect(generator).to receive(:render_template).at_least(:once)
    generator.generate
  end

  it 'produces a valid project structure' do
    generator.generate
    expect(File).to exist(File.join(tmp_dir, 'test_app', 'config'))
    expect(File).to exist(File.join(tmp_dir, 'test_app', 'app'))
  end
end
