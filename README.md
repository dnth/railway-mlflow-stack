# Deploy and Host MLflow on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/mlflow?referralCode=IFlm92&utm_medium=integration&utm_source=template&utm_campaign=generic)

MLflow is the open-source standard for managing the machine learning lifecycle. It handles experiment tracking, model packaging, and deployment with a mix of online services and local Python tooling. By standardizing workflows across tools and frameworks, MLflow makes collaboration, reproducibility, and scaling ML systems easier in both research and production environments.

## About Hosting MLflow

This template provides MLflow preconfigured with:

- **Caddy** for authentication and reverse proxying
- **MinIO** for artifact storage
- **PostgreSQL** for backend storage

all deployable in a single click on Railway!

Once the services are healthy, configure your local environment with the Railway-generated username and password, and you’re ready to build production-ready ML/AI systems.

This template is based on MLflow’s guide for [Remote Experiment Tracking with MLflow Tracking Server](https://mlflow.org/docs/latest/ml/tracking/tutorials/remote-server/), which outlines how to remotely access the MLflow artifact store, backend store, and shared tracking server; overall making collaboration across your ML/AI teams seamless.

## Common Use Cases

This template enables a comprehensive set of MLOps usecases:

- **Track and compare experiments**: Log parameters, metrics, and outputs from every training run. Quickly compare results to see which models perform best and why.
- **Centralized artifact storage**: Store models, plots, logs, and other outputs in MinIO, making them easy to retrieve, share, and keep organized.
- **Manage model lifecycles**: Use the model registry to version, annotate, and promote models from experimentation through staging and into production.
- **Keep data reproducible**: Record dataset versions or URIs so you always know exactly which data was used to train a model—even if the raw data itself lives elsewhere.
- **Package models for reuse**: Automatically capture dependencies and package models into portable formats like Docker images or Conda environments, ensuring consistent results everywhere.
- **Deploy models with ease**: Serve trained models locally or via Docker containers that you can push up to a registry, and deploy back to Railway!

## Dependencies for MLflow Hosting

The Railway template includes all required dependencies:

- a Caddy HTTP Gateway / Reverse proxy that provides authentication and HTTP logging.
- an MLflow "tracking" server that acts as a primary API connects everything together.
- a PostgreSQL database which acts as an MLflow Backend Store.
- a MinIO S3 compatible file store which acts as an MLflow Artifact Store.

### Deployment Dependencies

The MLflow documentation is crucial for understanding how to best utilize all of the great tooling MLflow provides. Here are some links to get you started:

- [Getting started with ML](https://MLflow.org/docs/latest/ml/getting-started/): a getting started guide for MLOps on MLflow.
- [Getting Started with GenAI](https://MLflow.org/docs/latest/genai/getting-started/): a getting started guide for LLMOps on MLflow.
- [MLflow v3](https://MLflow.org/docs/latest/genai/MLflow-3): release notes for the latest major release of MLflow.

### Implementation Details

#### Quick start guide

1. Click "Deploy on Railway" and optionally set a custom username on the caddy service.
2. Wait 3-5 minutes for deployment, then access your MLflow tracking UI via the auto-generated URL on the caddy service.
3. Login with your username and the auto-generated password.
4. Look around in the UI and optionally create some experiments/models for use later.
5. Setup your local development environment and start using your new MLflow setup!

To make step 4 easier, I've put together [a minimal example of a development environment](https://github.com/MykalMachon/railway-mlflow-stack/tree/main/mlflow-examples) that is tested and validated against this template.

#### Environment variables

The only environment variables you'll want to mess around with are:

| Variable       | Service | Description                     | Default         |
|----------------|---------|---------------------------------|-----------------|
| `AUTH_USERNAME` | Caddy   | Your basic authentication username | `admin`         |
| `AUTH_PASSWORD` | Caddy   | Your basic authentication password | Auto-generated  |
| `MLFLOW_VERSION` | MLflow   | The version of MLflow you want to deploy | N/A (defaults to 3.14.0)  |

#### Version Control

If you'd like to lock your install to a newer / older version, you can pin the version of MLflow you'd like to deploy by setting an environment variable (`MLFLOW_VERSION`) on the MLflow Service. by default the template uses **3.14.0**.

#### Authentication via Caddy

MLflow’s built-in authentication features are still experimental and are not recommended for a production environment.

With that in mind, this template uses **Caddy** as a reverse proxy with basic authentication. This follows MLflow’s best practices for production deployments and is fully supported by MLflow’s Python tooling.

For an example of authenticating with this service via MLflow's python SDK [see this example development environmnet](https://github.com/MykalMachon/railway-mlflow-stack/tree/main/mlflow-examples).

#### Extending the default MLflow Dockerfile

The default MLflow Dockerfile ships with only the essentials.

This template extends that image and applies MLflow’s recommended best practices, making the deployment both 1-click ready and extensible for your future needs.

#### Deploying your MLflow trained models on Railway

You can deploy trained MLflow models directly to Railway: 

1. [Use MLflow to build a docker image from your trained model](https://mlflow.org/docs/latest/api_reference/cli.html#mlflow-models-build-docker).
2. Push the image to your preferred container registry.
3. Follow Railway's guide to deploy Docker images; [public](https://docs.railway.com/guides/services#deploying-a-public-docker-image) or [private](https://docs.railway.com/guides/services#deploying-a-private-docker-image).

For more details check the [MLflow Serving docs](https://mlflow.org/docs/latest/ml/deployment/) and [their guide on deploying to Kubernetes](https://mlflow.org/docs/latest/ml/deployment/deploy-model-to-kubernetes/).

_With a little bit of custom automation code, you could use this template as the core of an MLOps deployment pipeline!_

## Why Deploy MLflow on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying MLflow on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.

This setup is designed to be extensible. You can layer in CI/CD pipelines, automated model promotion, or connect it with orchestration tools like Airflow or Prefect.