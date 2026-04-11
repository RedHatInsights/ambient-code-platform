#!/bin/bash
# Validate OpenShift templates

set -e

echo "Validating OpenShift templates..."

for template in template-operator.yaml template-services.yaml; do
  echo "  Checking $template..."
  oc process -f "$template" --param=IMAGE_TAG=validation-test --local > /dev/null
  echo "    ✓ Valid"
done

echo "✓ All templates valid"
