infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_nmae)-internal.salman06.shop, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=Devops321 -e tool_name=$(tool_name)