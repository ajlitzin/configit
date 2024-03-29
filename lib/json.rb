require 'json'
require 'hashie'
require 'pp'

class JsonConfiguration
  
  def self.parse(conffile = nil)
    configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")

    if conffile.to_s.empty?
	  file_contents = File.read "#{configuration_root_dir}/configuration.json"
	else
	  file_contents = File.read "#{configuration_root_dir}/#{conffile.to_s}"
	end

    # load config data from json file
    configuration_data = JSON.parse file_contents
    puts configuration_data
    # figure out how to get hash into obj
	#my_parse = Hashie::Mash.new(configuration_data)
	Hashie::Mash.new(configuration_data)
		
  end # parse
end # class

#test = JsonConfiguration.parse(nil)
#puts test.dev.Password