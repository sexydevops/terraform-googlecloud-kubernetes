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

Run Terraform

```
chmod +x create-env.sh && ./create-env.sh
terraform init
terraform plan
terraform apply
```

It will take time and when it finished you can see the service for the created cluster from Google Console dashboard.


## Testing
1. You can test the load balancer:
```
./test.sh
```
2. Verify response:
```
curl http://$(terraform output load-balancer-ip)
```
## Using kubectl
1. Get the cluster credentials and configure kubectl:
```
gcloud container clusters get-credentials $(terraform output cluster_name) --zone $(terraform output cluster_zone)
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
