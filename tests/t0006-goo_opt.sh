#!/bin/sh
test_description="Testing out goo_opt "
. ./test-lib.sh




test_todo_session "Testing of goo_opt" <<EOF
>>> ruby bin/subcommand.rb goo -f
cmd: foo
options ......
{:force=>true}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb foo -f
cmd: foo
options ......
{:force=>true}
ARGV:
[]
>>> end

EOF
test_done
