
This is about running kubernetes on docker (single node)

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
  .) $ kubectl create -f tomcat7-service.json
  .) $ kubectl create -f tomcat7-controller.json
  .) $ kubectl get pods -> should show one pod for tomcat
    edit tomcat7-controller.json update replicas from 1 to 3
  .) $ kubectl update -f tomcat7-controller.json
  .) $ kubectl get pods -> should show three pods for tomcat

 .) One liners

  .) $ kubectl run-container tomcat7 --image=172.25.1.88:5000/tomcat7 --port=8080
  .) $ kubectl expose rc tomcat7 --port=8081 --target-port=8080 --public-ip=172.25.1.130

  .) load in browser 172.25.1.130:8081

     172.25.1.130 public ip of the host machine
