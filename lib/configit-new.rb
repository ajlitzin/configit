require 'optparse'
require 'ostruct'
require 'pp'

class CmdOptions

  def self.parse(args)
    options = OpenStruct.new
	options.verbose = false
	options.env = "dev"
	options.conffile = nil
	
	
    opts = OptionParser.new do|opts|
      # Set a banner, displayed at the top
      # of the help screen.
      opts.banner = "Usage: configit.rb [options] "
 
     # Define the options, and what they do
     opts.on( '-v', '--verbose', 'Output more information' ) do
       options.verbose = true
     end
 
     opts.on( '-e', '--environment [ENV]', 'Specify the environment' ) do
       options.env = true
     end
     
	 opts.on( '-u', '--user [USER]', 'User Name' ) do |user|
       options.user_name = user
     end
 
     opts.on( '-p', '--passwd [PASSWORD]', 'Password' ) do |pass|
       options.password = pass
     end
 
     opts.on( '-c', '--conffile FILE', 'Config File location' ) do|file|
       options.config_file = file
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
   opts.parse!
   
   if options.verbose
     puts "Being verbose"
     puts "Your Environment: #{options.env}" if options.env
     puts "Got your user: #{options.user_name}" if options.user
     puts "Got your pass: #{options.password}" if options.password
     puts "Reading config file: #{options.config_file}" if options.conffile
   end
   options
  end # self.parse

end # class

options = CmdOptions.parse(ARGV)
pp options