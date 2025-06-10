@echo off
SET COLLECTION=Bcar.postman_collection.json
SET ENVIRONMENT=bcar.postman_environment.json
SET REPORT_DIR=newman-report

IF NOT EXIST %REPORT_DIR% (
    mkdir %REPORT_DIR%
)

echo ===== Lancement des tests API Postman avec Newman =====

newman run "%COLLECTION%" -e "%ENVIRONMENT%" -r htmlextra --reporter-htmlextra-export "%REPORT_DIR%\\report.html"

echo ===== Fin des tests. Rapport disponible dans %REPORT_DIR%\\report.html =====
