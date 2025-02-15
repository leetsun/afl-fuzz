#!/bin/bash
#
# american fuzzy lop - crash triage utility
# -----------------------------------------
#
# Written and maintained by Michal Zalewski <lcamtuf@google.com>
#
# Copyright 2013, 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Note that this assumes that the targeted application reads from stdin
# and requires no other cmdline parameters. Modify as needed if this is
# not the case.
#

echo "crash triage utility for afl-fuzz by <lcamtuf@google.com>"
echo

ulimit -v 100000

if [ ! "$#" = "2" ]; then
  echo "Usage: $0 /path/to/afl_output_dir /path/to/tested_binary" 1>&2
  echo 1>&2
  echo "Note: the tested binary must accept input on stdin and require no additional"1>&2
  echo "parameters. For more complex use cases, you need to edit this script." 1>&2
  echo 1>&2
  exit 1
fi

DIR="$1"
BIN="$2"

if [ ! -f "$BIN" -o ! -x "$BIN" ]; then
  echo "Error: binary '$2' not found or is not executable." 1>&2
  exit 1
fi

if [ ! -d "$DIR/queue" ]; then
  echo "Error: directory '$1' not found or not created by afl-fuzz." 1>&2
  exit 1
fi

CCOUNT=`ls -- "$DIR/crashes" 2>/dev/null | wc -l`

if [ "$CCOUNT" = "0" ]; then
  echo "No crashes recorded in the target directory - nothing to be done."
  exit 0
fi

echo

for crash_dir in $DIR/crashes/*; do

  sig=`basename -- "$crash_dir" | cut -d, -f1 | cut -d: -f2`
  hash=`basename -- "$crash_dir" | cut -d, -f2 | cut -d: -f2`
  count=`ls -- "$crash_dir" | wc -l`

  echo "+++ HASH $hash, SIGNAL $sig ($count samples) +++"
  echo

  first=`ls -- "$crash_dir" |  head -1`

  gdb --batch -q --ex "r <$crash_dir/$first" --ex 'back' --ex 'disass $eip, $eip+16' --ex 'info reg' --ex 'quit' "$BIN"
  echo

done
