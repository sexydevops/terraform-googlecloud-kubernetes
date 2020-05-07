# Terraform + GKE + K8s

## Prerequisites 
### Set up the environment
1. From google cloud:

You need to create Google Cloud project, enable Compute Engine API, Kubernetes Engine API for it and write down the project_id

The second thing that you need is `gcloud`, you can download it from here https://cloud.google.com/sdk/docs/quickstarts

```
gcloud config set project ${project_id}
```
2. Configure Terraform:

Please make sure that you have Terraform installed in your server.

```
[[ $CLOUD_SHELL ]] || gcloud auth application-default login
export GOOGLE_PROJECT=$(gcloud config get-value project)
```

Running Terraform

You need to create user and pass for cluster first, here we use `openssl` to generate secure passwords
```
chmod +x create-env.sh && ./create-env.sh
```

Now you can use Terraform to provision clusters and deploy app


```

terraform init
terraform plan -auto-approve
terraform apply -auto-approve
```

It will take around 5-10 minutes and when it finished you can see the service for the created cluster from Google Console dashboard.


## Testing
1. You can test the load balancer:
```
chmod +x test.sh && ./test.sh
```
2. Verify response:
```
curl http://$(terraform output load-balancer-ip)
```
## Using kubectl
1. Get the cluster credentials and configure kubectl:
```
gcloud container clusters get-credentials $(terraform output cluster_name) --zone $(terraform output cluster_location)
```
2. Verify kubectl connectivity:
```
kubectl get pods -n staging
```
## Cleanup
1. Delete resources:
```
terraform destroy
```

# Demo
# Terraform + GKE + K8s

## Prerequisites 
### Set up the environment
1. From google cloud:

You need to create Google Cloud project, enable Compute Engine API, Kubernetes Engine API for it and write down the project_id

The second thing that you need is `gcloud`, you can download it from here https://cloud.google.com/sdk/docs/quickstarts

```
gcloud config set project ${project_id}
```
2. Configure Terraform:

Please make sure that you have Terraform installed in your server.

```
[[ $CLOUD_SHELL ]] || gcloud auth application-default login
export GOOGLE_PROJECT=$(gcloud config get-value project)
```

Running Terraform

You need to create user and pass for cluster first, here we use `openssl` to generate secure passwords
```
chmod +x create-env.sh && ./create-env.sh
```

Now you can use Terraform to provision clusters and deploy app


```

terraform init
terraform plan -auto-approve
terraform apply -auto-approve
```

It will take around 5-10 minutes and when it finished you can see the service for the created cluster from Google Console dashboard.


## Testing
1. You can test the load balancer:
```
chmod +x test.sh && ./test.sh
```
2. Verify response:
```
curl http://$(terraform output load-balancer-ip)
```
## Using kubectl
1. Get the cluster credentials and configure kubectl:
```
gcloud container clusters get-credentials $(terraform output cluster_name) --zone $(terraform output cluster_location)
```
2. Verify kubectl connectivity:
```
kubectl get pods -n staging
```
## Cleanup
1. Delete resources:
```
terraform destroy
```

# Demo
https://i.imgur.com/5Op09y4.gifiv
