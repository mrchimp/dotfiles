## Tmux Sessions ##

`tmux ls`                            List Sessions
`tmux -s <session>`                  New Session
`tmux -t <session>`                  Attach Session
`tmux -t <session>`                  Kill Session
`tmux rename-session -t <old> <new>` Rename Session
`tmux # <0-9>`                       Goto Session

---

# Once In Tmux #

Press CTRL+a and then...

---

## Controls ##

`w <name>`    Choose
`=`           List
`PAGEUP/DOWN` Buffer
`: <command>` Command
`p`           Paste
`ESC`         Copy Mode
`hjkl`        Move
`v`           Start
`y`           Copy

---

## Sessions ##

`:new [-s <name>]` New
`$`                Rename
`s`                List
`(`                Next
`)`                Previous
`^a d`             Detach (leave tmux)

---

## Windows ##

`c`        Create
`w`        List
`, <name>` Rename
`l`        Last
`n`        Next
`p`        Previous
`&`        Close

---

## Panes ##

`"`          Split Horizontally
`%`          Split Vertically
`!`          Pane to Window
`z`          Toggle Fullscreen
`SPACE`      Reorganise
`q`          Show nums
`ARROW`      Select
`{`          Previous
`}`          Next
`o`          Switch to other
`CTRL+ARROW` Resize
`ALT+ARROW`  Expand
`^o`         Swap
`;`          Last
`x`          Kill
