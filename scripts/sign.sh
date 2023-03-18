#!/bin/bash

FILE=$1

openssl dgst -sha256 -sign private_key.pem -out /tmp/sign.sha256 $FILE
openssl base64 -in /tmp/sign.sha256 -out $FILE.signature