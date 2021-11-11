# packer-terraform-ansible-example

## Reference Docs

https://www.packer.io/docs
https://docs.ansible.com/ansible-core/devel/index.html
https://www.youtube.com/watch?v=vOV74gevFgs (How to packer an ami video)
https://www.packer.io/docs/provisioners/ansible/ansible
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function

## Alter the packer file

- Remove the source source_ami_filter block
- (video) Add a source_ami like in the video we watched.
- (video) Log into your AWS account and choose a source AMI to add to this field
- Add a Variable called playbook_file with a default value of "playbook.yml"
- Add an Ansible Provisioner by checking the Packer Documentation.  
   Use the variable as the playbook_file value. Look at the existing provisioners and decide the best place for the ansible provisioner to go.
- Add "ansible_env_vars" to the packer provisioner of ansible
- Add the 2 env variables with dummy values AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
- Add one thing not mentioned so far.

## Alter the Ansible file

- Change the Ansible playbook name to your choosing
- Research how to install git using Ansible and apt. Add it to the Ansible playbook
- Learn how to install multiple apt packages using the 'loop' config. Change the playbook to loop through adding all apt packages.
- Add one thing not mentioned so far.

## Alter the Terraform file

- Change the ami to the name of your ami (found in packer)
- Add a CreatedBy variable
- Add a CreatedBy tag to the instance using your new variable
- The hello_lambda function/resource is missing a role and a handler. see if you can add them
- Add one thing not mentioned so far.
