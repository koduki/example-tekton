  140  sudo apt-get install kubectl

  125  gcloud services enable container.googleapis.com
  145  gcloud services enable containerregistry.googleapis.com
  
  128  mkdir example-tekton
  129  cd example-tekton/
  
PROJECT_ID=$(gcloud config configurations list | grep True | awk '{print $4}')
CLUSTER=mycluster
REGION=us-central1
gcloud container clusters create-auto mycluster --create-subnetwork name=gke --region us-central1
gcloud container clusters get-credentials $CLUSTER --region $REGION --project $PROJECT_ID
gcloud auth configure-docker

  146  git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
  147  cd kubernetes-engine-samples/hello-app

  149  docker build -t gcr.io/${PROJECT_ID}/hello-app:v1 .
  150  docker push gcr.io/${PROJECT_ID}/hello-app:v1
  151  kubectl config get-contexts
  152  kubectl create deployment autopilot-cluster-1 --image=gcr.io/${PROJECT_ID}/hello-app:v1


  161  kubectl get pods
  162  kubectl port-forward pod/autopilot-cluster-1-687444d7cc-jsp46 8080:8080
curl http://localhost:8080


README.md
https://github.com/tektoncd/dashboard/blob/main/docs/install.md#before-you-begin


gcloud container clusters delete mycluster --region us-central1

kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml
kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097


kubectl create secret docker-registry regcred --docker-server=gcr.io --docker-username=_json_key --docker-password=$(cat key.json)" --docker-email=email-address@address -n namespace


kubectl create secret docker-registry regcred \
                    --docker-server=gcr.io \
                    --docker-username=_json_key \
                    --docker-password="$(cat ~/key.json)" \
                    --docker-email=koduki@nklab.dev


asia.gcr.io 

gcloud services enable artifactregistry.googleapis.com
gcloud artifacts repositories create gcr.io 


gcloud projects add-iam-policy-binding $PROJECT_ID \
    --role=roles/artifactregistry.repoAdmin

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --role=roles/storage.admin


tkn taskrun logs build-docker-image-from-git-source-task-run -f
