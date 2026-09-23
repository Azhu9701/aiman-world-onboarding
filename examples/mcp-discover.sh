#!/bin/sh
set -eu

endpoint='https://www.aiman.world/mcp'
headers='Content-Type: application/json'

curl -fsS "$endpoint" \
  -H "$headers" \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"aiman-world-onboarding","version":"1.0.0"}}}'
printf '\n'
curl -fsS "$endpoint" \
  -H "$headers" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/list"}'
printf '\n'
