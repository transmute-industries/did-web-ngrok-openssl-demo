#!/bin/bash

# DID Resolver Endpoint 
DID_RESOLVER="https://lucid.did.cards/api/identifiers"

DID_URL=$1 # did:example:123#key-0
DID_PUBLIC_KEY=$2 # public_key.pem

# Resolve the DID Document
DID_DOCUMENT=$(curl -s $DID_RESOLVER/$DID_URL | jq ".didDocument")

# Get the public key id from the fragment
PUBLIC_KEY_ID=$(echo "$DID_URL" | cut -d "#" -f 2)

# dereference to reasonable key format
PUBLIC_KEY=$(echo "$DID_DOCUMENT" | jq '.verificationMethod[] | select(.id == "#'$PUBLIC_KEY_ID'") | .publicKeyJwk')
echo $PUBLIC_KEY > /tmp/publicKey.json

# convert to another key format
npx --yes eckles /tmp/publicKey.json spki > $DID_PUBLIC_KEY

# clean up temp files
rm /tmp/publicKey.json
