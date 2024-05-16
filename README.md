# Multi-Tier Architecture on AWS using Terraform
Deploy a scalable and resilient multi-tier architecture on AWS using Terraform.

# Architecture Diagram

![image](https://github.com/EKechei/Botcamp/assets/128794751/e4d31635-0ef9-480a-ab45-14189257d590)

# Overview
This project allows you to deploy a highly available, scalable, and secure multi-tier architecture on AWS using Terraform. The architecture consists of the following three tiers:
1. **Web Tier**: This tier handles incoming user requests and can be horizontally scaled for increased capacity. It includes web servers and a load balancer for distributing traffic.
2. **Application Tier**:  Application servers run the business logic and interact with the database tier. They can also be horizontally scaled to meet demand.
3. **Database Tier**: The database stores and manages the application data. We are using Amazon RDS for a managed database service in this architecture.

## Table of Contents
* [Features](#features)
* [Web Tier](#web-tier)
* [Application Tier](#application-tier)
* [Database Tier](#database-tier)
  
## Features <a id="features"></a>

- **High Availability**: The architecture is designed for fault tolerance and redundancy.
- **Scalability**: Easily scale the web and application tiers to handle varying workloads.
- **Security**: Security groups and network ACLs are configured to ensure a secure environment.

## Web Tier <a id="web-tier"></a>

The Web Tier includes:

- **Load Balancer**: Distributes traffic across multiple web servers.
- **Auto Scaling**: Automatically adjusts the number of web servers based on traffic.
- **Security Groups**: Controls incoming and outgoing traffic to the web servers.

## Application Tier <a id="application-tier"></a>

The Application Tier hosts the application servers responsible for running business logic and interacting with the database tier. Key components include:

- **Application Servers**: These run your application code and can be horizontally scaled.
- **Load Balancer**: Distributes traffic to the application servers.
- **Auto Scaling**: Automatically adjusts the number of web servers based on traffic.
- **Security Groups**: Controls incoming and outgoing traffic to the application servers.

## Database Tier <a id="database-tier"></a>

The Database Tier stores and manages our application data. We use Amazon RDS for a managed database service. Key components include:

- **Amazon RDS**: A managed database service for MySQL/PostgreSQL/SQL Server databases.
- **Security Groups**: Control incoming and outgoing traffic to the database.

## Deployment

1. Initialize Terraform and apply the configuration:
   ```
   terraform init
   ```
   ```
   terraform plan
   ```
   ```
   terraform apply
   ```
