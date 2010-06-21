#!/bin/sh
test_description="Testing out alias_goo "
. ./test-lib.sh




test_todo_session "Testing of alias_goo" <<EOF
>>> ruby bin/subcommand.rb goo
cmd: foo
options ......
{}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb help goo
Usage: foo [options]
desc for foo
    -f, --[no-]force                 force verbosely
>>> end
>>> ruby bin/subcommand.rb goo --help
Usage: foo [options]
desc for foo
    -f, --[no-]force                 force verbosely
>>> end

EOF
test_done
