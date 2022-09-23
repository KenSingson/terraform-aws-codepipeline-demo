validate:
	terraform init
	terraform validate
	terraform plan

create:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

clean:
	rm -rf .terraform
	rm -rf .terraform.*
	rm -rf terraform.tfstate*
	rm -rf backup/

.PHONY: validate create destroy clean