NAMESPACE=com-myns
for cm in $(kubectl get configmaps -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}'); do
  if kubectl get configmap $cm -n $NAMESPACE -o yaml | grep -q "test/keyword"; then
    echo "ConfigMap '$cm' contains 'test/keyword'"
  fi
done
