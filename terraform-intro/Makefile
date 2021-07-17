

tf_init:
	@echo "Initilize terraform to install plugins..."
	cd ops/terraform && terraform init

tf_plan:
	@echo "Previewing changes that will be made to match your config..."
	cd ops/terraform && terraform plan -var-file='.tfvars'

tf_apply:
	@echo "Applying planned changes.."
	cd ops/terraform && terraform apply -var-file='.tfvars'

tf_destroy:
	@echo "Destroying your infrastructure.."
	cd ops/terraform && terraform destroy -var-file='.tfvars'