class UI
  include Curses
  require 'singleton'
  include Singleton

  def initialize
    noecho
    init_screen
    stdscr.keypad = true
  end

  def close
    close_screen
    exit
  end

  def paint(x, y, string)
    setpos(y, x)
    addstr(string)
  end

  def accept_input
    loop do
      return getch
    end
  end

  def clear(x, y)
    setpos(y, x)
    delch
    insch(' ')
  end
end
