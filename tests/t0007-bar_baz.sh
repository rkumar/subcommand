#!/bin/sh
test_description="Testing out bar_baz "
. ./test-lib.sh




test_todo_session "Testing of bar_baz" <<EOF
>>> ruby bin/subcommand.rb bar
cmd: baz
options ......
{}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb baz
cmd: baz
options ......
{}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb baz --help
Usage: baz [options]
desc for baz
    -q, --[no-]quiet                 quietly run 
>>> end
>>> ruby bin/subcommand.rb baz -q
cmd: baz
options ......
{:quiet=>true}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb bar -q
cmd: baz
options ......
{:quiet=>true}
ARGV:
[]
>>> end

EOF
test_done
