require_relative '../inputs.rb'

control 'aws-5' do
  title "Check routing table"
    describe aws_route_table(ROUTE_TABLE_ID) do 
      it { should exist }
    end
end
