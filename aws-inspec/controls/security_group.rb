require_relative '../inputs.rb'

control 'aws-4' do
  title "Check security group"
    describe aws_security_groups.where(vpc_id: VPC_ID) do
      its('group_ids') { should include(SECURITY_GROUP_ID) }
    end		
	
    describe aws_security_group(SECURITY_GROUP_ID) do 
      it  { should exist }
      its ('group_name') { should eq SECURITY_GROUP_NAME }
      its ('vpc_id') { should eq VPC_ID }
      its ('description') { should cmp 'security group defines security rules for ingress & egress traffic' }
      its ('inbound_rules.count') { should eq 2 }
      its ('outbound_rules.count') { should eq 1 }
      it  { should allow_in(ipv4_range: '0.0.0.0/0') }
      it  { should allow_out(port: 'all', ipv4_range: '0.0.0.0/0', protocol: 'all') }
      its ('tags') { should include("Name" => SECURITY_GROUP_NAME) }
    end
	
	describe aws_security_groups do
          its('entries.count') { should be <= MAX_NUMBER_OF_SECURITY_GROUPS }
    end
end
