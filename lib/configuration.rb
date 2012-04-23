class Configuration
attr_accessor :env, :user_name, :password, :debug, :verbose, :config_file
  
  def initialize(args)
    args.each do |key,value|
	  send "#{key}=", value
	end
    #pp "initialize args are: #{args}"
    ##@env = args['env']|| "dev"
	#self.send "env=", args['env']
	#@debug = args['debug'] || false
	#@verbose = args['verbose'] || false
	#@config_file = args['config_file'] || "configuration.json"
	##@user_name = args['user_name']
	#self.send "user_name=", args['user_name']
  end
  
  
  def merge!(env,config_obj)
    puts "@env is #{@env}"
	env ||= @env
    puts "hi! env = #{env}, obj is #{config_obj.send(env)}"
    # for all the configurations,
      # apply this configuration for all the properites that I care about
    #configs.each do |config|
     # @env = config.env
      
    #end
  end
end
