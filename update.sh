#!/bin/bash

REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -xe

rm -rf repo app

flatpak-builder --repo=repo app org.chigraph.chigraphgui.json

flatpak build-sign repo \
  --gpg-sign=2F04F8C4132EF3BF0264FAE1D345FAFC910AA344 \
  --gpg-homedir=~/projects/flatpak-chigraph-gpg


flatpak build-update-repo repo \
  --gpg-sign=2F04F8C4132EF3BF0264FAE1D345FAFC910AA344 \
  --gpg-homedir=~/projects/flatpak-chigraph-gpg

git add .
git commit -m "Update flatpak packages"

git push

