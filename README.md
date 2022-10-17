# README

A Ruby on Rails/PostgreSQL blog. Deployment to a Google Cloud environment is automated via a GitHub actions pipeline. 
The containers are managed with Kubernetes and the infrastructure provisioned with Terraform.

## Aims

- Containerise a Ruby on Rails app and orchestrate the containers with Kubernetes 

- Develop a CI/CD pipeline to build, test and deploy the app using GitHub actions

- Use Terraform to provision infrastructure

## Pipeline and Deploylment

The pipeline is triggered on push to the main branch and:

- checks code quality
- runs RSpec unit tests
- scans for security vulnerbilities
- builds and bushes container images to DockerHub
- provisions infrastucture if needed
- deploys to a GKE cluster

# Usage

## Requirements

The following accounts are needed:
- [Google Cloud](https://cloud.google.com) account

- [DockerHub](https://hub.docker.com) account

- [GitHub](https://github.com/) account

### Prerequisites

Prepare your Google Cloud environment by creating a:
- [Google cloud project](https://cloud.google.com/docs/overview#projects)

- [Google cloud bucket](https://cloud.google.com/storage/docs/creating-buckets)

- [Service account](https://cloud.google.com/iam/docs/service-accounts)

The bucket is used to store the terraform state remotely. Make sure the service account has the necessary permissions (Storage Object Admin, Compute Network Admin, Kubernetes Engine Admin)


### Terraform Variables

- Create a terraform.tfvars file in /terraform and set your Google cloud project id and region. See terraform/sample.tfvars for an example.

- Set your bucket name in terraform/backend.tf

### Pipeline Variables

Create and set GitHub [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for

- DockerHub username and access token

- $GKE_PROJECT_ID, $GKE_CLUSTER_NAME ($GKE_PROJECT_ID-gke)

- Add the service account access key to $GKE_SA_KEY


### Kubernetes Secrets

Kubernetes secrets are managed with [External Secrets](https://external-secrets.io)

---
## Run Locally

[Docker](https://docs.docker.com/get-docker/) (or [podman](https://podman.io/)) and docker-compose needed

`docker-compose up`


