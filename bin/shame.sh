#!/bin/sh

function shame {
  for i in {1..3}; do say -v Karen shame && sleep 0.2 && say -v Tessa shame && sleep 0.1 && for j in {1..3}; do afplay /System/Library/Sounds/Glass.aiff; done && sleep 0.5; done
  exit 1
}

shame
