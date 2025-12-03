# frozen_string_literal: true

SimpleCov.external_at_exit = true

SimpleCov.start do
  add_filter 'test'
  enable_coverage_for_eval
end
