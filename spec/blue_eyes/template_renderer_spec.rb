# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'
require 'erb'

RSpec.describe BlueEyes::TemplateRenderer do
  let(:renderer_path) do
    File.expand_path(
      '../../../lib/blue_eyes/template_renderer.rb',
      __dir__
    )
  end
  let(:tmp_dir) { File.expand_path('../../tmp/template_renderer_test', __dir__) }
  let(:renderer) { described_class.new }
  let(:template_content) { 'Hello <%= name %>!' }
  let(:template_path) { File.join(tmp_dir, 'template.erb') }

  before do
    require renderer_path
    FileUtils.rm_rf(tmp_dir)
    FileUtils.mkdir_p(tmp_dir)

    File.write(template_path, template_content)
  end

  after do
    FileUtils.rm_rf(tmp_dir)
  end

  it 'responds to #render' do
    expect(renderer).to respond_to(:render)
  end

  it 'responds to #render_to_file' do
    expect(renderer).to respond_to(:render_to_file)
  end

  it 'renders ERB templates with context' do
    output = renderer.render(template_path, name: 'Stan')
    expect(output).to eq('Hello Stan!')
  end

  it 'writes rendered output to a file' do
    target = File.join(tmp_dir, 'output.txt')
    renderer.render_to_file(template_path, target, name: 'Stan')
    expect(File.read(target)).to eq('Hello Stan!')
  end

  it 'raises an error if the template file does not exist' do
    missing = File.join(tmp_dir, 'missing.erb')
    expect do
      renderer.render(missing, {})
    end.to raise_error(Errno::ENOENT)
  end

  it 'produces deterministic output' do
    a = renderer.render(template_path, name: 'Stan')
    b = renderer.render(template_path, name: 'Stan')
    expect(a).to eq(b)
  end
end
