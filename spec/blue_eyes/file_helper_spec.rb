# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'

RSpec.describe BlueEyes::FileHelper do
  let(:helper_path) do
    File.expand_path(
      '../../../lib/blue_eyes/file_helper.rb',
      __dir__
    )
  end
  let(:tmp_dir) { File.expand_path('../../tmp/file_helper_test', __dir__) }
  let(:helper) { described_class.new }

  before do
    require helper_path
    FileUtils.rm_rf(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)
  end

  after do
    FileUtils.rm_rf(tmp_dir)
  end

  it 'responds to #write_file' do
    expect(helper).to respond_to(:write_file)
  end

  it 'responds to #ensure_directory' do
    expect(helper).to respond_to(:ensure_directory)
  end

  it 'creates directories when needed' do
    target = File.join(tmp_dir, 'nested/dir/file.txt')
    helper.ensure_directory(File.dirname(target))
    expect(Dir.exist?(File.dirname(target))).to be(true)
  end

  it 'writes content to a file' do
    target = File.join(tmp_dir, 'output.txt')
    helper.write_file(target, 'Hello Stan')
    expect(File.read(target)).to eq('Hello Stan')
  end

  it 'overwrites existing files when allowed' do
    target = File.join(tmp_dir, 'overwrite.txt')
    File.write(target, 'old')
    helper.write_file(target, 'new', overwrite: true)
    expect(File.read(target)).to eq('new')
  end

  it 'raises an error when overwriting is not allowed' do
    target = File.join(tmp_dir, 'collision.txt')
    File.write(target, 'existing')
    expect do
      helper.write_file(target, 'new', overwrite: false)
    end.to raise_error(/exists/i)
  end

  it 'produces deterministic writes' do
    target = File.join(tmp_dir, 'deterministic.txt')
    helper.write_file(target, 'A')
    a = File.read(target)
    helper.write_file(target, 'A', overwrite: true)
    b = File.read(target)
    expect(a).to eq(b)
  end
end
