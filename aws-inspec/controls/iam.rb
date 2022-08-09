require_relative '../inputs.rb'

control 'aws-7' do
  title "Check IAM"
  describe aws_iam_user(user_name: USER_NAME) do
    it  { should exist }
    it  { should_not have_mfa_enabled }
    it  { should have_console_password }
    its ('has_mfa_enabled') { should eq false }
    its ('has_console_password') { should eq true }
    its ('user_arn') { should match 'arn:aws:iam::964192034037:user/'+USER_NAME }
    its ('attached_policy_arns.first') {should eq 'arn:aws:iam::aws:policy/IAMUserChangePassword' }
    its ('attached_policy_names.first') {should eq 'IAMUserChangePassword'}
  end
end
