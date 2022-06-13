require_relative '../inputs.rb'

control 'aws-3' do
  title "Check subnet"
    describe aws_subnet(SUBNET_ID) do 
      it { should exist }
    end
    describe aws_subnets.where(vpc_id: VPC_ID) do
      its('subnet_ids') { should include SUBNET_ID }
    end
end
