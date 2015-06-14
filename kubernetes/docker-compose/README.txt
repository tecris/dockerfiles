# Kubernetes on docker (single node)

Based on:
https://github.com/GoogleCloudPlatform/kubernetes/blob/master/docs/getting-started-guides/docker.md
http://sebgoa.blogspot.co.nz/2015/04/1-command-to-kubernetes-with-docker.html

.) Start
 .) $ ./start.sh

.) Test installation
 .) $ kubectl get nodes
     NAME        LABELS    STATUS
     127.0.0.1   <none>    Ready

 .) $ kubectl get pods
POD                    IP        CONTAINER(S)         IMAGE(S)                                     HOST         LABELS    STATUS    CREATED      MESSAGE
k8s-master-127.0.0.1                                                                               127.0.0.1/   <none>    Running   5 seconds
                                 apiserver            gcr.io/google_containers/hyperkube:v0.17.0                          Running   14 seconds
                                 controller-manager   gcr.io/google_containers/hyperkube:v0.17.0                          Running   14 seconds
                                 scheduler            gcr.io/google_containers/hyperkube:v0.17.0                          Running   14 seconds


.) Run tomcat

 .) Scripting
  .) $ kubectl create -f tomcat7-service.yaml
  .) $ kubectl create -f tomcat7-controller.json
  .) $ kubectl get pods -> should show one pod for tomcat
    edit tomcat7-controller.json update replicas from 1 to 3
  .) $ kubectl update -f tomcat7-controller.json
  .) $ kubectl get pods -> should show three pods for tomcat
 .) Simple commands
  .) kubectl delete pod tomcat7-e7hxk
   - show replica controllers
  .) kubectl get rc 

 .) One liners

  .) $ kubectl run-container tomcat7 --image=192.168.1.66:5000/tomcat7 --port=8080
  .) $ kubectl expose rc tomcat7 --port=8081 --target-port=8080 --public-ip=192.168.1.66

  .) load in browser 192.168.1.66:8081

     192.168.1.66 public ip of the host machine
