[![Gem Version](https://badge.fury.io/rb/ascii_art.svg)](http://badge.fury.io/rb/ascii_art)

# ASCII Art

```
__________ ____ __________________.___.
\______   \    |   \______   \__  |   |
 |       _/    |   /|    |  _//   |   |
 |    |   \    |  / |    |   \\____   |
 |____|_  /______/  |______  // ______|
        \/                 \/ \/
   _____    __________________ .___.___        _____ _____________________
  /  _  \  /   _____/\_   ___ \|   |   |      /  _  \\______   \__    ___/
 /  /_\  \ \_____  \ /    \  \/|   |   |     /  /_\  \|       _/ |    |
/    |    \/        \\     \___|   |   |    /    |    \    |   \ |    |
\____|__  /_______  / \______  /___|___|____\____|__  /____|_  / |____|
        \/        \/         \/       /_____/       \/       \/
```

## Description

The ascii_art gem will allow you to turn your terminal into a canvas for creating images with ASCII characters.

## Installation

Install the gem with:

    $ gem install ascii_art

## Usage

To open a new canvas, simply use:

```ruby
AsciiArt.start
```

or from the command line:

```
$ ascii_art start
```

This will open a blank canvas on which you can start drawing.

### Key Commands

Key                   | Action
----------------------|--------------------------------------
Arrows                | Move the cursor around the screen
`tab`                 | "Lift" the brush so you can move the cursor without marking the canvas
`p`                   | "Print" the drawing, saving it to a `drawing.txt` file in your current directory
Other character keys  | Change the character being drawn
`esc`                 | Quit the program

If you would like to specify a different file to which your drawing should be saved, you can use the -f or --file option on the command line:

```
$ ascii_art start -f my_drawing.txt
```
```
$ ascii_art start --file best_art.txt
```

If you'd like to continue working on a drawing you've started previously, you can load files into the app using the `scan` command:

```
$ ascii_art scan an_old_drawing.txt
```

and can still use the -f option to set the print destination:

```
$ ascii_art scan an_old_drawing.txt -f my_new_masterpiece.txt
```

This will read the file you specify and draw its contents to a new canvas. In order to prevent overwriting any of your beautiful handiwork, the brush will start in the lifted position, and can be lowered with the `tab` key.

## Contributing

If you would like to contribute to AsciiArt, feel free to create a
pull request. If you'd like to contact me, you can reach me at
[chrisccerami@gmail.com](mailto:chrisccerami@gmail.com) or on
Twitter [@chrisccerami](https://twitter.com/chrisccerami).

1. Fork it ( https://github.com/chrisccerami/ascii_art/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright (c) 2015 Chris C Cerami

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
