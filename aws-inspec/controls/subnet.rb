require_relative '../inputs.rb'

control 'aws-3' do
  title "Check subnet"
    describe aws_subnet(SUBNET_ID) do 
      it  { should exist }
      it  { should be_available }
      its ('state') { should eq 'available' }
      its ('available_ip_address_count') { should eq SUBNET_IP_ADDRESS_COUNT - 5 } # AWS reserves 5
      its ('availability_zone') { should eq AVAILABILITY_ZONE }
      its ('availability_zone_id') { should eq AVAILABILITY_ZONE_ID }
      its ('map_public_ip_on_launch') { should eq true }
      its ('map_public_ip_on_launch') { should cmp 'true' }
      its ('map_customer_owned_ip_on_launch') { should eq false }
      its ('tags') { should include('Name' => SUBNET_NAME) }
      its ('vpc_id') { should eq VPC_ID }
      its ('cidr_block') { should eq SUBNET_CIDR_BLOCK }
      its ('ipv_6_cidr_block_association_set') { should eq [] }
      its ('owner_id') { should eq OWNER_ID }
      its ('private_dns_name_options_on_launch.hostname_type') { should eq "ip-name" }
      its ('private_dns_name_options_on_launch.enable_resource_name_dns_a_record') { should eq false }
      its ('private_dns_name_options_on_launch.enable_resource_name_dns_aaaa_record') { should eq false }
      it  { should be_mapping_public_ip_on_launch }
      it  { should_not be_default_for_az }
      it  { should_not be_assigning_ipv_6_address_on_creation }
    end
	
    describe aws_subnets.where(subnet_id: SUBNET_ID) do
      its ('cidr_blocks') { should eq [SUBNET_CIDR_BLOCK] }
    end
	
    describe aws_subnets.where(vpc_id: VPC_ID) do
      its ('subnet_ids') { should include SUBNET_ID }
    end
end
