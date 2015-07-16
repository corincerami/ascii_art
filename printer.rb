class Printer
  require 'canvas'

  attr_accessor :canvas, :lines, :columns, :file
  def initialize(filename)
    @canvas = Canvas.instance
    @lines = @canvas.line_count
    @columns = @canvas.column_count
    @file = File.new(filename, "w")
  end

  def print
    (0..lines-1).each do |y|
      (0..columns-1).each do |x|
        canvas.move(x, y)
        file.write(canvas.read_at_cursor.chr)
      end
      file.write("\n")
    end
    file.close
  end
end
