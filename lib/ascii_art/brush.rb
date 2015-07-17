module AsciiArt
  class Brush
    attr_accessor :stroke, :x_pos, :y_pos, :lifted
    def initialize(stroke, x, y)
      @stroke = stroke
      @x_pos = x
      @y_pos = y
      @lifted = false
    end

    def raise_or_lower
      @lifted = !@lifted
    end

    def move(x, y)
      @x_pos = x
      @y_pos = y
    end

    def move_up
      move(@x_pos, @y_pos - 1)
    end

    def move_down
      move(@x_pos, @y_pos + 1)
    end

    def move_left
      move(@x_pos - 1, @y_pos)
    end

    def move_right
      move(@x_pos + 1, @y_pos)
    end
  end
end
