#!/bin/bash

./scripts/generate.sh

echo ""

echo "🌱 Hello world\!" > ./message.txt
./scripts/sign.sh ./message.txt ./message.txt.signature ./private_key.pem

DID=$(cat ./www/.well-known/did.json | jq -r ".id")
./scripts/dereference.sh $DID#key-0 public_key.pem

./scripts/verify.sh ./message.txt ./message.txt.signature ./public_key.pem

./scripts/shutdown.sh