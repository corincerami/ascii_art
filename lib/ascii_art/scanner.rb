module AsciiArt
  class Scanner
    require_relative 'canvas'

    attr_accessor :filename
    attr_reader :drawing
    def initialize(filename)
      @filename = filename
      @drawing
    end

    def scan
      row = 0
      open_file.each_line do |line|
        Canvas.instance.paint(0, row, line)
        row += 1
      end
    end

    def open_file
      File.open(filename, "r")
    end
  end
end
