deploy an application from a private GIT repo, using private Docker registry and using ArgoCD Image updater (defauld mode)

---
3 accesses are needed:
1) ArgoCD can reach a private git repo (git-secret.yaml)
2) Application Deployment can reach a private Docker repo (this doc -> below)
3) ArgoCD Image updater is able ot reach a private git repo (secret-docker-priv-registry-to-updater.yaml)

---

create  a secret to access docker private registry by Application Repo. In this case it is https://github.com/solkoff/argocd-anton-application-private-with-updater
kubectl -n dev create secret docker-registry dockerconfigjson --docker-server="https://index.docker.io/v1/" --docker-username="..." --docker-password='....' --docker-email="....yahoo.com"

docker-registry -> type
-n app1 -> where we will create an application


---