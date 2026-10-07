# AWS IAM (Identity and Access Management)

## What is IAM?
IAM is a free AWS service that helps you securely control access to your AWS resources. It basically lets you manage "who" can access "what".

## Users
A User is a person or an application that needs to interact with AWS. Each user gets their own login credentials (like a password for the console or access keys for the CLI).

## Groups
A Group is just a collection of IAM users. It makes life easier because you can give permissions to the group, and all users inside it automatically get those same permissions. 

## Roles
A Role is like a user, but it doesn't have permanent passwords or keys. Instead, it can be temporarily assumed by people, AWS services (like EC2), or applications to get permissions for a short time.

## Policies
Policies are JSON documents that define what actions are allowed or denied. You attach these to Users, Groups, or Roles.

## Permissions
Permissions are the actual rules inside a policy (e.g., "Allow reading S3 buckets" or "Deny deleting EC2 instances").

## Least Privilege
This is a very important security rule: only give someone the exact minimum permissions they need to do their job, and nothing more. If they only need to read a file, don't give them delete access!

## IAM Best Practices
- Never use the root account for everyday tasks.
- Turn on MFA (Multi-Factor Authentication) for all users.
- Use Groups to assign permissions instead of giving them to individual users.
- Follow the rule of Least Privilege.
- Rotate access keys regularly.

## Common Use Cases
- Giving a new employee a login to the AWS console with limited access.
- Allowing an EC2 server to read files from an S3 bucket (using a Role).
- Setting up temporary access for a third-party app.
