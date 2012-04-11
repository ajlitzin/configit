#!/usr/bin/env ruby
 require 'optparse'
 
 # This hash will hold all of the options
 # parsed from the command-line by
 # OptionParser.
 options = {}
 
 optparse = OptionParser.new do|opts|
   # Set a banner, displayed at the top
   # of the help screen.
   opts.banner = "Usage: configit.rb [options] "
 
   # Define the options, and what they do
   options[:verbose] = false
   opts.on( '-v', '--verbose', 'Output more information' ) do
     options[:verbose] = true
   end
 
   options[:env] = "dev"
   opts.on( '-e', '--environment [ENV]', 'Specify the environment' ) do
     options[:env] = true
   end
   opts.on( '-u', '--user [USER]', 'User Name' ) do |user|
     options[:user] = user
   end
 
   opts.on( '-p', '--passwd [PASSWORD]', 'Password' ) do |pass|
     options[:password] = pass
   end
 
   options[:conffile] = nil
   opts.on( '-c', '--conffile FILE', 'Config File location' ) do|file|
     options[:conffile] = file
   end
 
   # This displays the help screen, all programs are
   # assumed to have this option.
   opts.on( '-h', '--help', 'Display this screen' ) do
     puts opts
     exit
   end
 end
 
 # Parse the command-line. Remember there are two forms
 # of the parse method. The 'parse' method simply parses
 # ARGV, while the 'parse!' method parses ARGV and removes
 # any options found there, as well as any parameters for
 # the options. What's left is the list of files to resize.
 optparse.parse!
if options[:verbose] 
 puts "Being verbose" if options[:verbose]
 puts "Your Environment: #{options[:env]}" if options[:env]
 puts "Got your user: #{options[:user]}" if options[:user]
 puts "Got your pass: #{options[:password]}" if options[:password]
 puts "Reading config file: #{options[:conffile]}" if options[:conffile]
end

# we shouldn't realy have any leftover args after parse!
# remove this code once we're code complete :) 
 ARGV.each do|f|
   puts "Resizing image #{f}..."
   sleep 0.5
 end

