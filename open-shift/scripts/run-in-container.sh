#!/bin/bash

# Get name of a currently deployed pod by label and index
POD_INSTANCE_NAME=`oc get pods \
  -l "name=${POD_NAME:-django-frontend}" \
  -t "{{ with index .items ${POD_INDEX:-0} }}{{ .metadata.name }}{{ end }}"`

# Run command in a container of the specified pod:
oc exec -p "$POD_INSTANCE_NAME" -it -- bash -c "${@:-echo}"
