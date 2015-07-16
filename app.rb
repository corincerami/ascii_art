class App
  def initialize
    @ui = UI.instance
    @brush = Brush.new(".", 0, 0)
    at_exit { ui.close }
  end

  def run
    ui.paint(brush.x_pos, brush.y_pos, brush.stroke)
    loop do
      accept_input
    end
  end

  private

  attr_reader :ui, :brush

  def accept_input
    inputs = {
      UI::KEY_UP => proc { brush.move_up },
      UI::KEY_LEFT => proc { brush.move_left },
      UI::KEY_DOWN => proc { brush.move_down },
      UI::KEY_RIGHT => proc { brush.move_right },
      q: proc { ui.close }
    }
    inputs[ui.accept_input].call
    ui.paint(brush.x_pos, brush.y_pos, brush.stroke)
  end
end
