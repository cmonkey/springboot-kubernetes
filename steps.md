## Step

1. eval $(minikube docker-env)
2. mvn dockerfile:build -Dgit-revision=$(GIT_COMMIT)
3. kubectl run springboot-kubernetes --image=push.com/kubernetes:0.0.1-SNAPSHOT.$(GIT_COMMIT) \
    --image-pull-policy=IfNotPresent \
    --port=8080
