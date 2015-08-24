
# Vim #

## Plugins ##

`vundle`    Plugin manager
`nerdtree`  File draw
`ctrlp`     Fuzzy file finder
`figitive`  Git tool
`syntastic` Syntax linter
`jshint`    JS linter
`jscs`      JS code style checker


## Navigation ##

`H/J/K/L` - Left, Up, Down, Right

`^E` Scroll down
`^Y` Scroll up
`^F` Page down
`^B` Page up

`H`  Top of window
`M`  Middle
`L`  Bottom of window

`gg` Top of file
`G`  Bottom of file


## Multiple Files ##

`:e <filename>` Edit a file in a new buffer
`:bnext` `:bn`  Next buffer
`:bprev` `:bp`  Previous buffer
`:bd`           Delete buffer (close file)


## Splits ##

CTRL-W, then:

`s` Split horizontally
`v` Split vertically
`w` Switch windows
`q` Quit window

Also

`:sp <filename>` - Open a file in a new buffer and split window


## Text Objects ##

`w` Words
`e` End of word
`s` Sentences
`p` Paragraphs
`t` Tags


## Motions ##

`a` All
`i` In
`t` UnTil
`f` Find forward
`F` Find backward


## Commands ##

`d`  delete/cut
`c`  change (delete then insert mode)
`y`  yank (copy)
`v`  visual mode
`p`  paste below
`P`  paster above
`dd` delete line
`yy` yank line
`D`  delete


## Repetition ##

`.`   Repeat last command
`^/$` Begining end of line


## Macros ##
### Record ###

`q{register}` Start recording
`q`           Stop recording

### Play ###

`@{register}` Run macro
`m{key}`      Mark line
`{key}        Go to mark









