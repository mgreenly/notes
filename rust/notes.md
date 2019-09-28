# Hello Actix


  * Build a rust/actix hello world and deploy to Digital Ocean on kubernetes
  * doctl auth init -t "$TOKEN"
  * To update config `kubectl apply -f manifest.yaml'


TODO:
  decide how I want to do ingress?
    * haproxy - https://www.haproxy.com/blog/dissecting-the-haproxy-kubernetes-ingress-controller/
    * nginx
  setup default 404 page
  figure out certs on digital ocean
