# AWS VPC (Virtual Private Cloud)

## What is VPC?
A VPC is your own private, isolated section of the AWS cloud. It’s like having your own virtual data center where you can launch AWS resources like EC2 instances in a network that you control.

## CIDR (Classless Inter-Domain Routing)
CIDR is a way to allocate IP addresses. When you create a VPC, you give it a CIDR block (like `10.0.0.0/16`), which determines how many IP addresses are available inside your network.

## Subnets
A subnet is a smaller piece of your VPC's IP range. It helps you organize your resources. A subnet always lives inside a specific Availability Zone.

## Route Tables
A route table is a set of rules (routes) that determine where network traffic from your subnet is allowed to go.

## Internet Gateway (IGW)
An IGW is a component you attach to your VPC to connect it to the internet. Without it, resources inside your VPC cannot talk to the outside world.

## NAT Gateway
A NAT Gateway allows instances in a private subnet to connect to the internet (for example, to download software updates) without letting the internet connect back to them.

## Security Groups
Security Groups act as a firewall at the **instance level**. They check traffic going in and out of an EC2 instance. (They only have "allow" rules).

## Network ACLs (NACLs)
NACLs act as a firewall at the **subnet level**. They check traffic entering or leaving a whole subnet. (They can have both "allow" and "deny" rules).

## Public vs Private Subnet
- **Public Subnet:** A subnet that has a route to the Internet Gateway. Things placed here (like web servers) can be reached from the internet.
- **Private Subnet:** A subnet that does not have a route to the Internet Gateway. Things placed here (like databases) are hidden from the internet and are more secure.
