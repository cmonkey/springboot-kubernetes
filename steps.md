## Step

1. minikube start
2. eval $(minikube docker-env)
3. mvn dockerfile:build -Dgit-revision=$(GIT_COMMIT)
4. kubectl run springboot-kubernetes --image=push.com/kubernetes:0.0.1-SNAPSHOT.$(GIT_COMMIT) \
    --image-pull-policy=IfNotPresent \
    --port=8080

5. kubectl expose deployment springboot-kubernetes --port=8080 --target-port=8080 --type=NodePort
6. kubectl describe service springboot-kubernetes
7. minikube service springboot-kubernetes --url=true
8. curl $(minikube service springboot-kubernetes --url=true)/v1/home |jq

