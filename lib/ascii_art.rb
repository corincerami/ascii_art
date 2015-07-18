# external dependencies
require 'curses'
require 'singleton'

# internal dependencies
require 'ascii_art/painter'
require 'ascii_art/canvas'
require 'ascii_art/brush'
require 'ascii_art/printer'
require 'ascii_art/scanner'

module AsciiArt
  def self.start(filename=nil)
    Painter.new(filename).paint
  end

  def self.start_with_scan(load_file, print_file=nil)
    Painter.new(print_file).load_drawing(load_file)
  end
end
