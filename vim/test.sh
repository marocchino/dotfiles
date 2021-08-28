#!/bin/bash

function fail() {
  echo Failure >&2
  exit 1
}
nvim -c 'Vader! test/*' && echo Success || fail
