deploy an application from a private GIT repo

---

create  a secret to access docker private registry:
kubectl -n app1 create secret docker-registry dockerconfigjson --docker-server="https://index.docker.io/v1/" --docker-username="..." --docker-password="..." --docker-email="...yahoo.com"