

1) Erstellen eines simplen nginx Helm Charts
 `helm create nginx`


2) Erstellen eines nginx namespace in k8s
 `kubectl create ns nginx`

3) Deploye 8 replicas vom nginx Server!
`helm upgrade --install nginx ./nginx -n nginx --set replicaCount=8`

4) Deployment Chart 
`helm ls -n nginx`
`kubectl get pod -n nginx`

5) Labels für den Service Discovery:
   unter metadata.labels im deployment.yml
    kube-monkey/enabled: "enabled"             
    kube-monkey/identifier: "break-things"    
    kube-monkey/mtbf: "1"                       
    kube-monkey/kill-mode: "fixed-percent"  
    kube-monkey/kill-value: "25" 

   unter spec.template.metadata.labels im deployment.yml:
        kube-monkey/enabled: "enabled"          
        kube-monkey/identifier: "break-things"


6) Upgraden nginx deployment
 `helm upgrade --install nginx ./nginx -n nginx`

7) `kubectl get pod -n nginx`

8) `git clone https://github.com/asobti/kube-monkey`


9) Um keine Probleme bei der Erstelleung von zu vielen namespaces und Ressourcen,
   ersetzten wir den Namespace mit dem nginx Namespace, damit alles in einem NS läuft.
   in den values.yml der key namespace: nginx hinzufügen und durch find and replace ersetzen

10) Deploy 

```
helm upgrade --install kube-monkey ./kube-monkey/helm/kubemonkey \
  --set config.debug.enabled=true \
  --set config.debug.schedule_immediate_kill=true \
  --set config.dryRun=false \
  --set config.whitelistedNamespaces="{nginx}"
```

11) `helm ls -n kube-monkey`