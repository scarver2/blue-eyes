# frozen_string_literal: false

require_relative "../../test_helper"
# require_relative "../../../lib/blue-eyes/extensions/string"

CAMEL_CASES = [
  ['my_app', 'MyApp'],
  ['my_App', 'MyApp'],
  ['MY_APP', 'MyApp'],
  ['my-app', 'MyApp'],
  ['MY-APP', 'MyApp'],
  ['myapp', 'Myapp'],
  ['MyApp', 'MyApp']
]

DIRECTORY_NAME_CASES = [
  ['my_app', 'my_app'],
  ['my_App', 'my_app'],
  ['MY_APP', 'my_app'],
  ['my-app', 'my-app'],
  ['my-App', 'my-app'],
  ['MY-APP', 'my-app'],
  ['myapp', 'myapp'],
  ['MyApp', 'myapp']
]

FILE_NAME_CASES = [
  ['my_app', 'my_app'],
  ['my_App', 'my_app'],
  ['MY_APP', 'my_app'],
  ['my-app', 'my_app'],
  ['MY-APP', 'my_app'],
  ['myapp', 'myapp'],
  ['MyApp', 'my_app']
]

module BlueEyes
  module Extensions
    class StringTest < Minitest::Test
      def test_camel_case
        CAMEL_CASES.each do |input, expected|
          assert_equal input.camel_case, expected
        end
      end

      def test_camel_case!
        CAMEL_CASES.each do |input, expected|
          assert_equal input.camel_case!, expected
        end
      end

      def test_directory_name
        DIRECTORY_NAME_CASES.each do |input, expected|
          assert_equal input.directory_name, expected
        end
      end

      def test_file_name
        FILE_NAME_CASES.each do |input, expected|
          assert_equal input.file_name, expected
        end
      end

      def test_file_name!
        FILE_NAME_CASES.each do |input, expected|
          assert_equal input.file_name!, expected
        end
      end
    end
  end
end
