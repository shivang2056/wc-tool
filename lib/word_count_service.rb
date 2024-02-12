require_relative './word_count_helper'

class WordCountService
  include WordCountHelper

  def initialize(file_path)
    @path = file_path
    @file = read_file(file_path)
  end

  def self.initiate(file_path, option)
    if file_path.nil? && !option.nil? && !option.start_with?("-")
      file_path = option
      option = nil
    end

    self.new(file_path).process(option)
  end

  def process(option = nil)
    if option.nil?
      data = fetch_with_default
    elsif invalid_option?(option)
      raise_invalid_option(option)
    else
      data = fetch_with_option(option)
    end

    "#{data} #{@path}"
  end

  private

  def read_file(path)
    if path.nil?
      $stdin.read
    elsif File.exist?(path)
      File.read(path)
    else
      raise "\nccwc: #{path}: open: No such file or directory"
    end
  end

  def raise_invalid_option(option)
    raise "\nccwc: illegal option -- #{option}\nusage: ccwc [-clmw] [file ...]"
  end
end
