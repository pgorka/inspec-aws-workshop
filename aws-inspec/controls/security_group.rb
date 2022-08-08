require_relative '../inputs.rb'

control 'aws-4' do
  title "Check security group"
    describe aws_security_groups.where(vpc_id: VPC_ID) do
      its('group_ids') { should include(SECURITY_GROUP_ID) }
    end		
	
    describe aws_security_group(SECURITY_GROUP_ID) do 
      it { should exist }
	  its('group_name') { should eq SECURITY_GROUP_NAME }
    end
	
	describe aws_security_groups do
          its('entries.count') { should be <= MAX_NUMBER_OF_SECURITY_GROUPS }
    end
end
