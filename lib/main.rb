require './CmdOptions.rb'
require './json.rb'
require './configuration.rb'

# config hierarchy:
# Command line overrules all
# user overrides global
# global overrides default

#code to get_cmd_line_params
  cmd_options = CmdOptions.parse(ARGV)
  pp cmd_options

# code to get defaults
  default_options = Configuration.new(cmd_options.env)
  #default_options = JsonConfiguration.parse("default_configuration.json")
  pp "default debug option: #{default_options.debug}"
  
#code to get_global_config_params
  global_options = JsonConfiguration.parse(cmd_options.config_file)
  pp global_options
  
#future - code to get_user_config_params

# merge the configs to get final
# config hierarchy:
# Command line overrules all
# user overrides global
# global overrides default

# how to implement a merge! so not to have to
# create a temp object?
  default_options.merge!(cmd_options.env, global_options)