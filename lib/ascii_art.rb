# external dependencies
require 'curses'
require 'singleton'

# internal dependencies
require 'ascii_art/painter'
require 'ascii_art/canvas'
require 'ascii_art/brush'
require 'ascii_art/printer'

module AsciiArt
  def self.start(filename=nil)
    Painter.new(filename).paint
  end
end
