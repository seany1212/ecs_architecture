# ECS Reworked Architecture
## Brief
The terraform code included in this repo is an initial start at building a product environment that would utilized ECS microservices to connect to RDS instances, send and receive both messages and notifications using SQS and SNS, as well as dynamically scaling based on traffic requirement as part of the practice scenario.

Due to restricted time there are components in this that are incomplete, and will be discussed in this README the additional process that would be taken to finish the product development.

## Improvements
### Code Completion
There are additional terraform code files that would cover SQS, SNS, WAF, Application Load Balancer with Target Groups and Security Groups just to name a few. These would utilize public AWS modules in instances where the services requirements are generic, or where team sizes for maintaining custom modules are not viable, additionally pinned to an initial version. For custom resources, modules can be created for these requirements.

### Environment Variables
Converting the majority of fixed values in the terraform files into variables that can be processed through a variable.tfvars file at run time. This will allow for easy duplication of additional environments and could also allow for setup in a CD pipeline for control.

### CDN Deployment
Depending on distribution of the product, a CDN can be utilized to minimize frontend/backend resource requirement by offloading repetitive non-sensitive data/static files at an edge node of the CDN network. This should additionally improve load time from a latency perspective.

### WAF and Shield
Configuring WAF and Shield deployment to cover exposure of services and protection in front of the CDN network. Mitigating attacks with AWS' DDOS protection and Bot detection, as well as reduce any targetted attacks with rate limits based on the requirements of the endpoints/services.

### RDS Configuration
Due to the nature of data being stored in RDS, ensuring that RDS is configured to use both encryption at rest as well as encryption in transit when dealing with requires from the microservices.
