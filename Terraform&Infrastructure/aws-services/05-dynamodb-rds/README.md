# AWS Databases (DynamoDB & RDS)

## DynamoDB
DynamoDB is AWS's fully managed NoSQL database service. It is very fast, flexible, and handles massive amounts of traffic easily.

- **NoSQL:** It doesn't use traditional rows, columns, or SQL queries. The data doesn't have to follow a strict structure.
- **Tables:** Like in standard databases, this is where your data is stored.
- **Items:** An item is a single record in a table (similar to a row in a relational database).
- **Attributes:** The individual data fields inside an item (similar to columns). Different items can have completely different attributes.
- **Partition Key:** A unique identifier for an item. DynamoDB uses this to divide the data across different servers to keep things fast.
- **Sort Key:** An optional second part of the primary key that lets you sort or search through data that shares the same Partition Key.
- **Use Cases:** Gaming leaderboards, shopping carts, mobile apps, and situations where you need super fast reads/writes with unstructured data.

---

## RDS (Relational Database Service)
RDS is a managed service for traditional relational databases. AWS handles the boring stuff like backups, patching, and scaling for you.

- **Relational Database:** Stores data in strict tables with rows and columns. You use SQL to interact with it.
- **Supported Engines:** You can choose between Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, and Microsoft SQL Server.
- **DB Instances:** A database instance is an isolated database environment running in the cloud.
- **Security:** You can put RDS in a private subnet, encrypt the data at rest, and use Security Groups to restrict access to only your web servers.
- **Backups:** RDS takes automatic daily backups and lets you restore to any specific second in time (up to 35 days).
- **Multi-AZ:** If you enable this, AWS creates a standby copy of your database in a different Availability Zone. If the main database crashes, it automatically switches to the standby.
- **Read Replicas:** You can create read-only copies of your database. This takes the load off your main database if your app has a lot of users reading data.
- **Use Cases:** E-commerce websites, ERP systems, financial applications, and anywhere you need complex queries and strict data relationships.
