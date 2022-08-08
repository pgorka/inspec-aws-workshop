Basic setup for InSpec tests in AWS

**Preconditions**
Export your AWS credentials as environment variables
```bash
# Example configuration
export AWS_ACCESS_KEY_ID="AKIAJUMP347SLS66IGCQ"
export AWS_SECRET_ACCESS_KEY="vD2lfoNvPdwsofqyuO9jRuWUkZIMqisdfeFmkHTy7ON+w"
export AWS_REGION="eu-west-3"
```
**Configuration**
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
4. Install inspec
```bash
sudo su
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```
5. Launch initial-tests
```bash
inspec exec aws-inspec -t aws://
```