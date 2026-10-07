# AWS EC2 (Elastic Compute Cloud)

## What is EC2?
EC2 provides virtual servers (called instances) in the AWS cloud. It lets you rent computer power so you can run your applications without having to buy physical hardware.

## AMI (Amazon Machine Image)
An AMI is a template for your EC2 instance. It contains the operating system (like Ubuntu, Windows, or Amazon Linux) and any pre-installed software you need to start the server.

## Instance Types
EC2 comes in different sizes and types depending on what you need. Some have a lot of memory (RAM), some have fast processors (CPU), and some have extra storage. Examples are `t2.micro` (good for testing) or `m5.large`.

## Key Pairs
A Key Pair is a set of security keys (a public key and a private key). You use the private key to securely log into (SSH) your EC2 instance. Without it, you can't get in!

## Security Groups
Think of a Security Group as a virtual firewall for your EC2 instance. It controls what traffic is allowed to go in (Inbound) and out (Outbound). For example, you might only allow HTTP traffic on port 80.

## EBS (Elastic Block Store)
EBS is the virtual hard drive attached to your EC2 instance. It stores your operating system and data. If you stop the instance, the data on the EBS volume is still saved.

## Public vs Private IP
- **Public IP:** Can be reached from the internet. You use this to access a web server from your home computer.
- **Private IP:** Only reachable from inside the AWS network. Used for servers that shouldn't be directly on the internet (like a database).

## Instance Lifecycle
The different states an EC2 instance can be in:
- **Pending:** Starting up.
- **Running:** It's on and working.
- **Stopping:** Shutting down normally (you don't pay for compute time while stopped).
- **Terminated:** Permanently deleted. You can't get it back.

## Common Use Cases
- Hosting a website or web application.
- Running batch processing jobs.
- Setting up a temporary server for testing code.
