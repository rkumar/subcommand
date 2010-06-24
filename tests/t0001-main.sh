#!/bin/sh
test_description="Testing out main "
. ./test-lib.sh




test_todo_session "Testing of main" <<EOF
>>> ruby bin/subcommand.rb help
Usage: subcommand.rb [options] [subcommand [options]]
Stupid program that does something

Global options are:
    -v, --[no-]verbose               Run verbosely
    -h, --help                       Print this help

Commands are:
   foo : desc for foo
   baz : desc for baz

Aliases: 
   goo - foo
   bar - ["baz"]
   boo - ["foo", "--force"]
   zoo - ["foo", "ruby"]


See 'bin/subcommand.rb help COMMAND' for more information on a specific command.
>>> end
>>> end
>>> end
>>> ruby bin/subcommand.rb --help
Usage: subcommand.rb [options] [subcommand [options]]
Stupid program that does something

Global options are:
    -v, --[no-]verbose               Run verbosely
    -h, --help                       Print this help

Commands are:
   foo : desc for foo
   baz : desc for baz

Aliases: 
   goo - foo
   bar - ["baz"]
   boo - ["foo", "--force"]
   zoo - ["foo", "ruby"]


See 'bin/subcommand.rb help COMMAND' for more information on a specific command.
>>> end
>>> end
>>> end

EOF
test_done
