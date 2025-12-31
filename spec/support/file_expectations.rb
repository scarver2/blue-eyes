# frozen_string_literal: true

# matchers for asserting file existence and file content
module FileExpectations
  extend RSpec::Matchers::DSL

  #
  # Usage:
  #   expect_file "app/models/post.rb"
  #   expect_file("app/models/post.rb").to contain("class Post")
  #
  matcher :exist_as_file do
    match do |path|
      File.exist?(path) && File.file?(path)
    end

    failure_message do |path|
      "expected file #{path.inspect} to exist, but it does not"
    end
  end

  matcher :contain do |expected|
    match do |path|
      File.read(path).include?(expected)
    end

    failure_message do |path|
      "expected file #{path.inspect} to contain:\n#{expected.inspect}\n\nBut got:\n#{File.read(path)}"
    end
  end

  #
  # Helper method for cleaner syntax:
  #
  #   expect_file "path/to/file"
  #
  def expect_file(path)
    expect(path).to exist_as_file
    path
  end
end
