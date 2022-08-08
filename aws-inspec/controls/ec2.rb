require_relative '../inputs.rb'

control 'aws-1' do                                                                                                   
  title "Check EC2 instance"               # A human-readable title                                
  describe aws_ec2_instance(EC2_ID) do     # The actual test                                       
    it { should exist }
    it { should be_running }
	its ('state') { should eq 'running' }
	its ('instance_type') { should eq INSTANCE_TYPE )
	its ('image_id') { should match 'ami-.*' }
	its ('key_name') { should eq SSH_KEY_NAME }
	its ('launch_time') { should < Time.now }
	its ('monitoring.item') { should include(state: 'disabled') }
	its ('placement.item') { should include(availability_zone: AVAILABILITY_ZONE) }
	its ('placement.item') { should include(group_name: '') }
	its ('placement.item') { should include(tenancy: 'default') }
	its ('private_dns_name') { should match '.*?'REGION'.compute.internal'}
	its ('private_ip_address') { should match '10\.0\.0\..*?'}
	its ('security_groups') { should include(id: SECURITY_GROUP_ID, name: SECURITY_GROUP_NAME) }
	its ('vpc_id') { should eq VPC_ID }
	
  end                                                                                                             
end   
