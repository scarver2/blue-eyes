# frozen_string_literal: false

require_relative '../../test_helper'
# require_relative "../../../lib/blue-eyes/extensions/string"

CAMEL_CASES = [
  %w[my_app MyApp],
  %w[my_App MyApp],
  %w[MY_APP MyApp],
  %w[my-app MyApp],
  %w[MY-APP MyApp],
  %w[myapp Myapp],
  %w[MyApp MyApp]
].freeze

DIRECTORY_NAME_CASES = [
  %w[my_app my_app],
  %w[my_App my_app],
  %w[MY_APP my_app],
  %w[my-app my-app],
  %w[my-App my-app],
  %w[MY-APP my-app],
  %w[myapp myapp],
  %w[MyApp myapp]
].freeze

FILE_NAME_CASES = [
  %w[my_app my_app],
  %w[my_App my_app],
  %w[MY_APP my_app],
  %w[my-app my_app],
  %w[MY-APP my_app],
  %w[myapp myapp],
  %w[MyApp my_app]
].freeze

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
