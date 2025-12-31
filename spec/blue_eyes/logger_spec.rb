# frozen_string_literal: true

require 'spec_helper'
require 'stringio'

RSpec.describe BlueEyes::Logger do
  let(:logger_path) do
    File.expand_path(
      '../../../lib/blue_eyes/logger.rb',
      __dir__
    )
  end
  let(:output) { StringIO.new }
  let(:logger) { described_class.new(io: output) }

  before do
    require logger_path
    @original_env = ENV.fetch('BLUE_EYES_ENV', nil)
  end

  after do
    ENV['BLUE_EYES_ENV'] = @original_env
  end

  it 'responds to standard logging methods' do
    %i[info warn error debug].each do |method|
      expect(logger).to respond_to(method)
    end
  end

  it 'writes log messages to the provided IO' do
    logger.info('Hello Stan')
    expect(output.string).to match(/Hello Stan/)
  end

  it 'respects environment log levels' do
    ENV['BLUE_EYES_ENV'] = 'production'
    logger.debug('debug message')
    expect(output.string).not_to match(/debug message/)
  end

  it 'logs debug messages in development' do
    ENV['BLUE_EYES_ENV'] = 'development'
    logger.debug('debug message')
    expect(output.string).to match(/debug message/)
  end

  it 'formats messages consistently' do
    logger.info('test')
    expect(output.string).to match(/\[INFO\]/)
  end

  it 'produces deterministic output' do
    logger.info('A')
    a = output.string.dup
    output.truncate(0)
    output.rewind
    logger.info('A')
    b = output.string
    expect(a).to eq(b)
  end
end
