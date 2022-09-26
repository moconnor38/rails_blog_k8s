# README
A Ruby on Rails blog orhestrated with Kubernetes. Deployed to a Google Cloud environment.

Deployment is automated with a GitHub actions pipeline. Images are pushed to DockerHub.

## Aims

- Containerise a Ruby on Rails app and orchestrate containers with Kubernetes 

- Develop a CI/CD pipeline to build, test and deploy the app using GitHub actions

- Use Terraform to provision infrastructure


# Deployment
The GitHub action pipeline is triggered on push to the main branch.

## Requirements
- A [Google Cloud](https://cloud.google.com) account

- DockerHub account

- GitHub account

## Prerequisites
- Create a [project](https://cloud.google.com/docs/overview#projects)

- Create a [bucket](https://cloud.google.com/storage/docs/creating-buckets) for storing tfstate

- Create a [service account](https://cloud.google.com/iam/docs/service-accounts) with necessary permissions (Storage Object Admin....)

Recreate Rails credentials...

## Pipeline Variables
Set bucket name in terraform/backend.tf

Create and set GitHub [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for

- DockerHub username and access token

- $GKE_PROJECT_ID, $GKE_CLUSTER_NAME ($GKE_PROJECT_ID-gke)

- Add the service account access key to $GKE_SA_KEY


## Kubernetes Secrets

Kubernetes secrets managed with [External Secrets](https://external-secrets.io)...



---
## Run Locally

[Docker](https://docs.docker.com/get-docker/) (or [podman](https://podman.io/)) and docker-compose needed

`docker-compose up`


