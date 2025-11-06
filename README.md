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

3. Add the following GitHub Secrets to your repository:
- AWS_REGION: us-east-1
- 
3. Create a bucket in AWS S3 to store Terraform state and locking file. For example `terraform-pipeline-123`.

4. Test it by pushing to the "dev" branch. When you're ready to test it in production, just open a pull request and merge your changes.

## Destroy

You can remove all the Terraform created resources by editing the `terraform/destroy.json` file. Set the value to "true" and commit your changes.

## Reference

<https://github.com/brunograna/terraform-infra-pipeline>

## Notes

With S3-native state locking, we no longer need DynamoDB for state locking. Instead, we use a lock file directly within the S3 bucket. This approach requires fewer resources to deploy and reduces the IAM permissions required for accessing Terraform state, as managing a DynamoDB table is no longer necessary.

This new feature simplifies the setup process for new AWS technicians, as the lock files stored in S3 will resemble local Terraform state files, making it easier to understand and manage.
