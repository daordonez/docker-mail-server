# Docker Mail Server
This repo is intended for learning purposes, based on the Docker Mail Server project described at:

🗂️ Repo: [Docker Mail Server](https://github.com/docker-mailserver/docker-mailserver)  
📖 Docs: [DMS Docs](https://docker-mailserver.github.io/docker-mailserver/latest/)

## Description

Deploy an SMTP relay in a Docker container based on the DMS image. All the underlying infrastructure, such as the Docker host and the necessary resources to run the service, are managed via Infrastructure as Code (IaC) using Terraform. The deployment is meant to be on Azure.

The key point of this learning project is to avoid using PaaS services and focus on learning how to manage a Docker host and other resources through Terraform deployments.

## Tech Stack

This project uses the following technologies:

- 🐳 **Docker**: For creating and managing containers.
- 💾 **Docker Mail Server (DMS)**: A Docker image to set up a full-featured mail server.
- 🧑‍💻 **Terraform**: To define and manage infrastructure as code (IaC).
- ☁️ **Microsoft Azure**: Cloud provider
- 🛠️ **SMTP**: Protocol used for sending emails
