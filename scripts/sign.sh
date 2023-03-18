#!/bin/bash

FILE=$1
SIGNATURE=$2
PRIVATE_KEY=$3

openssl dgst -sha256 -sign $PRIVATE_KEY -out /tmp/sign.sha256 $FILE
openssl base64 -in /tmp/sign.sha256 -out $SIGNATURE