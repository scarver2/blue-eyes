# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'blue-eyes model', type: :aruba do
  let(:model_name) { 'post' }
  let(:timestamp_regex) { /\d{14}_create_posts\.rb/ }

  before do
    run_command("blue-eyes model #{model_name}")
  end

  it 'exits successfully' do
    expect(last_command_started).to have_exit_status(0)
  end

  it 'creates a model file' do
    expect(File).to exist(File.join(expand_path('.'), 'app', 'models', 'post.rb'))
  end

  it 'creates a migration file' do
    migrations = Dir[File.join(expand_path('.'), 'db', 'migrate', '*.rb')]
    expect(migrations.any? { |f| f.match?(timestamp_regex) }).to be(true)
  end

  it 'prints a success message' do
    expect(last_command_started.output).to include("Created model #{model_name}")
  end
end
