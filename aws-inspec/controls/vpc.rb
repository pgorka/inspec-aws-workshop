require_relative '../inputs.rb'

control 'aws-2' do
  title "Check VPC"
    describe aws_vpcs do 
      its('vpc_ids') { should include VPC_ID }
     # its('tags') { should include ('Name' => VPC_NAME) }
    end
    describe aws_vpc(VPC_ID) do 
      it { should exist }
      it { should_not be_default }
      its('cidr_block') { should eq VPC_CIDR_BLOCK }
      its('state') { should eq 'available' }
      its('owner_id') { should eq OWNER_ID }
    end
end
