# Kubernetes on docker (single node)

Based on  [Getting started][1] & [Kubernetes with docker][2]

1. Prerequisites
 * Nothing running on port 8080
 * Docker
 * Docker-compose
 * [Kubectl binary][3] (see [Releases][4])
  ```
   $ wget http://storage.googleapis.com/kubernetes-release/release/v0.18.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl
  $ chmod +x /usr/local/bin/kubectl
  $ kubectl version
  ```
  
1. Start
 * ```$ ./start.sh```
2. Test installation
 * Check nodes
 ```
     $ kubectl get nodes
     NAME        LABELS    STATUS
     127.0.0.1   <none>    Ready
 ```
 * Check pods
 ```
     $ kubectl get pods
     POD                    IP           CONTAINER(S)         IMAGE(S)                                     HOST                  LABELS         STATUS    CREATED      MESSAGE
     k8s-master-127.0.0.1                                                                                  127.0.0.1/127.0.0.1   <none>         Running   16 minutes
                                         scheduler            gcr.io/google_containers/hyperkube:v0.17.0                                        Running   16 minutes
                                         apiserver            gcr.io/google_containers/hyperkube:v0.17.0                                        Running   16 minutes
                                         controller-manager   gcr.io/google_containers/hyperkube:v0.17.0                                        Running   16 minutes
 ```
3. Run tomcat
 * Create single node cluster
 * Create replica controller
 ```
    $ kubectl create -f tomcat7-controller.json
 ```
 * Check replica controller created
 ```
   $ kubectl get rc tomcat7
     CONTROLLER   CONTAINER(S)   IMAGE(S)                    SELECTOR       REPLICAS
     tomcat7      tomcat7        healthlink.docker/tomcat7   name=tomcat7   1
 ```
 * Create service
 ```
    $ kubectl create -f tomcat7-service.yaml
 ```
 * Check service created:
    - cli: 
    ```
     $ kubectl get services tomcat7
       NAME      LABELS         SELECTOR       IP(S)          PORT(S)
      tomcat7   name=tomcat7   name=tomcat7   10.0.0.191     8083/TCP
    ```
    - in browser: ```10.0.0.191:8083```
 * Check pod
 ```
    $ kubectl get pods -> should show one pod for tomcat
 ```
 * Scale cluster to 3 pods 
 ```
    $ kubectl scale rc tomcat7 --replicas=3
 ```
    - check no of replicas/pods: 
 ```
    $ kubectl get pods
    $ kubectl get rc tomcat7
 ```
4. Simple commands
  * Delete a pod
 ```
    $ kubectl delete pod tomcat7-e7hxk
 ```
  * Delete tomcat7 replica controller
 ```
    $ kubectl delete rc tomcat7
 ```
  * Delete tomcat7 service
 ```
    $ kubectl delete services tomcat7
 ```
  * Show all replica controllers
 ```
    $ kubectl get rc 
 ```

[1]:https://github.com/GoogleCloudPlatform/kubernetes/blob/master/docs/getting-started-guides/docker.md
[2]:http://sebgoa.blogspot.co.nz/2015/04/1-command-to-kubernetes-with-docker.html
[3]:http://storage.googleapis.com/kubernetes-release/release/v0.18.2/bin/linux/amd64/kubectl
[4]:https://github.com/GoogleCloudPlatform/kubernetes/releases
