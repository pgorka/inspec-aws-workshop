require_relative '../inputs.rb'

control 'aws-5' do
  title "Check routing table"
    describe aws_route_table(ROUTING_TABLE_ID) do 
      it { should exist }
	  its('routes.count') { should eq 2 }
    end
	
    describe aws_route_tables do 
      it { should exist }	
	  its('vpc_ids') { should include VPC_ID }
    end
end
