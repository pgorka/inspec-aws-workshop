require_relative '../inputs.rb'

control 'aws-5' do
  title "Check routing table"
    describe aws_route_table(ROUTING_TABLE_ID) do 
      it  { should exist }
      its ('routes.count') { should eq 2 }
      its ('tags') { should include("Name" => ROUTING_TABLE_NAME) }
      its ('owner_id') { should eq OWNER_ID }
      its ('vpc_id') { should eq VPC_ID }
      its ('routes.first.destination_cidr_block') { should eq VPC_CIDR_BLOCK }
    end
	
    describe aws_route_tables do 
      it  { should exist }	
      its ('vpc_ids') { should include VPC_ID }
    end
end
