$LOAD_PATH.unshift '.'

require 'curses'
require 'app'
require 'ui'
require 'brush'

App.new.run
