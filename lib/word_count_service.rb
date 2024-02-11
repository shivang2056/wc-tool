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
    else
      'Error'
    end
  end

  private

  def read_file(file_path)
    File.read(file_path)
  end
end
