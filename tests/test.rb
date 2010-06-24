#!/usr/bin/env ruby -w
require 'subcommand'

if __FILE__ == $PROGRAM_NAME
  include Subcommands
  options = {}
  appname = File.basename($0)
  # global is optional
  #global_options do |opts|
    #opts.banner = "Usage: #{appname} [options] [subcommand [options]]"
    #opts.description = "Stupid program that does something"
    #opts.separator ""
    #opts.separator "Global options are:"
    #opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      #options[:verbose] = v
    #end
  #end
  # define a command
  command :foo, :goo do |opts|
    opts.banner = "Usage: foo [options]"
    opts.description = "desc for foo"
    opts.on("-f", "--[no-]force", "force verbosely") do |v|
      options[:force] = v
    end
  end
  command :baz do |opts|
    opts.banner = "Usage: baz [options]"
    opts.description = "desc for baz"
    opts.on("-q", "--[no-]quiet", "quietly run ") do |v|
      options[:quiet] = v
    end
  end
  alias_command :bar, 'baz'
  alias_command :boo, 'foo', '--force'
  alias_command :zoo, 'foo', 'ruby'

  # do the parsing.
  cmd = opt_parse()

  puts "cmd: #{cmd}"
  puts "options ......"
  p options
  puts "ARGV:"
  p ARGV
end
