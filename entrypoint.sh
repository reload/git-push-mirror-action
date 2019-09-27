#!/bin/sh -l

set -eu

git push --mirror "$@"
