# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'

RSpec.describe 'BlueEyes application skeleton' do
  let(:generator_path) do
    File.expand_path(
      '../../../lib/blue_eyes/generator.rb',
      __dir__
    )
  end
  let(:tmp_dir) { File.expand_path('../../tmp/skeleton_test', __dir__) }
  let(:generator) do
    BlueEyes::Generator.new(
      app_name: 'demo_app',
      target_path: tmp_dir
    )
  end
  let(:app_root) { File.join(tmp_dir, 'demo_app') }

  before do
    require generator_path
    FileUtils.rm_rf(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)
  end

  after do
    FileUtils.rm_rf(tmp_dir)
  end

  it 'generates the full application skeleton' do
    generator.generate
    expect(File).to exist(app_root)
  end

  it 'creates the expected top-level directories' do
    generator.generate
    %w[
      app
      config
      bin
      lib
      spec
    ].each do |dir|
      expect(Dir.exist?(File.join(app_root, dir))).to be(true)
    end
  end

  it 'creates the expected configuration files' do
    generator.generate
    %w[
      config.ru
      Gemfile
      Rakefile
      README.md
    ].each do |file|
      expect(File).to exist(File.join(app_root, file))
    end
  end

  it 'creates environment configuration files' do
    generator.generate
    %w[
      development.rb
      test.rb
      production.rb
    ].each do |env|
      expect(File).to exist(File.join(app_root, 'config', 'environments', env))
    end
  end

  it 'creates binstubs' do
    generator.generate
    %w[
      console
      setup
    ].each do |bin|
      expect(File).to exist(File.join(app_root, 'bin', bin))
    end
  end

  it 'creates the main application files' do
    generator.generate
    expect(File).to exist(File.join(app_root, 'config', 'application.rb'))
    expect(File).to exist(File.join(app_root, 'config', 'database.yml'))
  end

  it 'creates the library entrypoint' do
    generator.generate
    expect(File).to exist(File.join(app_root, 'lib', 'demo_app.rb'))
  end

  it 'produces a deterministic skeleton' do
    generator.generate
    first = Dir.glob(File.join(app_root, '**', '*'))

    FileUtils.rm_rf(app_root)
    generator.generate
    second = Dir.glob(File.join(app_root, '**', '*'))

    expect(first).to eq(second)
  end
end
