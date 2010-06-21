#!/bin/sh
test_description="Testing out subcomm "
. ./test-lib.sh




test_todo_session "Testing of subcomm" <<EOF
>>> ruby bin/subcommand.rb help foo
Usage: foo [options]
desc for foo
    -f, --[no-]force                 force verbosely
>>> end
>>> ruby bin/subcommand.rb foo --help
Usage: foo [options]
desc for foo
    -f, --[no-]force                 force verbosely
>>> end

EOF
test_done
