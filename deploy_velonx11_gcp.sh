#!/bin/bash
gcloud config set project your-gcp-project-id
docker build -t gcr.io/your-gcp-project-id/velon-backend:latest -f Dockerfile.backend .
docker push gcr.io/your-gcp-project-id/velon-backend:latest
docker build -t gcr.io/your-gcp-project-id/velon-frontend:latest -f Dockerfile.frontend .
docker push gcr.io/your-gcp-project-id/velon-frontend:latest
gcloud run deploy velon-backend --image gcr.io/your-gcp-project-id/velon-backend:latest --region us-central1 --platform managed --allow-unauthenticated --port 3001
gcloud run deploy velon-frontend --image gcr.io/your-gcp-project-id/velon-frontend:latest --region us-central1 --platform managed --allow-unauthenticated
