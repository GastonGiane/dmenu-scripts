#!/bin/bash

FOLDER="/data/Notes"

dinput () {
  dmenu -p "Name of the note:" <&-
}

NOTE=$(dinput)

if [[ ! -d "$FOLDER" ]]; then
  mkdir -p $FOLDER
fi

if [[ -f "$FOLDER/$NOTE.md" ]]; then
  notify-send "Sorry, '$NOTE.md exists.' 'Please select another name.'" 
else 
  touch $FOLDER/$NOTE.md
  $EDITOR $FOLDER/$NOTE.md
fi

