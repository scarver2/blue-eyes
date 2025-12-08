# frozen_string_literal: true

require 'rake/testtask'
require 'bundler/gem_tasks'

desc 'Open a Pry console'
task :console do
  require 'blue-eyes'
  require 'pry'
  Pry.start
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
