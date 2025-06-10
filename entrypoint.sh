#!/bin/bash
set -e

COLLECTION="Bcar.postman_collection.json"
ENVIRONMENT="bcar.postman_environment.json"
REPORT_DIR="newman-report"

# Création du dossier de rapport
mkdir -p $REPORT_DIR

echo "===== Lancement des tests API Postman avec Newman ====="

newman run "$COLLECTION" -e "$ENVIRONMENT" -r htmlextra --reporter-htmlextra-export "$REPORT_DIR/report.html"

echo "===== Fin des tests. Rapport disponible dans $REPORT_DIR/report.html ====="
