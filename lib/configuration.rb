class Configuration
attr_accessor :env, :user, :password, :debug, :verbose, :config_file
  
  def initialize
    @env = "dev"
	@debug = false
	@verbose = false
	@config_file = "configuration.json"
  end
  
  
  def merge(configs=[])
    
    # for all the configurations,
      # apply this configuration for all the properites that I care about
    configs.each do |config|
      @env = config.env
      
    end
  end
end
