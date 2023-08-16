#!/bin/bash
set -e

CREDS=$(aws secretsmanager get-secret-value --secret-id prod-tensorians-sales-creds --query SecretString | jq -r)

export TWITTER_ACCESS_TOKEN="$(echo $CREDS | jq .ACCESS_TOKEN | tr -d '"')" \
  TWITTER_ACCESS_TOKEN_SECRET="$(echo $CREDS | jq .ACCESS_TOKEN_SECRET | tr -d '"')" \
  TWITTER_API_KEY="$(echo $CREDS | jq .API_KEY | tr -d '"')" \
  TWITTER_API_SECRET="$(echo $CREDS | jq .API_SECRET | tr -d '"')" \
  TENSOR_API_KEY="$(echo $CREDS | jq .TENSOR_API_KEY | tr -d '"')" \
  SLUGS="$(echo $CREDS | jq .SLUGS | tr -d '"')" \
  DISCORD_WEBHOOKS="$(echo $CREDS | jq .DISCORD_WEBHOOKS | tr -d '"')";

npm run start
