# encoding: utf-8
# frozen_string_literal: true

require 'rake/testtask'
require 'bundler/gem_tasks'

task :console do
  require 'pry'
  Pry.start
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
