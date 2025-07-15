# kubectl commands used everday for resource utilisation or optimisation
kubectl get deployments -n com-myns -o custom-columns=NAME:.metadata.name,NODESELECTOR:.spec.template.spec.nodeSelector --no-headers | awk -F'\t' '
BEGIN {print "DEPLOYMENT\tNODE SELECTOR"}
{
    name=$1
    nodeSelector=$2
    if (nodeSelector == "") {
        nodeSelector="{}"
    }
    print name "\t" nodeSelector   #prints name of deployment & nodeselector used in it
}'
