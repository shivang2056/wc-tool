require 'minitest/autorun'
require_relative '../lib/example'

class ExampleTest < Minitest::Test
  def test_example
    assert_equal Example.new(15).data, 15
  end
end