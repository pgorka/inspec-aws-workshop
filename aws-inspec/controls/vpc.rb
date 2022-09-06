require_relative '../inputs.rb'

control 'aws-2' do
  title "Check VPC"
    describe aws_vpcs do 
      its('vpc_ids') { should include VPC_ID }
    end
    describe aws_vpc(VPC_ID) do 
      it  { should exist }
      it  { should_not be_default }
      its ('cidr_block') { should eq VPC_CIDR_BLOCK }
      its ('name') { should eq VPC_NAME }
      its ('state') { should eq 'available' }
      its ('instance_tenancy') { should eq 'default' }
      its ('state') { should eq 'available' }
      its ('associated_ipv6_cidr_blocks') { should be_empty }
      its ('owner_id') { should eq OWNER_ID }
      its ('tags') { should include({"Name"=>VPC_NAME}) }
      it  { should be_available }
    end
end
