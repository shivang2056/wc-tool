class WordCountService
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
    case option
    when '-c'
      @file.bytesize.to_s + " #{@path}"
    when '-l'
      @file.scan(/\n/).size.to_s + " #{@path}"
    when '-w'
      @file.split.size.to_s + " #{@path}"
    when '-m'
      @file.size.to_s + " #{@path}"
    when nil
      "#{@file.scan(/\n/).size} #{@file.split.size} #{@file.bytesize} #{@path}"
    else
      raise "\nccwc: illegal option -- #{option}\nusage: ccwc [-clmw] [file ...]"
    end
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
end
