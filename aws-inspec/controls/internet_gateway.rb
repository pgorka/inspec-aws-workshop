require_relative '../inputs.rb'

control 'aws-6' do
  title "Check Internet gateway"
    describe aws_internet_gateway(id: INTERNET_GATEWAY_ID) do
      it { should exist }
	  its('tags') { should include('Name' => INTERNET_GATEWAY_NAME) }
    end
end
