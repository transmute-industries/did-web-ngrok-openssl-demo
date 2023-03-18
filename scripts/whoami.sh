#!/bin/bash

# Get current DID Web
DID=$(cat ./www/.well-known/did.json | jq -r ".id")

# Display current DID
echo $DID