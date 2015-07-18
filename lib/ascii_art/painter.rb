module AsciiArt
  require_relative 'canvas'
  class Painter
    def initialize(print_file=nil)
      @canvas = Canvas.instance
      @brush = Brush.new('.', 0, 0)
      @print_file = print_file
      @printer
      @scanner
      at_exit { canvas.close }
    end

    COMMAND_KEYS = [
      Canvas::KEY_UP,
      Canvas::KEY_DOWN,
      Canvas::KEY_LEFT,
      Canvas::KEY_RIGHT,
      9, # tab key character code
      27, # esc key character code
      'p'
    ]

    def paint
      canvas.paint(brush.x_pos, brush.y_pos, brush.stroke)
      command_loop
    end

    def load_drawing(filename)
      Scanner.new(filename).scan
      brush.lifted = true
      move_brush
      command_loop
    end

    def command_loop
      loop do
        follow_commands
      end
    end

    private

    attr_accessor :scanner
    attr_reader :canvas, :brush, :printer, :print_file

    def follow_commands
      char = canvas.accept_input
      if COMMAND_KEYS.include?(char)
        system_commands(char)
      else
        brush.stroke = char
      end
      move_brush
    end

    def move_brush
      if brush.lifted
        canvas.move(brush.x_pos, brush.y_pos)
      else
        canvas.paint(brush.x_pos, brush.y_pos, brush.stroke)
      end
    end

    def system_commands(char)
      inputs = {
        Canvas::KEY_UP => proc { brush.move_up },
        Canvas::KEY_LEFT => proc { brush.move_left },
        Canvas::KEY_DOWN => proc { brush.move_down },
        Canvas::KEY_RIGHT => proc { brush.move_right },
        9 => proc { brush.raise_or_lower },
        27 => proc { canvas.close },
        'p' => proc {
          printer = Printer.new(print_file ||= 'drawing.txt')
          printer.print
        }
      }
      inputs[char].call
    end
  end
end
