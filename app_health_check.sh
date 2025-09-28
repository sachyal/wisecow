#!/bin/bash

APP_URL="http://localhost:4499"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL)

if [ "$STATUS" -eq 200 ]; then
  echo "App is UP"
else
  echo "App is DOWN (Status code: $STATUS)"
fi
