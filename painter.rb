class Painter
  require 'canvas'
  def initialize
    @canvas = Canvas.instance
    @brush = Brush.new('.', 0, 0)
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
    loop do
      accept_input
    end
  end

  private

  attr_reader :canvas, :brush

  def accept_input
    char = canvas.accept_input
    if COMMAND_KEYS.include?(char)
      system_commands(char)
    else
      brush.stroke = char
    end
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
      'p' => proc { Printer.new('drawing.txt').print }
    }
    inputs[char].call
  end
end
