# Basic setup for InSpec tests in AWS

**Preconditions**
Configure your AWS credentials
```bash
sudo su
aws configure
```
Example configuration:
AWS Access Key ID [None]: AKIAJUMP347SLS66IGCQ
AWS Secret Access Key [None]: vD2lfoNvPdwsofqyuO9jRuWUkZIMqisdfeFmkHTy7ON+w
Default region name [None]: eu-west-2
Default output format [None]: json

**Setup**
1. Clone [inspec-aws-workshop](https://github.com/pgorka/inspec-aws-workshop "inspec-aws-workshop") repository into your user's home directory (/home/username)
2. Open inspec-aws-workshop directory
```bash
cd inspec-aws-workshop
```
and checkout initial-tests branch
```bash
git checkout initial_tests
```
3. Open aws-inspec directory
```bash
cd aws-inspec
```
and modify the inputs.rb file using a text editor of choice.
Fill in the values for the keys present in the file.
```bash
# Example
vim inputs.rb
```
4. Install inspec
```bash
sudo su
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```
5. Launch initial-tests
```bash
inspec exec aws-inspec -t aws://
```