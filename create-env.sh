#!/bin/bash

cat > terraform.tfvars <<EOF 
gke_username = "admin" 
gke_password = "$(openssl rand -base64 16)" 
EOF
