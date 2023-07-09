deploy an application from a private GIT repo

---

create  a secret to access docker private registry by Application Deployment
kubectl -n app1 create secret docker-registry dockerconfigjson --docker-server="https://index.docker.io/v1/" --docker-username="..." --docker-password="..." --docker-email="...yahoo.com"

docker-registry -> type
-n app1 -> where we will create an application
