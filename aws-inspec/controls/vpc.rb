require_relative '../inputs.rb'

control 'aws-2' do
  title "Check VPC"
    describe aws_vpcs do 
      its('vpc_ids') { should include VPC_ID }
    end
    describe aws_vpc(VPC_ID) do 
      it { should exist }
    end
end

