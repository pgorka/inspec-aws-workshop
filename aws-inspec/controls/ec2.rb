require_relative '../inputs.rb'

control 'aws-1' do                                                                                                   
  title "Check EC2 instance"               # A human-readable title                                
  describe aws_ec2_instance(EC2_ID) do     # The actual test                                       
    it { should exist }
    it { should be_running }
    it { should_not have_roles }
    its ('state') { should eq 'running' }
    its ('state') {should be_in ['pending', 'running', 'shutting-down', 'terminated', 'stopping', 'stopped'] }
    its ('name') { should eq EC2_NAME }
    its ('instance_type') { should eq INSTANCE_TYPE }
    its ('image_id') { should match 'ami-.*' }
    its ('launch_time') { should < Time.now }
    its ('monitoring.item') { should include(state: 'disabled') }
    its ('placement.item') { should include(availability_zone: AVAILABILITY_ZONE) }
    its ('placement.item') { should include(group_name: '') }
    its ('placement.item') { should include(tenancy: 'default') }
    its ('metadata_options.item') { should include(state: 'applied') }
    its ('private_dns_name') { should match 'ip-10-0-0-.*?'+REGION+'.compute.internal'}
    its ('public_dns_name') { should match 'ec2-.*?'+REGION+'.compute.amazonaws.com'}
    its ('private_ip_address') { should match '10\.0\.0\..*?'}
    its ('security_groups') { should include(id: SECURITY_GROUP_ID, name: SECURITY_GROUP_NAME) }
    its ('vpc_id') { should eq VPC_ID }
    its ('subnet_id') { should eq SUBNET_ID }
    its ('architecture') { should eq "x86_64"}
    its ('network_interfaces.first.owner_id') { should eq OWNER_ID }
    its ('block_device_mappings.first.device_name') { should eq '/dev/xvda' }
    its ('block_device_mappings.first.ebs.delete_on_termination') { should eq true }
    its ('block_device_mappings.first.ebs.status') { should eq 'attached' }
  end                                                                                                             
end   
