#!/bin/bash

kill $(lsof -t -i:3000) 2>/dev/null; # localhost web server
kill $(lsof -t -i:4040) 2>/dev/null; # ngrok tunnel