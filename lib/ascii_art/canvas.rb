module AsciiArt
  class Canvas
    include Curses
    include Singleton

    attr_accessor :surface

    def initialize
      noecho
      @surface = init_screen
      stdscr.keypad = true
    end

    def close
      close_screen
      exit
    end

    def move(x, y)
      setpos(y, x)
    end

    def paint(x, y, string)
      move(x, y)
      addstr(string)
    end

    def accept_input
      loop do
        return getch
      end
    end

    def clear(x, y)
      move(x, y)
      delch
      insch(' ')
    end

    def read_at_cursor
      inch
    end

    def line_count
      lines
    end

    def column_count
      cols
    end
  end
end
