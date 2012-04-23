require_relative 'spec_helper.rb'

describe CmdOptions do

  # not sure what my subject should be...
  let(:subject) {CmdOptions}
  
  describe "#parse" do
  
    let(:expected_result) do
	##cmd_options = CmdOptions.parse(ARGV)
      Configuration.new(verbose: true, env: "qa", user_name: "dude")
	end #let expected_result
		
	# optparse in CmdOptions reads from ARGV
	ARGV = ["-v", "-e", "qa", "-u", "dude"]
	
	let(:given_result){subject.parse}
	it "should take in options on the command line and return an object" do
	  given_result.user_name.should eql(expected_result.user_name)
	  given_result.verbose.should eql(expected_result.verbose)
	  given_result.env.should eql(expected_result.env)
	end
  end # describe parse
end # describe CmdOptions