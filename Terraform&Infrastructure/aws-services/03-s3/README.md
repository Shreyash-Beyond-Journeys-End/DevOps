# AWS S3 (Simple Storage Service)

## What is S3?
S3 is a cloud storage service by AWS. It is used to store and retrieve any amount of data from anywhere on the internet. It's basically an unlimited hard drive in the cloud.

## Buckets
A bucket is like a root folder in S3. You have to create a bucket before you can upload any files. The bucket name must be completely unique across all of AWS globally.

## Objects
Objects are the actual files you upload to a bucket (like images, videos, text files, backups). Each object consists of the data itself, metadata (info about the file), and a unique key (the file name).

## Storage Classes
S3 has different storage tiers depending on how often you need to access your files:
- **S3 Standard:** For frequently accessed data (like website images).
- **S3 Standard-IA (Infrequent Access):** Cheaper storage for data you don't use often but need quickly when you do.
- **S3 Glacier:** Very cheap storage for long-term backups or archives. It can take hours to retrieve data from here.

## Versioning
If you turn on versioning, S3 keeps every version of an object. If you accidentally overwrite or delete a file, you can restore the older version.

## Lifecycle Policies
These are automated rules you set up. For example, you can tell S3 to automatically move files to Glacier after 30 days, or delete them after a year to save money.

## Encryption
You can encrypt your S3 data so that if someone manages to steal it, they can't read it. S3 can handle the encryption for you automatically (Server-Side Encryption).

## Bucket Policies
These are JSON documents attached to your bucket that control who can access it. For example, you can write a policy to make the entire bucket public so anyone can view its images.

## Common Use Cases
- Storing static assets for a website (like HTML, CSS, images).
- Storing database backups.
- Hosting big datasets for data analysis.
