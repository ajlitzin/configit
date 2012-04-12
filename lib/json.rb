require 'json'

class JsonConfiguration
  attr_accessor :env, :user, :password, :debug, :verbose, :config_file

  def self.parse(conffile)
    configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")

    if conffile.empty?
	  file_contents = File.read "#{configuration_root_dir}/configuration.json"
	else
	  file_contents = File.read "#{configuration_root_dir}/#{conffile}"
	end

    # load config data from json file
    configuration_data = JSON.parse file_contents
  
    # figure out how to get hash into obj
	# obj.env.property ?
end

