#!/bin/bash

FOLDER="/data/Notes"

EDITOR="nvim"

TERM="kitty"

dinput () {
  dmenu -p "Name of the note:" <&- | tr " " "-"
}

NOTE=$(dinput)

if [[ ! -d "$FOLDER" ]]; then
  mkdir -p $FOLDER
fi

if [[ -f "$FOLDER/$NOTE.md" ]]; then
  notify-send "Sorry, '$NOTE.md exists.' 'Please select another name.'" 
else 
  touch $FOLDER/$NOTE.md
  echo "<!--- $(date +"%a - %d %b, %H:%M")-->" > $FOLDER/$NOTE.md
  $TERM -e $EDITOR $FOLDER/$NOTE.md
fi

