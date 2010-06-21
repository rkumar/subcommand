#!/bin/sh
test_description="Testing out inv_comm "
. ./test-lib.sh




test_todo_session "Testing of inv_comm" <<EOF
>>> ruby bin/subcommand.rb help fxxx
Invalid command: fxxx.
Usage: subcommand.rb [options] [subcommand [options]]
Stupid program that does something

Global options are:
    -v, --[no-]verbose               Run verbosely

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
>>> ruby bin/subcommand.rb fxxx --help
Invalid command: fxxx
Usage: subcommand.rb [options] [subcommand [options]]
Stupid program that does something

Global options are:
    -v, --[no-]verbose               Run verbosely

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

EOF
test_done
