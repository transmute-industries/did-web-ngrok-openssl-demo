#!/bin/bash

openssl dgst -sha256 -sign private_key.pem -out /tmp/sign.did.sha256 ./www/.well-known/did.json
openssl base64 -in /tmp/sign.did.sha256 -out ./did.sha256.signature