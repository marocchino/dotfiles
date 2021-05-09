#!/bin/bash

# Git branch bash completion
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  function _git_aa() {
    _git_add
  }
  function _git_ai() {
    _git_add
  }
  function _git_ap() {
    _git_add
  }
  function _git_ca() {
    _git_commit
  }
  function _git_d() {
    _git_diff
  }
  function _git_ds() {
    _git_diff
  }
  function _git_f() {
    _git_fetch
  }
  function _git_fa() {
    _git_fetch
  }
  function _git_last() {
    _git_log
  }
  function _git_pushf() {
    _git_push
  }
  function _git_r() {
    _git_rebase
  }
  function _git_ra() {
    _git_rebase
  }
  function _git_rc() {
    _git_rebase
  }
  function _git_rh() {
    _git_rebase
  }
  function _git_ri() {
    _git_rebase
  }
  function _git_st() {
    _git_status
  }
  function _git_ski() {
    _git_stash
  }
  function _git_w() {
    _git_whatchanged
  }
  function _git_wip() {
    _git_commit
  }

  # Add git completion to aliases
  alias g=git
  __git_complete g __git_main
  alias ga="git add"
  __git_complete ga _git_add
  alias gaa="git add --all"
  __git_complete gaa _git_add
  alias gai="git add --all --intent-to-add"
  __git_complete gai _git_add
  __git_complete gs _git_switch
  __git_complete gr _git_restore
  __git_complete gd _git_branch
fi
