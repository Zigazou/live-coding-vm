#!/bin/bash
# Compile and run the demo file if compilation has gone well but ensures it
# does not run more than 10 seconds (in case of infite loop).
function compile_and_run() {
    gcc -o demo demo.c && timeout 10s ./demo
}

# This function will return only if demo file has been changed.
function when_demo_changes() {
    inotifywait --quiet --outfile /dev/null --event move_self demo.c

    # Wait for 0.2 seconds to ensure file has been completely written.
    sleep 0.2
}

# Vim generates MOVE_SELF events thus inotifywait cannot use the --monitor
# argument and must rely on a while true loop because watches on a file are
# lost after this event.
while true
do
    when_demo_changes && compile_and_run
done
