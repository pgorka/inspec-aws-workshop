require_relative '../inputs.rb'

control 'aws-1' do                                                                                                   
  title "Check EC2 instance"               # A human-readable title                                
  describe aws_ec2_instance(EC2_ID) do     # The actual test                                       
    it { should exist }                                                                                           
  end                                                                                                             
end   
