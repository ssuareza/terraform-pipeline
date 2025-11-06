# terraform-infra-pipeline

This repository is a hands-on example for learning how to set up a pipeline using Terraform, GitHub Actions, and AWS.

It basically creates two S3 buckets:

- `dev-terraform-infra-pipeline`: if you commit changes in a "dev" branch.
- `prod-terraform-infra-pipeline`: if you merge the changes into the main branch through a pull request.

## Requirements

- Terraform v1.3+
- AWS CLI v2

## How to use it?

1. Create a new github repository with this repository code.

2. Connect GitHub Actions to actions in AWS creating an OIDC provider:
<https://medium.com/@ssuareza/use-iam-roles-to-connect-github-actions-to-aws-277ea7fe5387>

3. Create a bucket in AWS S3 to store Terraform state and locking file. For example `terraform-pipeline-123`.

4. Add the following GitHub Secrets to your repository:

- AWS_REGION: us-east-1
- ROLE_TO_ASSUME:
- AWS_STATEFILE_S3_BUCKET: terraform-pipeline-123

5. Test it by pushing to the "dev" branch. When you're ready to test it in production, just open a pull request and merge your changes.
