module WordCountHelper
  ALLOWED_OPTIONS = ['-l', '-w', '-c', '-m'].freeze
  DEFAULT_OPTIONS = ['-l', '-w', '-c'].freeze
  OPTION_MAPPING = {
    '-l' => :compute_lines,
    '-w' => :compute_words,
    '-c' => :compute_bytes,
    '-m' => :compute_chars
  }.freeze

  def fetch_with_option(option)
    method = OPTION_MAPPING[option]

    send(method)
  end

  def fetch_with_default
    DEFAULT_OPTIONS.map do |option|
      fetch_with_option(option)
    end.join(' ')
  end

  private

  def invalid_option?(option)
    !ALLOWED_OPTIONS.include?(option)
  end

  def compute_bytes
    @file.bytesize
  end

  def compute_lines
    @file.scan(/\n/).size
  end

  def compute_words
    @file.split.size
  end

  def compute_chars
    @file.size
  end

  def raise_invalid_option
    raise "\nccwc: illegal option -- #{option}\nusage: ccwc [-clmw] [file ...]"
  end
end
