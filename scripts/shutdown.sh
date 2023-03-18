#!/bin/bash

kill $(lsof -t -i:3000) 2>/dev/null; # localhost web server
kill $(lsof -t -i:4040) 2>/dev/null; # ngrok tunnel
rm ./www/.well-known/did.json 2>/dev/null; # destroy the identifier
rm private_key.pem 2>/dev/null; # destroy private key
rm public_key.pem 2>/dev/null; # destroy public key
rm message.txt 2>/dev/null; # destroy message
rm message.txt.signature 2>/dev/null; # destroy signed message
echo "🪦 RIP DID."
