# Voraussetzung: allow privileged containers muss im PKS/TKGi Tile unter dem Plan aktiviert werden
# wenn nicht kann man keine workers deployen.


1) helm chart hinzufügen
 `helm repo add concourse https://concourse-charts.storage.googleapis.com/`

2) installieren
 `helm install concourse concourse/concourse`

3) LB erstellen 
 `k expose deploy concourse-web --type LoadBalancer --port 8080 --name concourse-lb`


4) default values.yaml aus github herunterladen
 `wget https://raw.githubusercontent.com/concourse/concourse-chart/master/values.yaml`

5) External URL in der yaml file mit der IP Addresse (oder fqdn) vom LB ersetzten, damit Local Auth funktionieren kann

6) Apply 
 `helm upgrade --install concourse concourse/concourse -f values.yaml`
