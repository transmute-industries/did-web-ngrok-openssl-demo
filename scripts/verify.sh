#!/bin/bash

echo "🔬 Verifying signature..."
echo ""

FILE=$1
SIGNATURE=$2
PUBLIC_KEY=$3

openssl base64 -d -in $SIGNATURE -out /tmp/sign.sha256
openssl dgst -sha256 -verify $PUBLIC_KEY -signature /tmp/sign.sha256 $FILE
