#!/usr/bin/env ruby -w
######################################
# A tiny wrapper over optparse that gives easy subcommand facility.
# It also neatly prints help for global and subcommands
# as well as summarizes subcommands in global help.
# 
# @author Rahul Kumar, Jun  2010
# @date 2010-06-20 22:33 
#
# @examples
# if a program has subcommands foo and baz
#
# ruby opt.rb help
# ruby opt.rb --help
# ruby opt.rb help foo
# ruby opt.rb foo --help
# ruby opt.rb baz --quiet "some text"
# ruby opt.rb --verbose foo --force file.zzz
#
# == STEPS 
#    1. define global_options (optional)
#
#     global_options do |opts|
#       opts.banner = "Usage: opt.rb [options] [subcommand [options]]"
#       opts.description = "Stupid program that does something"
#       opts.separator ""
#       opts.separator "Global options are:"
#       opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
#         options[:verbose] = v
#       end
#     end
#
#    2. define commands using command().
#     command :foo do |opts|
#       opts.banner = "Usage: foo [options]"
#       opts.description = "desc for foo"
#       opts.on("-f", "--[no-]force", "force verbosely") do |v|
#         options[:force] = v
#       end
#     end
#
#    3. call opt_parse()
#
#    4. As before, handle ARGS and options hash.
#
######################################
require 'optparse'

# Allow command to have a description to generate help
class OptionParser
  attr_accessor :description
  #attr_accessor :action
end

module Subcommands
  ##
  # specify a single command and all its options
  # Do repeatedly for each command
  # Yields the optionparser
  def command name
    @commands ||= {}
    opt = lambda { OptionParser.new do |opts|
      yield opts
      # append desc to banner in next line
      opts.banner << "\n#{opts.description}\n" if opts.description
    end }
    @commands[name.to_s] = opt
  end
  # specify global options and banner and description
  # Yields the optionparser
  def global_options
    if !defined? @global
      @global = OptionParser.new do |opts|
        yield opts
      end
    else
      yield @global
    end
  end
  # first parse global optinos
  # then parse subcommand options if valid subcommand
  # special case of "help command" so we print help of command - git style (3)
  # in all invalid cases print global help
  def opt_parse
    # if user has not defined global, we need to create it
    if !defined? @global
      global_options do |opts|
        opts.banner = "Usage: #{$0} [options] [subcommand [options]]"
        opts.separator ""
        opts.separator "Global options are:"
        opts.on("-h", "--help", "Print this help") do |v|
          puts @global
          exit
        end
        opts.separator ""
        opts.separator subtext
      end
    else
      # user has defined some, but lets add subcommand information
      cmdtext = "Commands are:"
      @commands.each_pair do |c, opt| 
        desc = opt.call.description
        cmdtext << "\n   #{c} : #{desc}"
      end
      cmdtext << "\n\nSee '#{$0} help COMMAND' for more information on a specific command."
      global_options do |opts|
        # lets add the description user gave into banner
        opts.banner << "\n#{opts.description}\n" if opts.description
        opts.separator ""
        opts.separator cmdtext
      end
    end
    @global.order!
    cmd = ARGV.shift
    if cmd
      #puts "Command: #{cmd} "
      sc = @commands[cmd]
      # if valid command parse the args
      if sc
        #sc.order! 
        #puts " 2222 calling sc"
        sc.call.order!
      else
        # else if help <command> then print its help GIT style (3)
        if !ARGV.empty? and cmd == "help"
          cmd = ARGV.shift
          sc = @commands[cmd]
          # if valid command print help, else print global help
          if sc
            #puts " 111 help foo/baz"
            puts sc.call
          else puts @global
          end
        else
          # invalid command 
          puts @global 
        end
        exit 0
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  include Subcommands
  options = {}
  # global is optional
  global_options do |opts|
    opts.banner = "Usage: opt.rb [options] [subcommand [options]]"
    opts.description = "Stupid program that does something"
    opts.separator ""
    opts.separator "Global options are:"
    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
      options[:verbose] = v
    end
  end
  # define a command
  command :foo do |opts|
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

  # do the parsing.
  opt_parse()

  puts "options ......"
  p options
  puts "ARGV:"
  p ARGV
end
