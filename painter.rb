class Painter
  def initialize
    @canvas = Canvas.instance
    @brush = Brush.new(".", 0, 0)
    at_exit { canvas.close }
  end

  def paint
    canvas.paint(brush.x_pos, brush.y_pos, brush.stroke)
    loop do
      accept_input
    end
  end

  private

  attr_reader :canvas, :brush

  def accept_input
    inputs = {
      Canvas::KEY_UP => proc { brush.move_up },
      Canvas::KEY_LEFT => proc { brush.move_left },
      Canvas::KEY_DOWN => proc { brush.move_down },
      Canvas::KEY_RIGHT => proc { brush.move_right },
      q: proc { ui.close }
    }
    inputs[canvas.accept_input].call
    canvas.paint(brush.x_pos, brush.y_pos, brush.stroke)
  end
end
