#!/bin/bash
# Simple script to run Trivy using Docker on our images and generate a report

echo "Building images for scanning..."
docker build -t taskboard-backend:latest -f docker/backend.Dockerfile ./application/backend
docker build -t taskboard-frontend:latest -f docker/frontend.Dockerfile ./application/frontend

echo "Running SAST/SCA scanning with Trivy via Docker..."

# Scan Backend
echo "Scanning Backend Image..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity HIGH,CRITICAL taskboard-backend:latest > security/backend_scan_report.txt

# Scan Frontend
echo "Scanning Frontend Image..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity HIGH,CRITICAL taskboard-frontend:latest > security/frontend_scan_report.txt

echo "Secret Scanning..."
docker run --rm -v $(pwd):/app aquasec/trivy fs --security-checks secret /app > security/secret_scan_report.txt

echo "Scans completed. Check security/ for reports."
