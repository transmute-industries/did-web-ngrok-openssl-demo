#!/bin/bash

echo ""
echo "🕵️  Analyzing DID..."

DID_URL=$1 # did:example:123#key-0

ORIGIN=$(echo "$DID_URL" | sed "s/did:web:/https:\/\//")
DOMAIN=$(echo "$ORIGIN" | sed "s/https:\/\///")
ENDPOINT=$ORIGIN/.well-known/did.json

echo ""
echo "DOMAIN: $DOMAIN"
echo ""

# use dig to look at DNS
dig $DOMAIN

# use curl to look at TLS details
curl -L -v -s -o /dev/null $ENDPOINT

# use tracerout to see connection details
traceroute -m 5 $DOMAIN 