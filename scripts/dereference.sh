#!/bin/bash


DID_URL=$1
DID_PUBLIC_KEY=$2

PUBLIC_KEY=$(curl -s https://lucid.did.cards/api/identifiers/$DID_URL | jq ".didDocument.verificationMethod[0].publicKeyJwk")

echo $PUBLIC_KEY > publicKey.json

npx --yes eckles publicKey.json spki > $DID_PUBLIC_KEY

cat $DID_PUBLIC_KEY
rm publicKey.json