class WordCountService
  def initialize(file_path)
    @file_path = file_path
    @file = read_file(file_path)
  end

  def process(option = nil)
    case option
    when '-c'
      @file.bytesize.to_s + " #{@file_path}"
    when '-l'
      @file.scan(/\n/).size.to_s + " #{@file_path}"
    when '-w'
      @file.split.size.to_s + " #{@file_path}"
    when '-m'
      @file.size.to_s + " #{@file_path}"
    when nil
      "#{@file.scan(/\n/).size} #{@file.split.size} #{@file.bytesize} #{@file_path}"
    else
      'Error'
    end
  end

  private

  def read_file(file_path)
    File.read(file_path)
  end
end
