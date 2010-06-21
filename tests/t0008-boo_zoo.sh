#!/bin/sh
test_description="Testing out boo_zoo "
. ./test-lib.sh




test_todo_session "Testing of boo_zoo" <<EOF
>>> ruby bin/subcommand.rb boo
cmd: foo
options ......
{:force=>true}
ARGV:
[]
>>> end
>>> ruby bin/subcommand.rb boo ruby
cmd: foo
options ......
{:force=>true}
ARGV:
["ruby"]
>>> end
>>> ruby bin/subcommand.rb zoo
cmd: foo
options ......
{}
ARGV:
["ruby"]
>>> end
>>> ruby bin/subcommand.rb zoo duby
cmd: foo
options ......
{}
ARGV:
["ruby", "duby"]
>>> end
>>> ruby bin/subcommand.rb help zoo
Usage: foo [options]
desc for foo
    -f, --[no-]force                 force verbosely
>>> end

EOF
test_done
