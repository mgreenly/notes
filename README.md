# Notes

This is a collection of [HOWTOs](https://github.com/mgreenly/notes/tree/master/docs/howtos) and [cheatsheets](https://github.com/mgreenly/notes/tree/master/docs/cheatsheets) 
as well as a [personal journal](https://github.com/mgreenly/notes/tree/master/docs/journal).

Some topics you're likely to see here are Kubernetes, Rust, Ruby and Devops stuff.

### TODO

  Figure out ingress for k8s on GCP.

  Figure out the CI/CD pipeline for GCP

    * cloud source
    * cloud build
    * container registry
    * deployment manager

  Learn about persistent storage options for k8s clusters in GCP


  13:21



gcloud

Know what organization you're in
$> gcloud organizations list
$> gcloud projects list

    > logic-refinery-com


create production cluster

# CLI
$> gcloud config set project logic-refinery-com
$> gcloud container clusters get-credentials production

# see context name
$> kubectl config get-contexts


instlal haproxy
kubectl apply -f https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml






kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml


kubectl apply -f nginx-ingress.yaml
kubectl get svc -n ingress-nginx


https://devopscube.com/setup-ingress-kubernetes-nginx-controller/


kubectl logs -n ingress-nginx -f nginx-ingress-controller-74bc96d59d-qh42r


gcloud container clusters update production --update-addons HttpLoadBalancing=DISABLED

https://github.com/kubernetes/ingress-gce/blob/master/docs/faq/gce.md#how-do-i-disable-the-gce-ingress-controller

