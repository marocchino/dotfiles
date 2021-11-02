#!/bin/bash

function fail() {
  echo Failure >&2
  exit 1
}

if nvim -c 'packadd vader.vim | Vader! test/*'; then
  echo Success
else
  fail
fi
