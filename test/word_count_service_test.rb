require 'minitest/autorun'
require_relative '../lib/word_count_service'

class WordCountServiceTest < Minitest::Test
  FILE_PATH = './test.txt'

  def test_without_option
    assert_equal "7145 58164 342190 #{FILE_PATH}", execute_service(FILE_PATH)
  end

  def test_with_option_c
    assert_equal "342190 #{FILE_PATH}", execute_service(FILE_PATH, '-c')
  end

  def test_with_option_l
    assert_equal "7145 #{FILE_PATH}", execute_service(FILE_PATH, '-l')
  end

  def test_with_option_w
    assert_equal "58164 #{FILE_PATH}", execute_service(FILE_PATH, '-w')
  end

  def test_with_option_m
    assert_equal "339292 #{FILE_PATH}", execute_service(FILE_PATH, '-m')
  end

  def test_with_option_as_file_path
    assert_equal "7145 58164 342190 #{FILE_PATH}", execute_service(nil, FILE_PATH)
  end

  def test_with_invalid_file
    error = assert_raises(RuntimeError) do
      execute_service('invalid_file.txt')
    end

    assert_equal "\nccwc: invalid_file.txt: open: No such file or directory", error.message
  end

  def test_invalid_option
    error = assert_raises(RuntimeError) do
      execute_service(FILE_PATH, '-a')
    end

    assert_match "\nccwc: illegal option -- -a\nusage: ccwc [-clmw] [file ...]", error.message
  end

  private

  def execute_service(file_path, option = nil)
    WordCountService.initiate(file_path, option)
  end
end