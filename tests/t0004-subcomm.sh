#!/bin/sh
test_description="Testing out subcomm "
. ./test-lib.sh




test_todo_session "Testing of subcomm" <<EOF
>>> ruby bin/subcommand.rb baz --quiet "some text"
cmd: baz
options ......
{:quiet=>true}
ARGV:
["some text"]
>>> end
>>> ruby bin/subcommand.rb --verbose foo --force file.zzz
cmd: foo
options ......
{:verbose=>true, :force=>true}
ARGV:
["file.zzz"]
>>> end

EOF
test_done
