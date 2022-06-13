require_relative '../inputs.rb'

control 'aws-4' do
  title "Check security group"
    describe aws_security_groups.where(vpc_id: VPC_ID) do
      its('group_ids') { should include(SECURITY_GROUP_ID) }
    end		
    describe aws_security_group(SECURITY_GROUP_ID) do 
      it { should exist }
    end
end
