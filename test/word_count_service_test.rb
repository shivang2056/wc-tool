require 'minitest/autorun'
require_relative '../lib/word_count_service'

class WordCountServiceTest < Minitest::Test
  FILE_PATH = './test.txt'

  def setup
    @service = WordCountService.new(FILE_PATH)
  end

  def test_without_option
    assert_equal @service.process, "7145 58164 342190 #{FILE_PATH}"
  end

  def test_with_option_c
    assert_equal @service.process('-c'), "342190 #{FILE_PATH}"
  end

  def test_with_option_l
    assert_equal @service.process('-l'), "7145 #{FILE_PATH}"
  end

  def test_with_option_w
    assert_equal @service.process('-w'), "58164 #{FILE_PATH}"
  end

  def test_with_option_m
    assert_equal @service.process('-m'), "339292 #{FILE_PATH}"
  end
end