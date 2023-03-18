#!/bin/bash

echo "🌎 Creating DID..."
echo ""

# Start serving "www" on localhost:3000
npx serve ./www --cors > /dev/null &

# Start ngrok tunnel to localhost:3000
ngrok http 3000 > /dev/null &

# Wait for servers...
sleep 4

# Get the default assigned tunnel origin
ORIGIN=$(curl -s http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")

# Convert a web origin to a DID Web
DID=$(echo "$ORIGIN" | sed "s/https:\/\//did:web:/")

# Generate a Private Key
openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-256 > private_key.pem

# Extract a Public Key
openssl pkey -pubout -in private_key.pem > public_key.pem

# Convert the public key to JWK
PUBLIC_KEY=$(npx --yes eckles public_key.pem)
rm public_key.pem

# Create the DID Document
echo '{
  "@context": ["https://www.w3.org/ns/did/v1",{"@vocab":"https://www.w3.org/ns/did/controller-dependent#"}],
  "💀": "🔥",
  "id": '$DID',
  "verificationMethod": [{
    "id": "#key-0",
    "type": "JsonWebKey",
    "controller": '$DID',
    "publicKeyJwk": '$PUBLIC_KEY'
  }],
  "assertionMethod": ["#key-0"],
  "authentication": ["#key-0"]
}' | jq . > ./www/.well-known/did.json

./scripts/whoami.sh