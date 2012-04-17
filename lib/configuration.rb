class Configuration
attr_accessor :env, :user_name, :password, :debug, :verbose, :config_file
  
  def initialize( env = "dev")
    @env = env
	puts @env
	@debug = false
	@verbose = false
	@config_file = "configuration.json"
  end
  
  
  def merge(env,configs=[])
    
    # for all the configurations,
      # apply this configuration for all the properites that I care about
    configs.each do |config|
      @env = config.env
      
    end
  end
end
