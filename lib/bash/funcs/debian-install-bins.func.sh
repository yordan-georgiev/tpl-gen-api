#!/bin/bash

do_debian_install_bins() {
  if command -v sudo &>/dev/null; then
    sudo apt install -y "$@"
  else
    echo "WARNING ⚠️ 'sudo' not found. Attempting to install packages without 'sudo'."
    apt install -y "$@"
  fi
}
