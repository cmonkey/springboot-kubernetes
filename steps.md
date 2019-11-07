## Step

1. eval $(minikube docker-env)
2. mvn dockerfile:build -Dgit-revision=$(GIT_COMMIT)
