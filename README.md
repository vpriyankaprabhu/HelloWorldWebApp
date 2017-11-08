
This repository contains a Proof of Concept for a CI/CD using Wercker for a simple Java Web application.

**Overview**

```

1) Create a Java Web Application for deployment on Weblogic Server

2) Add wercker.yml file to the project created 
   -> wercker.yml file is a entrypoint for wercker CI/CD to work for your application.

3) Create a Wercker application, define workflow for CI/CD integration on Java Web Application.
   Hook up/chain pipelines to define workflows in given in wercker.yml file.
   
4) Wercker workflow gets triggered for every git push(as defined in build pipeline).
   Wercker workflow will compile, build application artifacts, copy artifacts for execution, 
   Push the maven created image to repository & deploy Web app on Weblogic server using Kubernetes.
   
5) GCE is used for deployment of web application on weblogic server using kubernetes.
   In GCE we need to create contain clusters for the kubernetes deployment of application.
   
```

**Create Secret to be used for pulling WebLogic image from registry**
```

kubectl create secret docker-registry gcr-web-secret --docker-server=docker.io \
--docker-username=YOUR_USERNAME --docker-password=YOUR_PASSWORD --docker-email=YOUR_EMAIL

```

**Deployment to Kubernetes**

```

kubectl apply -f $WERCKER_OUTPUT_DIR/kubernetes/k8s-weblogic-domain-admin.yml
Kubernetes creates wlsadmin deployment, services for the weblogic admin server to be up & running

```

**Cleanup**

```

kubectl delete deployment,service wlsadmin

```

**Commands Help**

```

# for docker execution of maven built image
docker pull docker.io/fmwplt/helloworldwebapp
docker run -ti --name helloworld -p 8088:7001 fmwplt/helloworldwebapp

#GCE SDK commands
gcloud init
gcloud auth list
gcloud container clusters describe cluster-1
kubectl version
kubectl config view
kubectl proxy &

gcloud container clusters get-credentials GCE_CLUSTER_NAME --zone GCE_CLUSTER_ZONE --project GCE_PROJECT_NAME
gcloud auth activate-service-account <service account name> --key-file /path/to/keyfile.json --project helloworldwebapp-185212

gcloud container clusters get-credentials GCE_CLUSTER_NAME --zone GCE_CLUSTER_ZONE --project GCE_PROJECT_NAME \
&& kubectl attach <POD_NAME> -c <CONTAINER_NAME>

```

**Kubernetes Dashboard**

```

http://localhost:8001/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#!/workload?namespace=default

```
