#!/bin/bash

PUBLIC_KEY=$(curl -s https://lucid.did.cards/api/identifiers/did:web:919ddedcf2e6.ngrok.app | jq ".didDocument.verificationMethod[0].publicKeyJwk")

echo $PUBLIC_KEY > publicKey.json

npx --yes eckles publicKey.json spki > public_key.pem

openssl base64 -d -in ./did.sha256.signature -out /tmp/sign.verify.sha256
openssl dgst -sha256 -verify ./public_key.pem -signature /tmp/sign.verify.sha256 ./www/.well-known/did.json

rm public_key.pem
rm publicKey.json