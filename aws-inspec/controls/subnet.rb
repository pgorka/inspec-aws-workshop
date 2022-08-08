require_relative '../inputs.rb'

control 'aws-3' do
  title "Check subnet"
    describe aws_subnet(SUBNET_ID) do 
      it { should exist }
	  its('state') { should eq available }
	  its('available_ip_address_count') { should eq 250 }
	  its('availability_zone') { should eq AVAILABILITY_ZONE }
	  its('map_public_ip_on_launch') { should eq true }
	  its('map_public_ip_on_launch') { should cmp 'true' }
	  its('map_customer_owned_ip_on_launch') { should eq false }
	  its('tags') { should include('Name' => SUBNET_NAME) }
    end
	
	describe aws_subnets.where(subnet_id: SUBNET_ID) do
	  its('cidr_blocks') { should eq [SUBNET_CIDR_BLOCK] }
    end
	
    describe aws_subnets.where(vpc_id: VPC_ID) do
      its('subnet_ids') { should include SUBNET_ID }
    end
end
